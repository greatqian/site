require '../stylus/main'
require './_polyfill'
domready = require 'domready'
LetterShuffle = require './_letter_shuffle'
ColorSwitch = require './_color_switch'
AsideEffectGenerator = require './_aside_effect_generator'
Banner = require './_banner'
HashtagManager = require './_hashtag_manager'

domready ->
  hashtagManager = new HashtagManager()

  colorSwitchConfig =
    triggerEvent: 'click'
    triggerElem: document.getElementById('corner')
    hash: hashtagManager
  colorSwitch = new ColorSwitch(colorSwitchConfig)

  subtitleShuffleConfig =
    targetElem: document.getElementsByTagName('h2')[0]
    triggerEvent: 'click'
    triggerElem: document.getElementById('corner')
  subtitleShuffle = new LetterShuffle(subtitleShuffleConfig)

  effectGeneratorConfig =
    canvas: document.getElementById 'asideBG'
    switch: document.getElementById('logo').children[0]
    nextTrigger: document.getElementById('logo').children[1]
    hash: hashtagManager
  effectGenerator = new AsideEffectGenerator(effectGeneratorConfig)

  # color switch corner init
  # show in the begining
  # hide when mouseout for the first time
  # show when hovering
  document.getElementById('corner').addEventListener 'mouseout',
    removeCornerShowClass, false

new Banner()

removeCornerShowClass = do ->
  first = true
  (event) ->
    return unless first
    first = false
    document.getElementById('corner').classList.remove 'cornerShow'
