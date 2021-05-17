module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    # include MD5 gem, should be part of standard ruby install
    require 'digest/md5'

    # get the email from URL-parameters or what have you and make lowercase
    email_address = user.email
    size = options[:size]
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)

    # compile URL which can be used in <img src="RIGHT_HERE"...
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "shadow rounded mx-auto d-block")
  end
end
