require 'rails_helper'

RSpec.describe "case_counts/new", type: :view do
  before(:each) do
    assign(:case_count, CaseCount.new())
  end

  it "renders new case_count form" do
    render

    assert_select "form[action=?][method=?]", case_counts_path, "post" do
    end
  end
end
