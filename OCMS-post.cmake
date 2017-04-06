if (HDF5_EXTERNALLY_CONFIGURED)
    install(
        EXPORT ${HDF5_EXPORTED_TARGETS}
        DESTINATION ${HDF5_INSTALL_CMAKE_DIR}
        COMPONENT configinstall
    )
    include(CMakePackageConfigHelpers)
    WRITE_BASIC_PACKAGE_VERSION_FILE(${CMAKE_CURRENT_BINARY_DIR}/hdf5-config-version.cmake
        COMPATIBILITY AnyNewerVersion)
    install(
        FILES ${HDF5_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/${HDF5_PACKAGE}${HDF_PACKAGE_EXT}-config-version.cmake
        DESTINATION ${HDF5_INSTALL_CMAKE_DIR}
        COMPONENT configinstall
    )

	#-----------------------------------------------------------------------------
	# Configure the hdf5-config-dependencies.cmake file for the install directory
	#-----------------------------------------------------------------------------
    file(WRITE ${HDF5_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/${HDF5_PACKAGE}${HDF_PACKAGE_EXT}-config-dependencies.cmake 
        "include(CMakeFindDependencyMacro)\r\n"
	    "set(${PROJECT_NAME}_IMPORT_PREFIX \${_IMPORT_PREFIX})\r\n"
    )
	if(ZLIB_FOUND AND ZLIB_USE_EXTERNAL)
		file(APPEND ${HDF5_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/${HDF5_PACKAGE}${HDF_PACKAGE_EXT}-config-dependencies.cmake "find_dependency(ZLIB)\r\n")
	endif()
	if(SZIP_FOUND AND SZIP_USE_EXTERNAL)
		file(APPEND ${HDF5_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/${HDF5_PACKAGE}${HDF_PACKAGE_EXT}-config-dependencies.cmake "find_dependency(SZIP)\r\n")
	endif()
	file(APPEND ${HDF5_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/${HDF5_PACKAGE}${HDF_PACKAGE_EXT}-config-dependencies.cmake "set(_IMPORT_PREFIX \${${PROJECT_NAME}_IMPORT_PREFIX})")    
    install (
        FILES ${HDF5_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/${HDF5_PACKAGE}${HDF_PACKAGE_EXT}-config-dependencies.cmake
        DESTINATION ${HDF5_INSTALL_CMAKE_DIR}
        COMPONENT configinstall
    )
endif()
