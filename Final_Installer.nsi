# INFO6025 Configuration and Deployment (Final)
# This installer scrip will create an installer "final_installer.exe"
# This installer will create a "Final Project" folder on the desktop that contains the distribution package
# The installer will also create an uninstaller "final_uninstaller.exe" that will clean up everything, including itself

!include "LogicLib.nsh"

# define the name of our installer
OutFile "final_installer.exe"

Function InstallationCheck
    ${If} ${FileExists} "$DESKTOP\Final Project"
        MessageBox MB_YESNO|MB_ICONSTOP "There is already a hello application installed!  \
        Do you want to overwrite it?" IDYES yes IDNO cancel
        yes: 
            DetailPrint "Installing over the existing final project"
            Goto next
        cancel:
            DetailPrint "Cancelling the installation"
            Quit
        next:
    ${EndIf}
FunctionEnd

# define the directory to install to.
InstallDir $DESKTOP

# start our default section
Section

Call InstallationCheck

CreateDirectory "$DESKTOP\Final Project"
CreateDirectory "$DESKTOP\Final Project\Dist"
CreateDirectory "$DESKTOP\Final Project\Dist\Bin"
CreateDirectory "$DESKTOP\Final Project\Dist\Assets"
CreateDirectory "$DESKTOP\Final Project\Dist\Assets\models"
CreateDirectory "$DESKTOP\Final Project\Dist\Assets\shaders"
CreateDirectory "$DESKTOP\Final Project\Dist\Assets\textures"
CreateDirectory "$DESKTOP\Final Project\Dist\Assets\textures\cubemaps"

#trying something
SetOutPath "$INSTDIR\Final Project"
File Dist.zip

# define the output path for this file
SetOutPath "$INSTDIR\Final Project\Dist"


# define what to install and put in the output path
#File hello.txt
#File hello.exe

SetOutPath "$INSTDIR\Final Project\Dist\Bin"
File Dist\Bin\assimp-vc142-mt.dll
File Dist\Bin\fmod.dll
File Dist\Bin\FreeImage.dll
File Dist\Bin\glew32.dll
File Dist\Bin\glfw3.dll
File Dist\Bin\Config.json
File Dist\Bin\FinalPhysicsAndConfigEvanSinasac.exe

SetOutPath "$INSTDIR\Final Project\Dist\Assets"
File Dist\Assets\lights.txt
File Dist\Assets\worldFile.txt

SetOutPath "$INSTDIR\Final Project\Dist\Assets\models"
File Dist\Assets\models\ISO_Sphere_flat_4div_xyz_n_rgba_uv.ply
File Dist\Assets\models\Isosphere_Smooth_Inverted_Normals_for_SkyBox.ply
File Dist\Assets\models\Isosphere_Smooth_Normals.ply
File Dist\Assets\models\SM_Env_Construction_Wall_01_xyz_n_rgba_uv.ply
File Dist\Assets\models\SM_Env_Floor_01_xyz_n_rgba_uv.ply
File Dist\Assets\models\SM_Env_Floor_04_xyz_n_rgba_uv.ply
File Dist\Assets\models\Turret_Simple_01_xyz_n_rgba_uv.ply

SetOutPath "$INSTDIR\Final Project\Dist\Assets\shaders"
File Dist\Assets\shaders\fragShader_01.glsl
File Dist\Assets\shaders\vertShader_01.glsl

SetOutPath "$INSTDIR\Final Project\Dist\Assets\textures"
File Dist\Assets\textures\SpaceInteriors_Emmision.bmp
File Dist\Assets\textures\SpaceInteriors_Texture.bmp
File Dist\Assets\textures\Wall_Atlas_01_ID.bmp
File Dist\Assets\textures\Wall_Atlas_03_ID.bmp
File Dist\Assets\textures\Wall_Atlas_08_ID.bmp
File Dist\Assets\textures\Wall_Atlas_11_ID.bmp
File Dist\Assets\textures\WorldMap.bmp

File Dist\Assets\textures\2k_jupiter.bmp
File Dist\Assets\textures\BrightColouredUVMap.bmp

SetOutPath "$INSTDIR\Final Project\Dist\Assets\textures\cubemaps"
File Dist\Assets\textures\cubemaps\city_bk.bmp
File Dist\Assets\textures\cubemaps\city_dn.bmp
File Dist\Assets\textures\cubemaps\city_ft.bmp
File Dist\Assets\textures\cubemaps\city_lf.bmp
File Dist\Assets\textures\cubemaps\city_rt.bmp
File Dist\Assets\textures\cubemaps\city_up.bmp
File Dist\Assets\textures\cubemaps\Skyrim_Back.bmp
File Dist\Assets\textures\cubemaps\Skyrim_Bottom.bmp
File Dist\Assets\textures\cubemaps\Skyrim_Forward.bmp
File Dist\Assets\textures\cubemaps\Skyrim_Left.bmp
File Dist\Assets\textures\cubemaps\Skyrim_Right.bmp
File Dist\Assets\textures\cubemaps\Skyrim_Top.bmp
File Dist\Assets\textures\cubemaps\SpaceBox_back6_negZ.bmp
File Dist\Assets\textures\cubemaps\SpaceBox_bottom4_negY.bmp
File Dist\Assets\textures\cubemaps\SpaceBox_front5_posZ.bmp
File Dist\Assets\textures\cubemaps\SpaceBox_left2_negX.bmp
File Dist\Assets\textures\cubemaps\SpaceBox_right1_posX.bmp
File Dist\Assets\textures\cubemaps\SpaceBox_top3_posY.bmp
File Dist\Assets\textures\cubemaps\TropicalSunnyDayBack2048.bmp
File Dist\Assets\textures\cubemaps\TropicalSunnyDayDown2048.bmp
File Dist\Assets\textures\cubemaps\TropicalSunnyDayFront2048.bmp
File Dist\Assets\textures\cubemaps\TropicalSunnyDayLeft2048.bmp
File Dist\Assets\textures\cubemaps\TropicalSunnyDayRight2048.bmp
File Dist\Assets\textures\cubemaps\TropicalSunnyDayUp2048.bmp

