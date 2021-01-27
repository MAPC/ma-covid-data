require 'rails_helper'

RSpec.describe "case_counts/index", type: :view do
  before(:each) do
    assign(:case_counts, [
      CaseCount.create!(),
      CaseCount.create!()
    ])
  end

  it "renders a list of case_counts" do
    render
  end
end
