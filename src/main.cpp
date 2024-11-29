#include <auroraapp.h>
#include <QtQuick>

int main(int argc, char *argv[])
{
    QScopedPointer<QGuiApplication> application(Aurora::Application::application(argc, argv));
    application->setOrganizationName(QStringLiteral("pro.wolfnord"));
    application->setApplicationName(QStringLiteral("AuroraDB"));

    QScopedPointer<QQuickView> view(Aurora::Application::createView());
    view->setSource(Aurora::Application::pathTo(QStringLiteral("qml/AuroraDB.qml")));
    view->show();

    return application->exec();
}