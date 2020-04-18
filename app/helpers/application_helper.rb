module ApplicationHelper

    def gravatar_for(user, options = {size: 20})
        email_address = user.email.downcase
        # create the md5 hash
        hash = Digest::MD5.hexdigest(email_address)
        # compile URL which can be used in <img src="RIGHT_HERE"...
        image_src = "https://www.gravatar.com/avatar/#{hash}"
        
        image_tag(image_src, alt: user.username, class: "rounded shadow mx-auto d-block")
    end

end
