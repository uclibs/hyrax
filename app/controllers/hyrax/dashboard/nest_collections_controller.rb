module Hyrax
  module Dashboard
    class NestCollectionsController < ApplicationController
      include Blacklight::Base
      class_attribute :form_class
      self.form_class = Hyrax::Forms::Dashboard::NestCollectionForm

      def new_within
        byebug
        @form = build_within_form
      end

      def create_within
        byebug
        @form = build_within_form
        if @form.save
          notice = I18n.t('create_within', scope: 'hyrax.dashboard.nest_collections_form', child_title: @form.child.title, parent_title: @form.parent.title)
          redirect_to dashboard_collection_path(@form.child), notice: notice
        else
          render 'new_within'
        end
      end

      def process_nesting 
        byebug
         @parent_id = params[:parent_id]
         @child_id = params[:child_id]

         after_create
      end
      

      private

        def build_within_form
          child = Collection.find(params.fetch(:child_id))
          authorize! :edit, child
          parent = params.key?(:parent_id) ? Collection.find(params[:parent_id]) : nil
          form_class.new(child: child, parent: parent, context: self)
        end
    end
  end
end
