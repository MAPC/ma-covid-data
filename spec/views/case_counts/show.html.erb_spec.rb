require 'rails_helper'

RSpec.describe "case_counts/show", type: :view do
  before(:each) do
    @case_count = assign(:case_count, CaseCount.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
