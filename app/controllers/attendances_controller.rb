class AttendancesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :destroy]

    def new
        @attendance = Attendance.new
        @events = Event.all
    end

    def create
        @attendance = current_user.attendances.build(attendance_params)

        if @attendance.save
            redirect_to attended_events_user_path(current_user), notice: 'You are now attending the event.'
          else
            redirect_to attended_events_user_path(current_user), alert: 'Unable to attend the event.'
          end
    end

    def destroy
        @attendance = current_user.attendances.find_by(id: params[:id])
    
        if @attendance
            @attendance.destroy
            redirect_to attended_events_user_path(current_user), notice: 'You have successfully unattended the event.'
          else
            redirect_to attended_events_user_path(current_user), alert: 'Unable to unattend the event.'
          end
      end

    private

    def attendance_params
        params.require(:attendance).permit(:attended_event_id)
    end
end
