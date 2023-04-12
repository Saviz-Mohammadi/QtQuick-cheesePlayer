#include "other/network/network.h"

namespace other
{

void Network::slot_OpenURL(

        const QString& url
        )
{
    QDesktopServices::openUrl(

                QUrl(url)
                );
}

} // namespace end
