RSpec.describe Hyrax::CollectionMemberSearchBuilder do
  let(:scope) { double(blacklight_config: CatalogController.blacklight_config) }
  let(:builder) { described_class.new(scope, search_includes_models: include_models) }

  describe '#member_of_collection' do
    let(:include_models) { :both }
    subject { builder.member_of_collection }

    xit 'updates solr_parameters[:fq]' do
    end
  end

  xit 'determines which models to include in the search' do
  end
end
