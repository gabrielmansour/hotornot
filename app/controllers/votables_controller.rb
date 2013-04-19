class VotablesController < ApplicationController
  inherit_resources

  def create
    create! do |format|
      format.html { redirect_to votables_path }
    end
  end
end
