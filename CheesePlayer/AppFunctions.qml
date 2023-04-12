import QtQuick
import QtQuick.Controls.Material
import QtQuick.Dialogs

Item
{
    FileDialog {

        id: fileDialog;
    }


    function toggleTheme()
    {
        if (Material.theme === Material.Light)
        {
            Material.theme = Material.Dark;
            pane_SideBar.Material.background = Material.Teal
        }

        else
        {
            Material.theme = Material.Light
            pane_SideBar.Material.background = Material.Grey
        }
    }

    //    ToolButton
    //    {
    //        text: qsTr("Open");
    //        icon.name: "document-open";

    //        onClicked:
    //        {
    //            fileDialog.title = "Something";

    //            fileDialog.nameFilters =
    //            [
    //                "Image files (*.png *.jpeg *.jpg)"
    //            ]

    //            fileDialog.open();
    //        }
    //    }
}
