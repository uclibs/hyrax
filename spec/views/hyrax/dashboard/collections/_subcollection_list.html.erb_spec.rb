RSpec.describe 'hyrax/dashboard/collections/_subcollection_list.html.erb', type: :view do
  let(:subcollection_docs) { ["Hello", "World"] }

  before do
  end

  context 'when subcollection list is empty' do
    it "posts a warning message" do
    end
  end

  context 'when subcollection list is not empty' do
    it "posts each collection's title and a link to the collection" do
    end

    xit 'includes a count of the subcollection members' do
      # TODO:
    end
  end
end
