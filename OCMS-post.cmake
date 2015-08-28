if (HDF5_EXTERNALLY_CONFIGURED)
    install(
        EXPORT ${HDF5_EXPORTED_TARGETS}
        DESTINATION ${PACKAGE_CONFIG_DIR}
    )
    include(CMakePackageConfigHelpers)
    WRITE_BASIC_PACKAGE_VERSION_FILE(${CMAKE_CURRENT_BINARY_DIR}/hdf5-config-version.cmake
        COMPATIBILITY AnyNewerVersion)
    install(
        FILES ${CMAKE_CURRENT_BINARY_DIR}/hdf5-config-version.cmake
        DESTINATION ${PACKAGE_CONFIG_DIR}
    )
endif()
