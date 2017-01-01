APP    = MasterMind
TARGET = ./.build/debug/$(APP)

all: run

$(TARGET): Sources/*
	@swift build

run: $(TARGET)
	@$<
