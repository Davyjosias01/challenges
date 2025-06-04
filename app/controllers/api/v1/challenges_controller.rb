class Api::V1::ChallengesController < ApplicationController
  before_action :set_challenge, only: %i[ show update destroy ]

  def index
    # Show all the challenges
    @challenges = Challenge.all
    render json: @challenges
  end

  def create
    # Create a single challenge
    challenge = Challenge.new(challenge_params)

    if challenge.save
      render json: { message: "Challenge added successfully", data: challenge }
    else
      render json: { message: "Failed to add challenge", data: challenge.errors }
    end
  end

  def show
    # Show a single challenge
    # challenge = Challenge.find(params[:id])
    if @challenge
      render json: { message: "Challenge found!", data: @challenge }
    else
      render json: { message: "Challenge not found!", data: @challenge.errors }
    end
  end

  def update
    # Update a single challenge
    # challenge = Challenge.find(params[:id])
    if @challenge.update(challenge_params)
      render json: { message: "Challenge updated", data: @challenge }
    else
      render json: { message: "Challenge not updated!", data: @challenge.errors }
    end
  end

  def destroy
    # Delete single challenge
    if @challenge.destroy
      render json: { message: "Challenge destroied!", data: @challenge }
    else
      render json: { message: "Challenge not destroied!", data: @challenge.errors }
    end
  end

  private
  def set_challenge
      @challenge = Challenge.find_by(id: params[:id])
      if @challenge.nil?
        render json: { message: "Challenge not found!" }, status: 404
      end
  end

  def challenge_params
    params.required(:challenge).permit(:title, :description, :start_date, :end_date)
  end
end
