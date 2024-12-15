------ DEFINTIONS FOR FILE ------
----
-- IMGUI_BUILD_DIR - overrides ImGui's build directory.
-- IMGUI_OBJ_DIR   - overrides ImGui's intermediate build directory.
----
-- IMGUI_DEBUG_CONFIG   - overrides the name of the debug configuration
-- IMGUI_RELEASE_CONFIG - overrides the name of the release configuration
---------------------------------

project 'imgui'
  kind 'staticlib'
  language 'c++'
  cppdialect 'c++17'
  staticruntime 'off'
  systemversion 'latest'

  targetname ('imgui')
  targetdir (IMGUI_BUILD_DIR or 'build/%{prj.config}/bin')
  objdir (IMGUI_OBJ_DIR or 'build/%{prj.config}')

  files {
    'imconfig.h',
    'imgui.h',
    'imgui.cpp',
    'imgui_draw.cpp',
    'imgui_internal.h',
    'imgui_tables.cpp',
    'imgui_widgets.cpp',
    'imstb_rectpack.h',
    'imstb_textedit.h',
    'imstb_truetype.h',
    'imgui_demo.cpp',
  }

  filter 'system:linux'
    pic 'on'

  filter ('configurations:' .. (IMGUI_DEBUG_CONFIG or 'debug64'))
    runtime 'Debug'
    symbols 'on'

  filter ('configurations:' .. (IMGUI_RELEASE_CONFIG or 'release64'))
    runtime 'Release'
    symbols 'off'
    optimize 'on'
