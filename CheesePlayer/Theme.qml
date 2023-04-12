import QtQuick

Item {

    // This alias is used by the outside world to set the "currentTheme"
    property alias themes: qtObject_Themes

    QtObject {

        id: qtObject_Themes

        // Array for all light theme colors
        readonly property var light: [

            "#ced4da", // Grey - light | 0
            "#3a506b", // Blue - dark  | 1
            "#b5bec7", // Grey - dark  | 2
            "#EEF1EF", // Powder white | 3
            "#527197", // Powder grey  | 4
            "#2e4055", // Blue - darker| 5
            "steelBlue"
        ]

        readonly property var lightIcon: [

            "qrc:/icons/feather-dark/svg/activity.svg"
        ]

        // Array for all dark theme colors
        readonly property var dark: [

            "#040303",
            "#461111",
            "#A13333",
            "#B3541E"
        ]

        readonly property var darkIcon: [

            ""
        ]
    }

    property var currentTheme: qtObject_Themes.light
    property var currentThemeIcon: qtObject_Themes.lightIcon

    // Backgrounds (Sidebar, Menubar, Statusbar, and Pages)
    readonly property string background_1: currentTheme[0]
    readonly property string background_2: currentTheme[1]
    readonly property string background_3: currentTheme[2]


    // TabButton
    readonly property string button_Background_N: currentTheme[1] // normal
    readonly property string button_Background_C: currentTheme[5] // checked
    readonly property string button_Background_H: currentTheme[4] // hovering
    readonly property string button_Background_B: currentTheme[6] // Bar color(bar at the left side)


    readonly property string button_foreground_1: currentTheme[3]

    // Icons for light theme
    readonly property string icon_1: currentThemeIcon[0]
}
