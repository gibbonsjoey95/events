class AttendancesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def new
        @attendance = Attendance.new
        @events = Event.all
    end

    def create
        @attendance = current_user.attendances.build(attendance_params)

        if @attendance.save
            redirect_to events_path, notice: 'You are now attending the event.'
        else
            render :new
        end
    end

    private

    def attendance_params
        params.require(:attendance).permit(:attended_event_id)
    end
end
