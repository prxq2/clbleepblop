(in-package :clbleepblop)

(def-api-class-and-deserializer "User"
  (("id")
   ("is_bot")
   ("first_name")
   ("last_name")
   ("username")
   ("language_code")
   ("is_premium")
   ("added_to_attachment_menu")
   ("can_join_groups")
   ("can_read_all_group_messages")
   ("supports_inline_queries")))

(def-api-class-and-deserializer "Chat"
  (("id")
   ("type")
   ("title")
   ("username")
   ("first_name")
   ("last_name")
   ("is_forum")
   ("photo" :slot-type "ChatPhoto")
   ("active_usernames")
   ("emoji_status_custom_emoji_id")
   ("bio")
   ("has_private_forwards")
   ("has_restricted_voice_and_video_messages")
   ("join_to_send_messages")
   ("join_by_request")
   ("description")
   ("invite_link")
   ("pinned_message" :slot-type "Message")
   ("permissions" :slot-type "ChatPermissions")
   ("slow_mode_delay")
   ("message_auto_delete_time")
   ("has_aggressive_anti_spam_enabled")
   ("has_hidden_members")
   ("has_protected_content")
   ("sticker_set_name")
   ("can_set_sticker_set")
   ("linked_chat_id")
   ("location" :slot-type "ChatLocation")))

