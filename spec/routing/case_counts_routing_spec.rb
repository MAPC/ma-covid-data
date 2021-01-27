require "rails_helper"

RSpec.describe CaseCountsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/case_counts").to route_to("case_counts#index")
    end

    it "routes to #new" do
      expect(get: "/case_counts/new").to route_to("case_counts#new")
    end

    it "routes to #show" do
      expect(get: "/case_counts/1").to route_to("case_counts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/case_counts/1/edit").to route_to("case_counts#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/case_counts").to route_to("case_counts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/case_counts/1").to route_to("case_counts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/case_counts/1").to route_to("case_counts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/case_counts/1").to route_to("case_counts#destroy", id: "1")
    end
  end
end
