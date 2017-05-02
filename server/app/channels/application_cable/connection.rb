module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private
      def find_verified_user
        puts "ROHIT DHAND"
        # puts self.user_id

        if verified_user = User.find_by(id: cookies.encrypted[:user_id])
          verified_user
        else
            puts "there was no user in the USERID"
          reject_unauthorized_connection
        end
      end
  end
end
