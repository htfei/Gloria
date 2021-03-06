'use strict'

require! 'prelude-ls': { unique-by, reverse }

require! '../actions/types.ls': types

const actions-map =
  (types.set-config): (state, { name, value }) ->
    {
      ...state
      (name): value
    }

  (types.clear-all-configs): -> {}

  (types.merge-configs): (state, { new-configs }) ->
    {
      ...state
      ...new-configs
    }

module.exports = (state = {}, action) ->
  const reduce-fn = actions-map[action.type]
  if reduce-fn then reduce-fn state, action else state
