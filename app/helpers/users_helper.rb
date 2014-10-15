module UsersHelper
  def gravatar_for(user, opts = {} )
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}" +
                   (opts[:size] ? "?s=#{opts[:size].to_s}" : "")

    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