# define uninstaller
WriteUninstaller "$INSTDIR\Final Project\final_uninstaller.exe"

# end our default section
SectionEnd

# now start our uninstaller section
# the section will always be "Uninstall"
Section "Uninstall"
# TODO: Delete everything we made
Delete $INSTDIR\final_uninstaller.exe
DElete $INSTDIR\Dist.zip

Delete $INSTDIR\Dist\Bin\assimp-vc142-mt.dll
Delete $INSTDIR\Dist\Bin\fmod.dll
Delete $INSTDIR\Dist\Bin\FreeImage.dll
Delete $INSTDIR\Dist\Bin\glew32.dll
Delete $INSTDIR\Dist\Bin\glfw3.dll
Delete $INSTDIR\Dist\Bin\Config.json
Delete $INSTDIR\Dist\Bin\FinalPhysicsAndConfigEvanSinasac.exe

Delete $INSTDIR\Dist\Assets\lights.txt
Delete $INSTDIR\Dist\Assets\worldFile.txt

Delete $INSTDIR\Dist\Assets\models\ISO_Sphere_flat_4div_xyz_n_rgba_uv.ply
Delete $INSTDIR\Dist\Assets\models\Isosphere_Smooth_Inverted_Normals_for_SkyBox.ply
Delete $INSTDIR\Dist\Assets\models\Isosphere_Smooth_Normals.ply
Delete $INSTDIR\Dist\Assets\models\SM_Env_Construction_Wall_01_xyz_n_rgba_uv.ply
Delete $INSTDIR\Dist\Assets\models\SM_Env_Floor_01_xyz_n_rgba_uv.ply
Delete $INSTDIR\Dist\Assets\models\SM_Env_Floor_04_xyz_n_rgba_uv.ply
Delete $INSTDIR\Dist\Assets\models\Turret_Simple_01_xyz_n_rgba_uv.ply

Delete $INSTDIR\Dist\Assets\shaders\fragShader_01.glsl
Delete $INSTDIR\Dist\Assets\shaders\vertShader_01.glsl

Delete $INSTDIR\Dist\Assets\textures\SpaceInteriors_Emmision.bmp
Delete $INSTDIR\Dist\Assets\textures\SpaceInteriors_Emmision.png
Delete $INSTDIR\Dist\Assets\textures\SpaceInteriors_Texture.bmp
Delete $INSTDIR\Dist\Assets\textures\SpaceInteriors_Texture.png
Delete $INSTDIR\Dist\Assets\textures\Wall_Atlas_01_ID.bmp
Delete $INSTDIR\Dist\Assets\textures\Wall_Atlas_01_ID.png
Delete $INSTDIR\Dist\Assets\textures\Wall_Atlas_03_ID.bmp
Delete $INSTDIR\Dist\Assets\textures\Wall_Atlas_03_ID.png
Delete $INSTDIR\Dist\Assets\textures\Wall_Atlas_08_ID.bmp
Delete $INSTDIR\Dist\Assets\textures\Wall_Atlas_08_ID.png
Delete $INSTDIR\Dist\Assets\textures\Wall_Atlas_11_ID.bmp
Delete $INSTDIR\Dist\Assets\textures\Wall_Atlas_11_ID.png
Delete $INSTDIR\Dist\Assets\textures\WorldMap.bmp
Delete $INSTDIR\Dist\Assets\textures\WorldMap.png

Delete $INSTDIR\Dist\Assets\textures\2k_jupiter.bmp
Delete $INSTDIR\Dist\Assets\textures\BrightColouredUVMap.bmp

Delete $INSTDIR\Dist\Assets\textures\cubemaps\city_bk.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\city_dn.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\city_ft.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\city_lf.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\city_rt.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\city_up.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\Skyrim_Back.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\Skyrim_Bottom.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\Skyrim_Forward.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\Skyrim_Left.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\Skyrim_Right.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\Skyrim_Top.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\SpaceBox_back6_negZ.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\SpaceBox_bottom4_negY.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\SpaceBox_front5_posZ.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\SpaceBox_left2_negX.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\SpaceBox_right1_posX.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\SpaceBox_top3_posY.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\TropicalSunnyDayBack2048.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\TropicalSunnyDayDown2048.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\TropicalSunnyDayFront2048.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\TropicalSunnyDayLeft2048.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\TropicalSunnyDayRight2048.bmp
Delete $INSTDIR\Dist\Assets\textures\cubemaps\TropicalSunnyDayUp2048.bmp



# delete the directory
RMDir "$INSTDIR\Dist\Assets\textures\cubemaps"
RMDir "$INSTDIR\Dist\Assets\textures"
RMDir "$INSTDIR\Dist\Assets\shaders"
RMDir "$INSTDIR\Dist\Assets\models"
RMDir "$INSTDIR\Dist\Assets"
RMDir "$INSTDIR\Dist\Bin"
RMDir "$INSTDIR\Dist"
RMDir "$INSTDIR\..\Final Project"

# end the uninstaller section
SectionEnd