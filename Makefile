ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest
THEOS_BUILD_DIR = Packages

include theos/makefiles/common.mk

TWEAK_NAME = SwitcherLimiter
SwitcherLimiter_FILES = Tweak.xm
SwitcherLimiter_FRAMEWORKS = UIKit
SwitcherLimiter_FRAMEWORKS += CoreGraphics
SwitcherLimiter_FRAMEWORKS += QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
