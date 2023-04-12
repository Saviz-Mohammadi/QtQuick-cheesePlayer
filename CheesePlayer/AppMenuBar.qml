import QtQuick
import QtQuick.Controls

MenuBar
{
    id: app_MenuBar;


    //Material.theme: Material.Light;

    // Actions
    // ========================================================================

    Action
    {
        id: action_ExitApplication;
        text: qsTr("Exit");
    }

    // ========================================================================
    // Actions


    // Menues
    // ========================================================================

    Menu
    {
        id: menuBar_File;

        title: qsTr("&File");

        MenuItem
        {
            action: action_ExitApplication;
        }
    }

    // ========================================================================
    // MenuBars

    background: Rectangle {

        color: theme.background_3
    }
}
