# CLBLEEPBLOP

This is CLBEEPBLOP, a (probably) complete, idiomatic telegram bot API
for Common Lisp. It uses DEXADOR for the http requests, and jonathan
for the JSON machinery.

Up to small cosmetic edits, the API has been machine generated from
[the online documentation for the Telegram Bot
Api](https://core.telegram.org/bots/api), so this package really has
*everything*. Passports, payments, etc.

However, since it has been machine generated, and machines aren't so
smart, there may be serious bugs. These are *totaly* the machines'
fault.

## Usage

Bots are created by subclassing the class `bot` and by writing
`handle-update` methods for... handling the different types of
updates. Then you pass an instance to the `run-telegram-bot` function.

### The infamous echo bot

```common-lisp
(defclass echo-bot (bot) ())

(defmethod handle-update ((bot echo-bot) (message message) update)
  (declare (ignore update))
  (tg-send-message bot
		   :text (format nil "got '~A'" (text message))
		   :chat-id (id (chat message))))

(run-telegram-bot (make-instance 'echo-bot :token *token*))
```

If you add buttons to the message, you can handle the callbacks in a method like this:

```common-lisp
(defmethod handle-update ((bot button-bot) (query callback-query) update)
  ...)
```
There is a more complex example involving different types of updates
and callbacks in the `examples.lisp` file.

## Documentation

A quick glance at the file `api.lisp` should give you a general idea
of how this works. You can and should use the official documentation
for the telegram bot API, as everything should work with small lispy
adaptations, as follows.

* If you want to use an API methods called e.g. `fetchThatThing`, in
  `clbleepbop` it's name is `tg-fetch-that-thing`.

* If you want to build an object, e.g. of type `InputMediaAudio`, the
  class for it is called `input-media-audio`

* Arguments for methods and `make-instance` have been reformatted in a lispy way. So you can write

```common-lisp
(make-instance 'input-media-audio :parse-mode "Markdown" ...)

```

  for the javascript / json `parse_mode` slot.

* To send a file, simply pass an appropriate pathname object to the
  method you want to use.

## License

This software is MIT-Licensed. See COPYING for the usual boiler plate.
