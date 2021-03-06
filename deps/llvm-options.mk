ifneq ($(LLVM_DEBUG),0)
ifeq  ($(LLVM_DEBUG),1)
LLVM_BUILDTYPE := Debug
else
LLVM_BUILDTYPE := RelWithDebInfo
endif
else
LLVM_BUILDTYPE := Release
endif
LLVM_CMAKE_BUILDTYPE := $(LLVM_BUILDTYPE)
ifeq ($(LLVM_ASSERTIONS),1)
LLVM_BUILDTYPE := $(LLVM_BUILDTYPE)+Asserts
endif
LLVM_FLAVOR := $(LLVM_BUILDTYPE)
ifeq ($(LLVM_SANITIZE),1)
ifeq ($(SANITIZE_MEMORY),1)
LLVM_BUILDTYPE := $(LLVM_BUILDTYPE)+MSAN
endif
ifeq ($(SANITIZE_ADDRESS),1)
LLVM_BUILDTYPE := $(LLVM_BUILDTYPE)+ASAN
endif
ifeq ($(SANITIZE_THREAD),1)
LLVM_BUILDTYPE := $(LLVM_BUILDTYPE)+TSAN
endif
endif
