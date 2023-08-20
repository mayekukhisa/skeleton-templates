<#-- 
 ~ Copyright 2023 Mayeku Khisa
 ~
 ~ Use of this source code is governed by a MIT license as appearing in the
 ~ LICENSE file included in the root of this source tree.
 -->
; Engine configuration file.
; It's best edited using the editor UI and not directly,
; since the parameters that go here are not all obvious.
;
; Format:
;   [section] ; section goes between []
;   param=value ; assign values to parameters

config_version=5

[application]

config/name="${projectName}"
run/main_scene="res://scenes/main.tscn"
config/features=PackedStringArray("4.1", "C#", "Forward Plus")
config/icon="res://icon.svg"

[dotnet]

project/assembly_name="${projectName}"
