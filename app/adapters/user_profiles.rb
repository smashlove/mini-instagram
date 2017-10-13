module UserProfiles

  class Adapter

    def fetch_users
        users = JSON.parse(RestClient.get("https://randomuser.me/api/?results=15"))
        users["results"].each do |user|
          new_user = User.create(:first_name => user["name"]["first"].titleize, :last_name => user["name"]["last"].titleize, :profile_image => user["picture"]["large"], :username => user["login"]["username"])
          new_user.save
        end
    end

  end

end
