#!/bin/bash
monitor="$(hyprctl activeworkspace -j | grep -o '"monitorID": [0-9]*' | awk '{print $2}')"
echo "$monitor"
if [[ $1 == "move" ]]; then
	workspace=$((monitor * 9 + $2))
    hyprctl dispatch movetoworkspace $workspace
else
	workspace=$((monitor * 9 + $1))
    hyprctl dispatch workspace $workspace
fi
