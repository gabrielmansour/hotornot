class VotablesController < ApplicationController
  inherit_resources

  def index
    @votables = Votable.not_voted_on_by(current_user).limit(2)
  end

  def create
    create! do |format|
      format.html { redirect_to votables_path }
    end
  end

  def vote
    @votable = Votable.find(params[:id])

    value = params[:type] == "hot" ? 1 : -1
    @votable.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "You Voted! Doesn't that feel good?"
  end
end
