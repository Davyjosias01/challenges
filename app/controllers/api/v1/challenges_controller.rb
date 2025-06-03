class Api::V1::ChallengesController < ApplicationController
  def index
    # Show all the challenges
    @challenges = Challenge.all
    render json: @challenges
  end

  def create
    # Create a single challenge
  end

  def show
    # Show a single challenge
  end

  def update
    # Update a single challenge
  end

  def destroy
    # Delete single challenge
  end
end
