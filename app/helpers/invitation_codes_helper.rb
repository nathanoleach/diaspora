module InvitationCodesHelper
  def invite_hidden_tag(invite)
    if invite.present?
      hidden_field_tag 'invite[token]', invite.token
    end
  end

  def invite_link(invite_code)
    #text_field_tag :invite_code, invite_code_url(invite_code), :readonly => true
    text_field_tag :invite_code, 'http://social.ritfu.com/i/' + invite_code.to_param.to_s, :readonly => true
  end

  def invited_by_message
    inviter = current_user.invited_by
    if inviter.present?
      contact = current_user.contact_for(inviter.person) || Contact.new
      render :partial => 'people/add_contact', :locals => {:inviter => inviter.person, :contact => contact}
    end
  end
end
