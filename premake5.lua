project "simpleson"
	location "%{localdir}"
		
	language "C++"
	cppdialect "C++17"

	targetdir ("%{libdir}")
	targetname("%{prj.name}_%{cfg.buildcfg}")
	objdir ("%{intdir}")

	files {
		"**.h",
		"**.hpp",
		"**.inl",
		"**.c",
		"**.cpp",
	}

	includedirs {
		".",
	}

	defines {"_CONSOLE"}

	filter "configurations:Debug"
		defines {"_DEBUG", "TGE_DEBUG"}
		runtime "Debug"
		symbols "on"
	filter "configurations:Release"
		defines "TGE_RELEASE"
		runtime "Release"
		optimize "on"
	filter "configurations:Distribution"
		defines "TGE_DIST"
		runtime "Release"
		optimize "on"

	filter "system:windows"
		kind "StaticLib"
		staticruntime "off"
		symbols "On"		
		systemversion "latest"
		--warnings "Extra"
		--conformanceMode "On"
		--buildoptions { "/permissive" }
		flags { 
		--	"FatalWarnings", -- would be both compile and lib, the original didn't set lib
		--	"FatalCompileWarnings",
			"MultiProcessorCompile"
		}
		
		defines { 
			"_WIN32_WINNT=0x0601",
			"_CRT_SECURE_NO_WARNINGS"
		}