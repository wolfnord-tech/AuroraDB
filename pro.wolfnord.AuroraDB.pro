TARGET = pro.wolfnord.AuroraDB

CONFIG += \
    auroraapp

PKGCONFIG += \

SOURCES += \
    src/main.cpp \

HEADERS += \

DISTFILES += \
    rpm/pro.wolfnord.AuroraDB.spec \

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += auroraapp_i18n

TRANSLATIONS += \
    translations/pro.wolfnord.AuroraDB.ts \
    translations/pro.wolfnord.AuroraDB-ru.ts \
