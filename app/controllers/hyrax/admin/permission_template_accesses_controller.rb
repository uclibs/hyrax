module Hyrax
  module Admin
    class PermissionTemplateAccessesController < ApplicationController
      load_and_authorize_resource class: 'Hyrax::PermissionTemplateAccess'

      def destroy
        ActiveRecord::Base.transaction do
          @permission_template_access.destroy
          update_management if @permission_template_access.manage?
        end

        if @permission_template_access.destroyed?
          redirect_to hyrax.edit_admin_admin_set_path(admin_set_id,
                                                      anchor: 'participants'),
                      notice: translate('participants', scope: 'hyrax.admin.admin_sets.form.permission_update_notices')
        else
          redirect_to hyrax.edit_admin_admin_set_path(admin_set_id,
                                                      anchor: 'participants'),
                      alert: @permission_template_access.errors.full_messages.to_sentence

        end
      end

      private

        # @return [String] the identifier for the AdminSet for the currently loaded resource
        def admin_set_id
          @admin_set_id ||= @permission_template_access.permission_template.admin_set_id
        end

        def update_management
          # Forms::PermissionTemplateForm.new(@permission_template_access.permission_template).remove_manager!
          Forms::PermissionTemplateForm.new(@permission_template_access.permission_template).update_management
        end
    end
  end
end
