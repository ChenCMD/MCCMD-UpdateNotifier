#> update_notifier:check_update/parse_value.m
# @input args
#   target: string
#   value: snbt
#   suffix: string
# @within function update_notifier:check_update/_

$data modify storage update_notifier: $(target) set value $(value)$(suffix)
