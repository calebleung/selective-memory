-- Autogenerated lua file by the Spyface tool
-- 'Wimps and posers -- leave the hall! -- ManOwaR
--
-- DO NOT HAND EDIT.
--
dependents =
{
    "skins.lua",
}
text_styles =
{
}
skins =
{
}
widgets =
{
    {
        name = [[New Widget]],
        isVisible = true,
        noInput = false,
        anchor = 1,
        rotation = 0,
        x = 0.5,
        y = 0.5,
        w = 1,
        h = 1,
        sx = 1,
        sy = 1,
        ctor = [[image]],
        color =
        {
            0,
            0,
            0,
            0.7843137383461,
        },
        images =
        {
            {
                file = [[white.png]],
                name = [[]],
                color =
                {
                    0,
                    0,
                    0,
                    0.7843137383461,
                },
            },
        },
    },
    {
        name = [[panel]],
        isVisible = true,
        noInput = true,
        anchor = 1,
        rotation = 0,
        x = 0.5,
        y = 0.4583333,
        w = 0,
        h = 0,
        sx = 1,
        sy = 1,
        ctor = [[group]],
        children =
        {
            {
                name = [[bg]],
                isVisible = true,
                noInput = true,
                anchor = 1,
                rotation = 0,
                x = 0,
                xpx = true,
                y = 53,
                ypx = true,
                w = 1024,
                wpx = true,
                h = 512,
                hpx = true,
                sx = 1,
                sy = 0.9,
                ctor = [[image]],
                color =
                {
                    1,
                    1,
                    1,
                    1,
                },
                images =
                {
                    {
                        file = [[gui/popup_dialog.png]],
                        name = [[]],
                    },
                },
            },
            {
                name = [[locationBG]],
                isVisible = true,
                noInput = true,
                anchor = 1,
                rotation = 0,
                x = 52,
                xpx = true,
                y = -4,
                ypx = true,
                w = 322,
                wpx = true,
                h = 20,
                hpx = true,
                sx = 1,
                sy = 1,
                ctor = [[image]],
                color =
                {
                    0.152941182255745,
                    0.152941182255745,
                    0.152941182255745,
                    0.470588237047195,
                },
                images =
                {
                    {
                        file = [[white.png]],
                        name = [[]],
                        color =
                        {
                            0.152941182255745,
                            0.152941182255745,
                            0.152941182255745,
                            0.470588237047195,
                        },
                    },
                },
            },
            {
                name = [[locationCmb]],
                isVisible = true,
                noInput = false,
                anchor = 1,
                rotation = 0,
                x = 52,
                xpx = true,
                y = -4,
                ypx = true,
                w = 322,
                wpx = true,
                h = 20,
                hpx = true,
                sx = 1,
                sy = 1,
                ctor = [[combobox]],
                arrow_size = 20,
                text_style = [[font1_16_r]],
                arrow_image = [[arrow_down.png]],
                bg_image = [[]],
                bg_color =
                {
                    1,
                    1,
                    1,
                    1,
                },
                can_edit = false,
            },
            {
                name = [[locationTxt]],
                isVisible = true,
                noInput = true,
                anchor = 1,
                rotation = 0,
                x = -204,
                xpx = true,
                y = -16,
                ypx = true,
                w = 164,
                wpx = true,
                h = 43,
                hpx = true,
                sx = 1,
                sy = 1,
                ctor = [[label]],
                halign = MOAITextBox.RIGHT_JUSTIFY,
                valign = MOAITextBox.LEFT_JUSTIFY,
                text_style = [[font1_16_r]],
                color =
                {
                    0.549019634723663,
                    1,
                    1,
                    1,
                },
                str = STRINGS.SELECTIVE_MEMORY.MODAL.LOCATION,
            },
            {
                name = [[missionCountCmb]],
                isVisible = true,
                noInput = false,
                anchor = 1,
                rotation = 0,
                x = 0,
                xpx = true,
                y = 0,
                ypx = true,
                w = 96,
                wpx = true,
                h = 32,
                hpx = true,
                sx = 1,
                sy = 1,
                ctor = [[combobox]],
                arrow_size = 20,
                text_style = [[font1_16_r]],
                arrow_image = [[arrow_down.png]],
                bg_image = [[]],
                bg_color =
                {
                    1,
                    1,
                    1,
                    1,
                },
                can_edit = false,
            },
            {
                name = [[emailBG]],
                isVisible = true,
                noInput = true,
                anchor = 1,
                rotation = 0,
                x = 52,
                xpx = true,
                y = 24,
                ypx = true,
                w = 322,
                wpx = true,
                h = 20,
                hpx = true,
                sx = 1,
                sy = 1,
                ctor = [[image]],
                color =
                {
                    0.152941182255745,
                    0.152941182255745,
                    0.152941182255745,
                    0.470588237047195,
                },
                images =
                {
                    {
                        file = [[white.png]],
                        name = [[]],
                        color =
                        {
                            0.152941182255745,
                            0.152941182255745,
                            0.152941182255745,
                            0.470588237047195,
                        },
                    },
                },
            },
            {
                name = [[emailBox]],
                isVisible = true,
                noInput = false,
                anchor = 1,
                rotation = 0,
                x = 52,
                xpx = true,
                y = 24,
                ypx = true,
                w = 322,
                wpx = true,
                h = 20,
                hpx = true,
                sx = 1,
                sy = 1,
                ctor = [[editbox]],
                halign = MOAITextBox.RIGHT_JUSTIFY,
                valign = MOAITextBox.CENTER_JUSTIFY,
                text_style = [[font1_16_r]],
                isMultiline = false,
                maxEditChars = 255,
            },
            {
                name = [[emailTxt]],
                isVisible = true,
                noInput = true,
                anchor = 1,
                rotation = 0,
                x = -204,
                xpx = true,
                y = 12,
                ypx = true,
                w = 164,
                wpx = true,
                h = 43,
                hpx = true,
                sx = 1,
                sy = 1,
                ctor = [[label]],
                halign = MOAITextBox.RIGHT_JUSTIFY,
                valign = MOAITextBox.LEFT_JUSTIFY,
                text_style = [[font1_16_r]],
                color =
                {
                    0.549019634723663,
                    1,
                    1,
                    1,
                },
                str = STRINGS.SELECTIVE_MEMORY.MODAL.SEED,
            },
            {
                name = [[countryBg]],
                isVisible = true,
                noInput = true,
                anchor = 1,
                rotation = 0,
                x = 52,
                xpx = true,
                y = -31,
                ypx = true,
                w = 322,
                wpx = true,
                h = 20,
                hpx = true,
                sx = 1,
                sy = 1,
                ctor = [[image]],
                color =
                {
                    0.152941182255745,
                    0.152941182255745,
                    0.152941182255745,
                    0.470588237047195,
                },
                images =
                {
                    {
                        file = [[white.png]],
                        name = [[]],
                        color =
                        {
                            0.152941182255745,
                            0.152941182255745,
                            0.152941182255745,
                            0.470588237047195,
                        },
                    },
                },
            },
            {
                name = [[situationCmb]],
                isVisible = true,
                noInput = false,
                anchor = 1,
                rotation = 0,
                x = 52,
                xpx = true,
                y = -31,
                ypx = true,
                w = 322,
                wpx = true,
                h = 20,
                hpx = true,
                sx = 1,
                sy = 1,
                ctor = [[combobox]],
                arrow_size = 20,
                text_style = [[font1_16_r]],
                arrow_image = [[arrow_down.png]],
                bg_image = [[]],
                bg_color =
                {
                    1,
                    1,
                    1,
                    1,
                },
                can_edit = false,
            },
            {
                name = [[situationTxt]],
                isVisible = true,
                noInput = true,
                anchor = 1,
                rotation = 0,
                x = -204,
                xpx = true,
                y = -41,
                ypx = true,
                w = 164,
                wpx = true,
                h = 43,
                hpx = true,
                sx = 1,
                sy = 1,
                ctor = [[label]],
                halign = MOAITextBox.RIGHT_JUSTIFY,
                valign = MOAITextBox.LEFT_JUSTIFY,
                text_style = [[font1_16_r]],
                color =
                {
                    0.549019634723663,
                    1,
                    1,
                    1,
                },
                str = STRINGS.SELECTIVE_MEMORY.MODAL.SITUATION,
            },
            {
                name = [[titleTxt]],
                isVisible = true,
                noInput = true,
                anchor = 1,
                rotation = 0,
                x = 0,
                xpx = true,
                y = 131,
                ypx = true,
                w = 500,
                wpx = true,
                h = 43,
                hpx = true,
                sx = 1,
                sy = 1,
                ctor = [[label]],
                halign = MOAITextBox.CENTER_JUSTIFY,
                valign = MOAITextBox.LEFT_JUSTIFY,
                text_style = [[font1_36_r]],
                color =
                {
                    0.549019634723663,
                    1,
                    1,
                    1,
                },
                str = STRINGS.SELECTIVE_MEMORY.MODAL.TITLE,
            },
            {
                name = [[descTxt]],
                isVisible = true,
                noInput = false,
                anchor = 1,
                rotation = 0,
                x = 0,
                xpx = true,
                y = 73,
                ypx = true,
                w = 350,
                wpx = true,
                h = 70,
                hpx = true,
                sx = 1,
                sy = 1,
                ctor = [[label]],
                halign = MOAITextBox.CENTER_JUSTIFY,
                valign = MOAITextBox.CENTER_JUSTIFY,
                text_style = [[font1_16_r]],
                str = STRINGS.SELECTIVE_MEMORY.MODAL.DESC,
            },
            {
                name = [[okBtn]],
                isVisible = true,
                noInput = false,
                anchor = 1,
                rotation = 0,
                x = 258,
                xpx = true,
                y = -137,
                ypx = true,
                w = 0,
                h = 0,
                sx = 1,
                sy = 1,
                skin = [[screen_button]],
            },
            {
                name = [[cancelBtn]],
                isVisible = true,
                noInput = false,
                anchor = 1,
                rotation = 0,
                x = 258,
                xpx = true,
                y = -182,
                ypx = true,
                w = 0,
                h = 0,
                sx = 1,
                sy = 1,
                skin = [[screen_button]],
            },
        },
    },
}
transitions =
{
}
properties =
{
    sinksInput = true,
    activateTransition = [[activate_below]],
    deactivateTransition = [[deactivate_below]],
}
return { dependents = dependents, text_styles = text_styles, transitions = transitions, skins = skins, widgets = widgets, properties = properties, currentSkin = nil }