(def-api-class-and-deserializer "Message"
  (("message_id")
   ("message_thread_id")
   ("from" :slot-type "User")
   ("sender_chat" :slot-type "Chat")
   ("date")
   ("chat" :slot-type "Chat")
   ("forward_from" :slot-type "User")
   ("forward_from_chat" :slot-type "Chat")
   ("forward_from_message_id")
   ("forward_signature")
   ("forward_sender_name")
   ("forward_date")
   ("is_topic_message")
   ("is_automatic_forward")
   ("reply_to_message" :slot-type "Message")
   ("via_bot" :slot-type "User")
   ("edit_date")
   ("has_protected_content")
   ("media_group_id")
   ("author_signature")
   ("text")
   ("entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("animation" :slot-type "Animation")
   ("audio" :slot-type "Audio")
   ("document" :slot-type "Document")
   ("photo" :slot-type "PhotoSize" :slot-dimensions 1)
   ("sticker" :slot-type "Sticker")
   ("video" :slot-type "Video")
   ("video_note" :slot-type "VideoNote")
   ("voice" :slot-type "Voice")
   ("caption")
   ("caption_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("has_media_spoiler")
   ("contact" :slot-type "Contact")
   ("dice" :slot-type "Dice")
   ("game" :slot-type "Game")
   ("poll" :slot-type "Poll")
   ("venue" :slot-type "Venue")
   ("location" :slot-type "Location")
   ("new_chat_members" :slot-type "User" :slot-dimensions 1)
   ("left_chat_member" :slot-type "User")
   ("new_chat_title")
   ("new_chat_photo" :slot-type "PhotoSize" :slot-dimensions 1)
   ("delete_chat_photo")
   ("group_chat_created")
   ("supergroup_chat_created")
   ("channel_chat_created")
   ("message_auto_delete_timer_changed" :slot-type "MessageAutoDeleteTimerChanged")
   ("migrate_to_chat_id")
   ("migrate_from_chat_id")
   ("pinned_message" :slot-type "Message")
   ("invoice" :slot-type "Invoice")
   ("successful_payment" :slot-type "SuccessfulPayment")
   ("connected_website")
   ("write_access_allowed" :slot-type "WriteAccessAllowed")
   ("passport_data" :slot-type "PassportData")
   ("proximity_alert_triggered" :slot-type "ProximityAlertTriggered")
   ("forum_topic_created" :slot-type "ForumTopicCreated")
   ("forum_topic_edited" :slot-type "ForumTopicEdited")
   ("forum_topic_closed" :slot-type "ForumTopicClosed")
   ("forum_topic_reopened" :slot-type "ForumTopicReopened")
   ("general_forum_topic_hidden" :slot-type "GeneralForumTopicHidden")
   ("general_forum_topic_unhidden" :slot-type "GeneralForumTopicUnhidden")
   ("video_chat_scheduled" :slot-type "VideoChatScheduled")
   ("video_chat_started" :slot-type "VideoChatStarted")
   ("video_chat_ended" :slot-type "VideoChatEnded")
   ("video_chat_participants_invited" :slot-type "VideoChatParticipantsInvited")
   ("web_app_data" :slot-type "WebAppData")
   ("reply_markup" :slot-type "InlineKeyboardMarkup")))

(def-api-class-and-deserializer "MessageId"
  (("message_id")))

(def-api-class-and-deserializer "MessageEntity"
  (("type")
   ("offset")
   ("length")
   ("url")
   ("user" :slot-type "User")
   ("language")
   ("custom_emoji_id")))

(def-api-class-and-deserializer "PhotoSize"
  (("file_id")
   ("file_unique_id")
   ("width")
   ("height")
   ("file_size")))

(def-api-class-and-deserializer "Animation"
  (("file_id")
   ("file_unique_id")
   ("width")
   ("height")
   ("duration")
   ("thumb" :slot-type "PhotoSize")
   ("file_name")
   ("mime_type")
   ("file_size")))

(def-api-class-and-deserializer "Audio"
  (("file_id")
   ("file_unique_id")
   ("duration")
   ("performer")
   ("title")
   ("file_name")
   ("mime_type")
   ("file_size")
   ("thumb" :slot-type "PhotoSize")))

(def-api-class-and-deserializer "Document"
  (("file_id")
   ("file_unique_id")
   ("thumb" :slot-type "PhotoSize")
   ("file_name")
   ("mime_type")
   ("file_size")))

(def-api-class-and-deserializer "Video"
  (("file_id")
   ("file_unique_id")
   ("width")
   ("height")
   ("duration")
   ("thumb" :slot-type "PhotoSize")
   ("file_name")
   ("mime_type")
   ("file_size")))

(def-api-class-and-deserializer "VideoNote"
  (("file_id")
   ("file_unique_id")
   ("length")
   ("duration")
   ("thumb" :slot-type "PhotoSize")
   ("file_size")))

(def-api-class-and-deserializer "Voice"
  (("file_id")
   ("file_unique_id")
   ("duration")
   ("mime_type")
   ("file_size")))

(def-api-class-and-deserializer "Contact"
  (("phone_number")
   ("first_name")
   ("last_name")
   ("user_id")
   ("vcard")))

(def-api-class-and-deserializer "Dice"
  (("emoji")
   ("value")))

(def-api-class-and-deserializer "PollOption"
  (("text")
   ("voter_count")))

(def-api-class-and-deserializer "PollAnswer"
  (("poll_id")
   ("user" :slot-type "User")
   ("option_ids")))

(def-api-class-and-deserializer "Poll"
  (("id")
   ("question")
   ("options" :slot-type "PollOption" :slot-dimensions 1)
   ("total_voter_count")
   ("is_closed")
   ("is_anonymous")
   ("type")
   ("allows_multiple_answers")
   ("correct_option_id")
   ("explanation")
   ("explanation_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("open_period")
   ("close_date")))

(def-api-class-and-deserializer "Location"
  (("longitude")
   ("latitude")
   ("horizontal_accuracy")
   ("live_period")
   ("heading")
   ("proximity_alert_radius")))

(def-api-class-and-deserializer "Venue"
  (("location" :slot-type "Location")
   ("title")
   ("address")
   ("foursquare_id")
   ("foursquare_type")
   ("google_place_id")
   ("google_place_type")))

(def-api-class-and-deserializer "WebAppData"
  (("data")
   ("button_text")))

(def-api-class-and-deserializer "ProximityAlertTriggered"
  (("traveler" :slot-type "User")
   ("watcher" :slot-type "User")
   ("distance")))

(def-api-class-and-deserializer "MessageAutoDeleteTimerChanged"
  (("message_auto_delete_time")))

(def-api-class-and-deserializer "ForumTopicCreated"
  (("name")
   ("icon_color")
   ("icon_custom_emoji_id")))

(def-api-class-and-deserializer "ForumTopicClosed"
  ())

(def-api-class-and-deserializer "ForumTopicEdited"
  (("name")
   ("icon_custom_emoji_id")))

(def-api-class-and-deserializer "ForumTopicReopened"
  ())

(def-api-class-and-deserializer "GeneralForumTopicHidden"
  ())

(def-api-class-and-deserializer "GeneralForumTopicUnhidden"
  ())

(def-api-class-and-deserializer "WriteAccessAllowed"
  ())

(def-api-class-and-deserializer "VideoChatScheduled"
  (("start_date")))

(def-api-class-and-deserializer "VideoChatStarted"
  ())

(def-api-class-and-deserializer "VideoChatEnded"
  (("duration")))

(def-api-class-and-deserializer "VideoChatParticipantsInvited"
  (("users" :slot-type "User" :slot-dimensions 1)))

(def-api-class-and-deserializer "UserProfilePhotos"
  (("total_count")
   ("photos" :slot-type "PhotoSize" :slot-dimensions 2)))

(def-api-class-and-deserializer "File"
  (("file_id")
   ("file_unique_id")
   ("file_size")
   ("file_path")))

(def-api-class-and-deserializer "WebAppInfo"
  (("url")))

(def-api-class-and-deserializer "ReplyKeyboardMarkup"
  (("keyboard" :slot-type "KeyboardButton" :slot-dimensions 2)
   ("is_persistent")
   ("resize_keyboard")
   ("one_time_keyboard")
   ("input_field_placeholder")
   ("selective")))

(def-api-class-and-deserializer "KeyboardButton"
  (("text")
   ("request_contact")
   ("request_location")
   ("request_poll" :slot-type "KeyboardButtonPollType")
   ("web_app" :slot-type "WebAppInfo")))

(def-api-class-and-deserializer "KeyboardButtonPollType"
  (("type")))

(def-api-class-and-deserializer "ReplyKeyboardRemove"
  (("remove_keyboard")
   ("selective")))

(def-api-class-and-deserializer "InlineKeyboardMarkup"
  (("inline_keyboard" :slot-type "InlineKeyboardButton" :slot-dimensions 2)))

(def-api-class-and-deserializer "InlineKeyboardButton"
  (("text")
   ("url")
   ("callback_data")
   ("web_app" :slot-type "WebAppInfo")
   ("login_url" :slot-type "LoginUrl")
   ("switch_inline_query")
   ("switch_inline_query_current_chat")
   ("callback_game" :slot-type "CallbackGame")
   ("pay")))

(def-api-class-and-deserializer "LoginUrl"
  (("url")
   ("forward_text")
   ("bot_username")
   ("request_write_access")))

(def-api-class-and-deserializer "CallbackQuery"
  (("id")
   ("from" :slot-type "User")
   ("message" :slot-type "Message")
   ("inline_message_id")
   ("chat_instance")
   ("data")
   ("game_short_name")))

(def-api-class-and-deserializer "ForceReply"
  (("force_reply")
   ("input_field_placeholder")
   ("selective")))

(def-api-class-and-deserializer "ChatPhoto"
  (("small_file_id")
   ("small_file_unique_id")
   ("big_file_id")
   ("big_file_unique_id")))

(def-api-class-and-deserializer "ChatInviteLink"
  (("invite_link")
   ("creator" :slot-type "User")
   ("creates_join_request")
   ("is_primary")
   ("is_revoked")
   ("name")
   ("expire_date")
   ("member_limit")
   ("pending_join_request_count")))

(def-api-class-and-deserializer "ChatAdministratorRights"
  (("is_anonymous")
   ("can_manage_chat")
   ("can_delete_messages")
   ("can_manage_video_chats")
   ("can_restrict_members")
   ("can_promote_members")
   ("can_change_info")
   ("can_invite_users")
   ("can_post_messages")
   ("can_edit_messages")
   ("can_pin_messages")
   ("can_manage_topics")))

(def-api-class-and-deserializer "ChatMember"
  ())

(def-api-class-and-deserializer "ChatMemberOwner"
  (("status")
   ("user" :slot-type "User")
   ("is_anonymous")
   ("custom_title")))

(def-api-class-and-deserializer "ChatMemberAdministrator"
  (("status")
   ("user" :slot-type "User")
   ("can_be_edited")
   ("is_anonymous")
   ("can_manage_chat")
   ("can_delete_messages")
   ("can_manage_video_chats")
   ("can_restrict_members")
   ("can_promote_members")
   ("can_change_info")
   ("can_invite_users")
   ("can_post_messages")
   ("can_edit_messages")
   ("can_pin_messages")
   ("can_manage_topics")
   ("custom_title")))

(def-api-class-and-deserializer "ChatMemberMember"
  (("status")
   ("user" :slot-type "User")))

(def-api-class-and-deserializer "ChatMemberRestricted"
  (("status")
   ("user" :slot-type "User")
   ("is_member")
   ("can_change_info")
   ("can_invite_users")
   ("can_pin_messages")
   ("can_manage_topics")
   ("can_send_messages")
   ("can_send_media_messages")
   ("can_send_polls")
   ("can_send_other_messages")
   ("can_add_web_page_previews")
   ("until_date")))

(def-api-class-and-deserializer "ChatMemberLeft"
  (("status")
   ("user" :slot-type "User")))

(def-api-class-and-deserializer "ChatMemberBanned"
  (("status")
   ("user" :slot-type "User")
   ("until_date")))

(def-api-class-and-deserializer "ChatMemberUpdated"
  (("chat" :slot-type "Chat")
   ("from" :slot-type "User")
   ("date")
   ("old_chat_member" :slot-type "ChatMember")
   ("new_chat_member" :slot-type "ChatMember")
   ("invite_link" :slot-type "ChatInviteLink")))

(def-api-class-and-deserializer "ChatJoinRequest"
  (("chat" :slot-type "Chat")
   ("from" :slot-type "User")
   ("date")
   ("bio")
   ("invite_link" :slot-type "ChatInviteLink")))

(def-api-class-and-deserializer "ChatPermissions"
  (("can_send_messages")
   ("can_send_media_messages")
   ("can_send_polls")
   ("can_send_other_messages")
   ("can_add_web_page_previews")
   ("can_change_info")
   ("can_invite_users")
   ("can_pin_messages")
   ("can_manage_topics")))

(def-api-class-and-deserializer "ChatLocation"
  (("location" :slot-type "Location")
   ("address")))

(def-api-class-and-deserializer "ForumTopic"
  (("message_thread_id")
   ("name")
   ("icon_color")
   ("icon_custom_emoji_id")))

(def-api-class-and-deserializer "BotCommand"
  (("command")
   ("description")))

(def-api-class-and-deserializer "BotCommandScope"
  ())

(def-api-class-and-deserializer "BotCommandScopeDefault"
  (("type")))

(def-api-class-and-deserializer "BotCommandScopeAllPrivateChats"
  (("type")))

(def-api-class-and-deserializer "BotCommandScopeAllGroupChats"
  (("type")))

(def-api-class-and-deserializer "BotCommandScopeAllChatAdministrators"
  (("type")))

(def-api-class-and-deserializer "BotCommandScopeChat"
  (("type")
   ("chat_id")))

(def-api-class-and-deserializer "BotCommandScopeChatAdministrators"
  (("type")
   ("chat_id")))

(def-api-class-and-deserializer "BotCommandScopeChatMember"
  (("type")
   ("chat_id")
   ("user_id")))

(def-api-class-and-deserializer "MenuButton"
  ())

(def-api-class-and-deserializer "MenuButtonCommands"
  (("type")))

(def-api-class-and-deserializer "MenuButtonWebApp"
  (("type")
   ("text")
   ("web_app" :slot-type "WebAppInfo")))

(def-api-class-and-deserializer "MenuButtonDefault"
  (("type")))

(def-api-class-and-deserializer "ResponseParameters"
  (("migrate_to_chat_id")
   ("retry_after")))

(def-api-class-and-deserializer "InputMedia"
  ())

(def-api-class-and-deserializer "InputMediaPhoto"
  (("type")
   ("media")
   ("caption")
   ("parse_mode")
   ("caption_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("has_spoiler")))

(def-api-class-and-deserializer "InputMediaVideo"
  (("type")
   ("media")
   ("thumb" :slot-type "InputFile")
   ("caption")
   ("parse_mode")
   ("caption_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("width")
   ("height")
   ("duration")
   ("supports_streaming")
   ("has_spoiler")))

(def-api-class-and-deserializer "InputMediaAnimation"
  (("type")
   ("media")
   ("thumb" :slot-type "InputFile")
   ("caption")
   ("parse_mode")
   ("caption_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("width")
   ("height")
   ("duration")
   ("has_spoiler")))

(def-api-class-and-deserializer "InputMediaAudio"
  (("type")
   ("media")
   ("thumb" :slot-type "InputFile")
   ("caption")
   ("parse_mode")
   ("caption_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("duration")
   ("performer")
   ("title")))

(def-api-class-and-deserializer "InputMediaDocument"
  (("type")
   ("media")
   ("thumb" :slot-type "InputFile")
   ("caption")
   ("parse_mode")
   ("caption_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("disable_content_type_detection")))

(def-api-class-and-deserializer "InputFile"
  ())

(def-api-class-and-deserializer "Sticker"
  (("file_id")
   ("file_unique_id")
   ("type")
   ("width")
   ("height")
   ("is_animated")
   ("is_video")
   ("thumb" :slot-type "PhotoSize")
   ("emoji")
   ("set_name")
   ("premium_animation" :slot-type "File")
   ("mask_position" :slot-type "MaskPosition")
   ("custom_emoji_id")
   ("file_size")))

(def-api-class-and-deserializer "StickerSet"
  (("name")
   ("title")
   ("sticker_type")
   ("is_animated")
   ("is_video")
   ("stickers" :slot-type "Sticker" :slot-dimensions 1)
   ("thumb" :slot-type "PhotoSize")))

(def-api-class-and-deserializer "MaskPosition"
  (("point")
   ("x_shift")
   ("y_shift")
   ("scale")))

(def-api-class-and-deserializer "LabeledPrice"
  (("label")
   ("amount")))

(def-api-class-and-deserializer "Invoice"
  (("title")
   ("description")
   ("start_parameter")
   ("currency")
   ("total_amount")))

(def-api-class-and-deserializer "ShippingAddress"
  (("country_code")
   ("state")
   ("city")
   ("street_line1")
   ("street_line2")
   ("post_code")))

(def-api-class-and-deserializer "OrderInfo"
  (("name")
   ("phone_number")
   ("email")
   ("shipping_address" :slot-type "ShippingAddress")))

(def-api-class-and-deserializer "ShippingOption"
  (("id")
   ("title")
   ("prices" :slot-type "LabeledPrice" :slot-dimensions 1)))

(def-api-class-and-deserializer "SuccessfulPayment"
  (("currency")
   ("total_amount")
   ("invoice_payload")
   ("shipping_option_id")
   ("order_info" :slot-type "OrderInfo")
   ("telegram_payment_charge_id")
   ("provider_payment_charge_id")))

(def-api-class-and-deserializer "ShippingQuery"
  (("id")
   ("from" :slot-type "User")
   ("invoice_payload")
   ("shipping_address" :slot-type "ShippingAddress")))

(def-api-class-and-deserializer "PreCheckoutQuery"
  (("id")
   ("from" :slot-type "User")
   ("currency")
   ("total_amount")
   ("invoice_payload")
   ("shipping_option_id")
   ("order_info" :slot-type "OrderInfo")))

(def-api-class-and-deserializer "Game"
  (("title")
   ("description")
   ("photo" :slot-type "PhotoSize" :slot-dimensions 1)
   ("text")
   ("text_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("animation" :slot-type "Animation")))

(def-api-class-and-deserializer "CallbackGame"
  ())

(def-api-class-and-deserializer "GameHighScore"
  (("position")
   ("user" :slot-type "User")
   ("score")))

(def-api-class-and-deserializer "PassportData"
  (("data" :slot-type "EncryptedPassportElement" :slot-dimensions 1)
   ("credentials" :slot-type "EncryptedCredentials")))

(def-api-class-and-deserializer "PassportFile"
  (("file_id")
   ("file_unique_id")
   ("file_size")
   ("file_date")))

(def-api-class-and-deserializer "EncryptedPassportElement"
  (("type")
   ("data")
   ("phone_number")
   ("email")
   ("files" :slot-type "PassportFile" :slot-dimensions 1)
   ("front_side" :slot-type "PassportFile")
   ("reverse_side" :slot-type "PassportFile")
   ("selfie" :slot-type "PassportFile")
   ("translation" :slot-type "PassportFile" :slot-dimensions 1)
   ("hash")))

(def-api-class-and-deserializer "EncryptedCredentials"
  (("data")
   ("hash")
   ("secret")))

(def-api-class-and-deserializer "PassportElementError"
  ())

(def-api-class-and-deserializer "PassportElementErrorDataField"
  (("source")
   ("type")
   ("field_name")
   ("data_hash")
   ("message")))

(def-api-class-and-deserializer "PassportElementErrorFrontSide"
  (("source")
   ("type")
   ("file_hash")
   ("message")))

(def-api-class-and-deserializer "PassportElementErrorReverseSide"
  (("source")
   ("type")
   ("file_hash")
   ("message")))

(def-api-class-and-deserializer "PassportElementErrorSelfie"
  (("source")
   ("type")
   ("file_hash")
   ("message")))

(def-api-class-and-deserializer "PassportElementErrorFile"
  (("source")
   ("type")
   ("file_hash")
   ("message")))

(def-api-class-and-deserializer "PassportElementErrorFiles"
  (("source")
   ("type")
   ("file_hashes")
   ("message")))

(def-api-class-and-deserializer "PassportElementErrorTranslationFile"
  (("source")
   ("type")
   ("file_hash")
   ("message")))

(def-api-class-and-deserializer "PassportElementErrorTranslationFiles"
  (("source")
   ("type")
   ("file_hashes")
   ("message")))

(def-api-class-and-deserializer "PassportElementErrorUnspecified"
  (("source")
   ("type")
   ("element_hash")
   ("message")))

(def-api-class-and-deserializer "InlineQuery"
  (("id")
   ("from" :slot-type "User")
   ("query")
   ("offset")
   ("chat_type")
   ("location" :slot-type "Location")))

(def-api-class-and-deserializer "InlineQueryResult"
  ())

(def-api-class-and-deserializer "InlineQueryResultArticle"
  (("type")
   ("id")
   ("title")
   ("input_message_content" :slot-type "InputMessageContent")
   ("reply_markup" :slot-type "InlineKeyboardMarkup")
   ("url")
   ("hide_url")
   ("description")
   ("thumb_url")
   ("thumb_width")
   ("thumb_height")))

(def-api-class-and-deserializer "InlineQueryResultPhoto"
  (("type")
   ("id")
   ("photo_url")
   ("thumb_url")
   ("photo_width")
   ("photo_height")
   ("title")
   ("description")
   ("caption")
   ("parse_mode")
   ("caption_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("reply_markup" :slot-type "InlineKeyboardMarkup")
   ("input_message_content" :slot-type "InputMessageContent")))

(def-api-class-and-deserializer "InlineQueryResultGif"
  (("type")
   ("id")
   ("gif_url")
   ("gif_width")
   ("gif_height")
   ("gif_duration")
   ("thumb_url")
   ("thumb_mime_type")
   ("title")
   ("caption")
   ("parse_mode")
   ("caption_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("reply_markup" :slot-type "InlineKeyboardMarkup")
   ("input_message_content" :slot-type "InputMessageContent")))

(def-api-class-and-deserializer "InlineQueryResultMpeg4Gif"
  (("type")
   ("id")
   ("mpeg4_url")
   ("mpeg4_width")
   ("mpeg4_height")
   ("mpeg4_duration")
   ("thumb_url")
   ("thumb_mime_type")
   ("title")
   ("caption")
   ("parse_mode")
   ("caption_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("reply_markup" :slot-type "InlineKeyboardMarkup")
   ("input_message_content" :slot-type "InputMessageContent")))

(def-api-class-and-deserializer "InlineQueryResultVideo"
  (("type")
   ("id")
   ("video_url")
   ("mime_type")
   ("thumb_url")
   ("title")
   ("caption")
   ("parse_mode")
   ("caption_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("video_width")
   ("video_height")
   ("video_duration")
   ("description")
   ("reply_markup" :slot-type "InlineKeyboardMarkup")
   ("input_message_content" :slot-type "InputMessageContent")))

(def-api-class-and-deserializer "InlineQueryResultAudio"
  (("type")
   ("id")
   ("audio_url")
   ("title")
   ("caption")
   ("parse_mode")
   ("caption_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("performer")
   ("audio_duration")
   ("reply_markup" :slot-type "InlineKeyboardMarkup")
   ("input_message_content" :slot-type "InputMessageContent")))

(def-api-class-and-deserializer "InlineQueryResultVoice"
  (("type")
   ("id")
   ("voice_url")
   ("title")
   ("caption")
   ("parse_mode")
   ("caption_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("voice_duration")
   ("reply_markup" :slot-type "InlineKeyboardMarkup")
   ("input_message_content" :slot-type "InputMessageContent")))

(def-api-class-and-deserializer "InlineQueryResultDocument"
  (("type")
   ("id")
   ("title")
   ("caption")
   ("parse_mode")
   ("caption_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("document_url")
   ("mime_type")
   ("description")
   ("reply_markup" :slot-type "InlineKeyboardMarkup")
   ("input_message_content" :slot-type "InputMessageContent")
   ("thumb_url")
   ("thumb_width")
   ("thumb_height")))

(def-api-class-and-deserializer "InlineQueryResultLocation"
  (("type")
   ("id")
   ("latitude")
   ("longitude")
   ("title")
   ("horizontal_accuracy")
   ("live_period")
   ("heading")
   ("proximity_alert_radius")
   ("reply_markup" :slot-type "InlineKeyboardMarkup")
   ("input_message_content" :slot-type "InputMessageContent")
   ("thumb_url")
   ("thumb_width")
   ("thumb_height")))

(def-api-class-and-deserializer "InlineQueryResultVenue"
  (("type")
   ("id")
   ("latitude")
   ("longitude")
   ("title")
   ("address")
   ("foursquare_id")
   ("foursquare_type")
   ("google_place_id")
   ("google_place_type")
   ("reply_markup" :slot-type "InlineKeyboardMarkup")
   ("input_message_content" :slot-type "InputMessageContent")
   ("thumb_url")
   ("thumb_width")
   ("thumb_height")))

(def-api-class-and-deserializer "InlineQueryResultContact"
  (("type")
   ("id")
   ("phone_number")
   ("first_name")
   ("last_name")
   ("vcard")
   ("reply_markup" :slot-type "InlineKeyboardMarkup")
   ("input_message_content" :slot-type "InputMessageContent")
   ("thumb_url")
   ("thumb_width")
   ("thumb_height")))

(def-api-class-and-deserializer "InlineQueryResultGame"
  (("type")
   ("id")
   ("game_short_name")
   ("reply_markup" :slot-type "InlineKeyboardMarkup")))

(def-api-class-and-deserializer "InlineQueryResultCachedPhoto"
  (("type")
   ("id")
   ("photo_file_id")
   ("title")
   ("description")
   ("caption")
   ("parse_mode")
   ("caption_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("reply_markup" :slot-type "InlineKeyboardMarkup")
   ("input_message_content" :slot-type "InputMessageContent")))

(def-api-class-and-deserializer "InlineQueryResultCachedGif"
  (("type")
   ("id")
   ("gif_file_id")
   ("title")
   ("caption")
   ("parse_mode")
   ("caption_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("reply_markup" :slot-type "InlineKeyboardMarkup")
   ("input_message_content" :slot-type "InputMessageContent")))

(def-api-class-and-deserializer "InlineQueryResultCachedMpeg4Gif"
  (("type")
   ("id")
   ("mpeg4_file_id")
   ("title")
   ("caption")
   ("parse_mode")
   ("caption_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("reply_markup" :slot-type "InlineKeyboardMarkup")
   ("input_message_content" :slot-type "InputMessageContent")))

(def-api-class-and-deserializer "InlineQueryResultCachedSticker"
  (("type")
   ("id")
   ("sticker_file_id")
   ("reply_markup" :slot-type "InlineKeyboardMarkup")
   ("input_message_content" :slot-type "InputMessageContent")))

(def-api-class-and-deserializer "InlineQueryResultCachedDocument"
  (("type")
   ("id")
   ("title")
   ("document_file_id")
   ("description")
   ("caption")
   ("parse_mode")
   ("caption_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("reply_markup" :slot-type "InlineKeyboardMarkup")
   ("input_message_content" :slot-type "InputMessageContent")))

(def-api-class-and-deserializer "InlineQueryResultCachedVideo"
  (("type")
   ("id")
   ("video_file_id")
   ("title")
   ("description")
   ("caption")
   ("parse_mode")
   ("caption_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("reply_markup" :slot-type "InlineKeyboardMarkup")
   ("input_message_content" :slot-type "InputMessageContent")))

(def-api-class-and-deserializer "InlineQueryResultCachedVoice"
  (("type")
   ("id")
   ("voice_file_id")
   ("title")
   ("caption")
   ("parse_mode")
   ("caption_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("reply_markup" :slot-type "InlineKeyboardMarkup")
   ("input_message_content" :slot-type "InputMessageContent")))

(def-api-class-and-deserializer "InlineQueryResultCachedAudio"
  (("type")
   ("id")
   ("audio_file_id")
   ("caption")
   ("parse_mode")
   ("caption_entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("reply_markup" :slot-type "InlineKeyboardMarkup")
   ("input_message_content" :slot-type "InputMessageContent")))

(def-api-class-and-deserializer "InputMessageContent"
  ())

(def-api-class-and-deserializer "InputTextMessageContent"
  (("message_text")
   ("parse_mode")
   ("entities" :slot-type "MessageEntity" :slot-dimensions 1)
   ("disable_web_page_preview")))

(def-api-class-and-deserializer "InputLocationMessageContent"
  (("latitude")
   ("longitude")
   ("horizontal_accuracy")
   ("live_period")
   ("heading")
   ("proximity_alert_radius")))

(def-api-class-and-deserializer "InputVenueMessageContent"
  (("latitude")
   ("longitude")
   ("title")
   ("address")
   ("foursquare_id")
   ("foursquare_type")
   ("google_place_id")
   ("google_place_type")))

(def-api-class-and-deserializer "InputContactMessageContent"
  (("phone_number")
   ("first_name")
   ("last_name")
   ("vcard")))

(def-api-class-and-deserializer "InputInvoiceMessageContent"
  (("title")
   ("description")
   ("payload")
   ("provider_token")
   ("currency")
   ("prices" :slot-type "LabeledPrice" :slot-dimensions 1)
   ("max_tip_amount")
   ("suggested_tip_amounts")
   ("provider_data")
   ("photo_url")
   ("photo_size")
   ("photo_width")
   ("photo_height")
   ("need_name")
   ("need_phone_number")
   ("need_email")
   ("need_shipping_address")
   ("send_phone_number_to_provider")
   ("send_email_to_provider")
   ("is_flexible")))

(def-api-class-and-deserializer "ChosenInlineResult"
  (("result_id")
   ("from" :slot-type "User")
   ("location" :slot-type "Location")
   ("inline_message_id")
   ("query")))

(def-api-class-and-deserializer "SentWebAppMessage"
  (("inline_message_id")))

(def-api-method "getMe"
  ()
   :return-type "User")

(def-api-method "logOut"
  ())

(def-api-method "close"
  ())

(def-api-method "sendMessage"
  ("chat_id"
   "message_thread_id"
   "text"
   "parse_mode"
   "entities"
   "disable_web_page_preview"
   "disable_notification"
   "protect_content"
   "reply_to_message_id"
   "allow_sending_without_reply"
   "reply_markup")
   :return-type "Message")

(def-api-method "forwardMessage"
  ("chat_id"
   "message_thread_id"
   "from_chat_id"
   "disable_notification"
   "protect_content"
   "message_id")
   :return-type "Message")

(def-api-method "copyMessage"
  ("chat_id"
   "message_thread_id"
   "from_chat_id"
   "message_id"
   "caption"
   "parse_mode"
   "caption_entities"
   "disable_notification"
   "protect_content"
   "reply_to_message_id"
   "allow_sending_without_reply"
   "reply_markup")
   :return-type "MessageId")

(def-api-method "sendPhoto"
  ("chat_id"
   "message_thread_id"
   "photo"
   "caption"
   "parse_mode"
   "caption_entities"
   "has_spoiler"
   "disable_notification"
   "protect_content"
   "reply_to_message_id"
   "allow_sending_without_reply"
   "reply_markup")
   :return-type "Message")

(def-api-method "sendAudio"
  ("chat_id"
   "message_thread_id"
   "audio"
   "caption"
   "parse_mode"
   "caption_entities"
   "duration"
   "performer"
   "title"
   "thumb"
   "disable_notification"
   "protect_content"
   "reply_to_message_id"
   "allow_sending_without_reply"
   "reply_markup")
   :return-type "Message")

(def-api-method "sendDocument"
  ("chat_id"
   "message_thread_id"
   "document"
   "thumb"
   "caption"
   "parse_mode"
   "caption_entities"
   "disable_content_type_detection"
   "disable_notification"
   "protect_content"
   "reply_to_message_id"
   "allow_sending_without_reply"
   "reply_markup")
   :return-type "Message")

(def-api-method "sendVideo"
  ("chat_id"
   "message_thread_id"
   "video"
   "duration"
   "width"
   "height"
   "thumb"
   "caption"
   "parse_mode"
   "caption_entities"
   "has_spoiler"
   "supports_streaming"
   "disable_notification"
   "protect_content"
   "reply_to_message_id"
   "allow_sending_without_reply"
   "reply_markup")
   :return-type "Message")

(def-api-method "sendAnimation"
  ("chat_id"
   "message_thread_id"
   "animation"
   "duration"
   "width"
   "height"
   "thumb"
   "caption"
   "parse_mode"
   "caption_entities"
   "has_spoiler"
   "disable_notification"
   "protect_content"
   "reply_to_message_id"
   "allow_sending_without_reply"
   "reply_markup")
   :return-type "Message")

(def-api-method "sendVoice"
  ("chat_id"
   "message_thread_id"
   "voice"
   "caption"
   "parse_mode"
   "caption_entities"
   "duration"
   "disable_notification"
   "protect_content"
   "reply_to_message_id"
   "allow_sending_without_reply"
   "reply_markup")
   :return-type "Message")

(def-api-method "sendVideoNote"
  ("chat_id"
   "message_thread_id"
   "video_note"
   "duration"
   "length"
   "thumb"
   "disable_notification"
   "protect_content"
   "reply_to_message_id"
   "allow_sending_without_reply"
   "reply_markup")
   :return-type "Message")

(def-api-method "sendMediaGroup"
  ("chat_id"
   "message_thread_id"
   "media"
   "disable_notification"
   "protect_content"
   "reply_to_message_id"
   "allow_sending_without_reply")
   :return-type "Message" :return-dimensions 1)

(def-api-method "sendLocation"
  ("chat_id"
   "message_thread_id"
   "latitude"
   "longitude"
   "horizontal_accuracy"
   "live_period"
   "heading"
   "proximity_alert_radius"
   "disable_notification"
   "protect_content"
   "reply_to_message_id"
   "allow_sending_without_reply"
   "reply_markup")
   :return-type "Message")

(def-api-method "editMessageLiveLocation"
  ("chat_id"
   "message_id"
   "inline_message_id"
   "latitude"
   "longitude"
   "horizontal_accuracy"
   "heading"
   "proximity_alert_radius"
   "reply_markup")
   :return-type "Message")

(def-api-method "stopMessageLiveLocation"
  ("chat_id"
   "message_id"
   "inline_message_id"
   "reply_markup")
   :return-type "Message")

(def-api-method "sendVenue"
  ("chat_id"
   "message_thread_id"
   "latitude"
   "longitude"
   "title"
   "address"
   "foursquare_id"
   "foursquare_type"
   "google_place_id"
   "google_place_type"
   "disable_notification"
   "protect_content"
   "reply_to_message_id"
   "allow_sending_without_reply"
   "reply_markup")
   :return-type "Message")

(def-api-method "sendContact"
  ("chat_id"
   "message_thread_id"
   "phone_number"
   "first_name"
   "last_name"
   "vcard"
   "disable_notification"
   "protect_content"
   "reply_to_message_id"
   "allow_sending_without_reply"
   "reply_markup")
   :return-type "Message")

(def-api-method "sendPoll"
  ("chat_id"
   "message_thread_id"
   "question"
   "options"
   "is_anonymous"
   "type"
   "allows_multiple_answers"
   "correct_option_id"
   "explanation"
   "explanation_parse_mode"
   "explanation_entities"
   "open_period"
   "close_date"
   "is_closed"
   "disable_notification"
   "protect_content"
   "reply_to_message_id"
   "allow_sending_without_reply"
   "reply_markup")
   :return-type "Message")

(def-api-method "sendDice"
  ("chat_id"
   "message_thread_id"
   "emoji"
   "disable_notification"
   "protect_content"
   "reply_to_message_id"
   "allow_sending_without_reply"
   "reply_markup")
   :return-type "Message")

(def-api-method "sendChatAction"
  ("chat_id"
   "message_thread_id"
   "action"))

(def-api-method "getUserProfilePhotos"
  ("user_id"
   "offset"
   "limit")
   :return-type "UserProfilePhotos")

(def-api-method "getFile"
  ("file_id")
   :return-type "File")

(def-api-method "banChatMember"
  ("chat_id"
   "user_id"
   "until_date"
   "revoke_messages"))

(def-api-method "unbanChatMember"
  ("chat_id"
   "user_id"
   "only_if_banned"))

(def-api-method "restrictChatMember"
  ("chat_id"
   "user_id"
   "permissions"
   "until_date"))

(def-api-method "promoteChatMember"
  ("chat_id"
   "user_id"
   "is_anonymous"
   "can_manage_chat"
   "can_post_messages"
   "can_edit_messages"
   "can_delete_messages"
   "can_manage_video_chats"
   "can_restrict_members"
   "can_promote_members"
   "can_change_info"
   "can_invite_users"
   "can_pin_messages"
   "can_manage_topics"))

(def-api-method "setChatAdministratorCustomTitle"
  ("chat_id"
   "user_id"
   "custom_title"))

(def-api-method "banChatSenderChat"
  ("chat_id"
   "sender_chat_id"))

(def-api-method "unbanChatSenderChat"
  ("chat_id"
   "sender_chat_id"))

(def-api-method "setChatPermissions"
  ("chat_id"
   "permissions"))

(def-api-method "exportChatInviteLink"
  ("chat_id"))

(def-api-method "createChatInviteLink"
  ("chat_id"
   "name"
   "expire_date"
   "member_limit"
   "creates_join_request")
   :return-type "ChatInviteLink")

(def-api-method "editChatInviteLink"
  ("chat_id"
   "invite_link"
   "name"
   "expire_date"
   "member_limit"
   "creates_join_request")
   :return-type "ChatInviteLink")

(def-api-method "revokeChatInviteLink"
  ("chat_id"
   "invite_link")
   :return-type "ChatInviteLink")

(def-api-method "approveChatJoinRequest"
  ("chat_id"
   "user_id"))

(def-api-method "declineChatJoinRequest"
  ("chat_id"
   "user_id"))

(def-api-method "setChatPhoto"
  ("chat_id"
   "photo"))

(def-api-method "deleteChatPhoto"
  ("chat_id"))

(def-api-method "setChatTitle"
  ("chat_id"
   "title"))

(def-api-method "setChatDescription"
  ("chat_id"
   "description"))

(def-api-method "pinChatMessage"
  ("chat_id"
   "message_id"
   "disable_notification"))

(def-api-method "unpinChatMessage"
  ("chat_id"
   "message_id"))

(def-api-method "unpinAllChatMessages"
  ("chat_id"))

(def-api-method "leaveChat"
  ("chat_id"))

(def-api-method "getChat"
  ("chat_id")
   :return-type "Chat")

(def-api-method "getChatAdministrators"
  ("chat_id")
   :return-type "ChatMember")

(def-api-method "getChatMemberCount"
  ("chat_id"))

(def-api-method "getChatMember"
  ("chat_id"
   "user_id")
   :return-type "ChatMember")

(def-api-method "setChatStickerSet"
  ("chat_id"
   "sticker_set_name"))

(def-api-method "deleteChatStickerSet"
  ("chat_id"))

(def-api-method "getForumTopicIconStickers"
  ()
   :return-type "Sticker")

(def-api-method "createForumTopic"
  ("chat_id"
   "name"
   "icon_color"
   "icon_custom_emoji_id")
   :return-type "ForumTopic")

(def-api-method "editForumTopic"
  ("chat_id"
   "message_thread_id"
   "name"
   "icon_custom_emoji_id"))

(def-api-method "closeForumTopic"
  ("chat_id"
   "message_thread_id"))

(def-api-method "reopenForumTopic"
  ("chat_id"
   "message_thread_id"))

(def-api-method "deleteForumTopic"
  ("chat_id"
   "message_thread_id"))

(def-api-method "unpinAllForumTopicMessages"
  ("chat_id"
   "message_thread_id"))

(def-api-method "editGeneralForumTopic"
  ("chat_id"
   "name"))

(def-api-method "closeGeneralForumTopic"
  ("chat_id"))

(def-api-method "reopenGeneralForumTopic"
  ("chat_id"))

(def-api-method "hideGeneralForumTopic"
  ("chat_id"))

(def-api-method "unhideGeneralForumTopic"
  ("chat_id"))

(def-api-method "answerCallbackQuery"
  ("callback_query_id"
   "text"
   "show_alert"
   "url"
   "cache_time"))

(def-api-method "setMyCommands"
  ("commands"
   "scope"
   "language_code"))

(def-api-method "deleteMyCommands"
  ("scope"
   "language_code"))

(def-api-method "getMyCommands"
  ("scope"
   "language_code")
   :return-type "BotCommand")

(def-api-method "setChatMenuButton"
  ("chat_id"
   "menu_button"))

(def-api-method "getChatMenuButton"
  ("chat_id")
   :return-type "MenuButton")

(def-api-method "setMyDefaultAdministratorRights"
  ("rights"
   "for_channels"))

(def-api-method "getMyDefaultAdministratorRights"
  ("for_channels")
   :return-type "ChatAdministratorRights")

(def-api-method "editMessageText"
  ("chat_id"
   "message_id"
   "inline_message_id"
   "text"
   "parse_mode"
   "entities"
   "disable_web_page_preview"
   "reply_markup")
   :return-type "Message")

(def-api-method "editMessageCaption"
  ("chat_id"
   "message_id"
   "inline_message_id"
   "caption"
   "parse_mode"
   "caption_entities"
   "reply_markup")
   :return-type "Message")

(def-api-method "editMessageMedia"
  ("chat_id"
   "message_id"
   "inline_message_id"
   "media"
   "reply_markup")
   :return-type "Message")

(def-api-method "editMessageReplyMarkup"
  ("chat_id"
   "message_id"
   "inline_message_id"
   "reply_markup")
   :return-type "Message")

(def-api-method "stopPoll"
  ("chat_id"
   "message_id"
   "reply_markup")
   :return-type "Poll")

(def-api-method "deleteMessage"
  ("chat_id"
   "message_id"))

(def-api-method "sendSticker"
  ("chat_id"
   "message_thread_id"
   "sticker"
   "disable_notification"
   "protect_content"
   "reply_to_message_id"
   "allow_sending_without_reply"
   "reply_markup")
   :return-type "Message")

(def-api-method "getStickerSet"
  ("name")
   :return-type "StickerSet")

(def-api-method "getCustomEmojiStickers"
  ("custom_emoji_ids")
   :return-type "Sticker")

(def-api-method "uploadStickerFile"
  ("user_id"
   "png_sticker")
   :return-type "File")

(def-api-method "createNewStickerSet"
  ("user_id"
   "name"
   "title"
   "png_sticker"
   "tgs_sticker"
   "webm_sticker"
   "sticker_type"
   "emojis"
   "mask_position"))

(def-api-method "addStickerToSet"
  ("user_id"
   "name"
   "png_sticker"
   "tgs_sticker"
   "webm_sticker"
   "emojis"
   "mask_position"))

(def-api-method "setStickerPositionInSet"
  ("sticker"
   "position"))

(def-api-method "deleteStickerFromSet"
  ("sticker"))

(def-api-method "setStickerSetThumb"
  ("name"
   "user_id"
   "thumb"))

(def-api-method "sendInvoice"
  ("chat_id"
   "message_thread_id"
   "title"
   "description"
   "payload"
   "provider_token"
   "currency"
   "prices"
   "max_tip_amount"
   "suggested_tip_amounts"
   "start_parameter"
   "provider_data"
   "photo_url"
   "photo_size"
   "photo_width"
   "photo_height"
   "need_name"
   "need_phone_number"
   "need_email"
   "need_shipping_address"
   "send_phone_number_to_provider"
   "send_email_to_provider"
   "is_flexible"
   "disable_notification"
   "protect_content"
   "reply_to_message_id"
   "allow_sending_without_reply"
   "reply_markup")
   :return-type "Message")

(def-api-method "createInvoiceLink"
  ("title"
   "description"
   "payload"
   "provider_token"
   "currency"
   "prices"
   "max_tip_amount"
   "suggested_tip_amounts"
   "provider_data"
   "photo_url"
   "photo_size"
   "photo_width"
   "photo_height"
   "need_name"
   "need_phone_number"
   "need_email"
   "need_shipping_address"
   "send_phone_number_to_provider"
   "send_email_to_provider"
   "is_flexible"))

(def-api-method "answerShippingQuery"
  ("shipping_query_id"
   "ok"
   "shipping_options"
   "error_message")
   :return-type "Update")

(def-api-method "answerPreCheckoutQuery"
  ("pre_checkout_query_id"
   "ok"
   "error_message")
   :return-type "Update")

(def-api-method "sendGame"
  ("chat_id"
   "message_thread_id"
   "game_short_name"
   "disable_notification"
   "protect_content"
   "reply_to_message_id"
   "allow_sending_without_reply"
   "reply_markup")
   :return-type "Message")

(def-api-method "setGameScore"
  ("user_id"
   "score"
   "force"
   "disable_edit_message"
   "chat_id"
   "message_id"
   "inline_message_id")
   :return-type "Message")

(def-api-method "getGameHighScores"
  ("user_id"
   "chat_id"
   "message_id"
   "inline_message_id")
   :return-type "GameHighScore")

(def-api-method "setPassportDataErrors"
  ("user_id"
   "errors"))

(def-api-method "answerWebAppQuery"
  ("web_app_query_id"
   "result")
   :return-type "SentWebAppMessage")

(def-api-method "answerInlineQuery"
  ("inline_query_id"
   "results"
   "cache_time"
   "is_personal"
   "next_offset"
   "switch_pm_text"
   "switch_pm_parameter"))
