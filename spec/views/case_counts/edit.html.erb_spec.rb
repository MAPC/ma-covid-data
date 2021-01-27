require 'rails_helper'

RSpec.describe "case_counts/edit", type: :view do
  before(:each) do
    @case_count = assign(:case_count, CaseCount.create!())
  end

  it "renders the edit case_count form" do
    render

    assert_select "form[action=?][method=?]", case_count_path(@case_count), "post" do
    end
  end
end
