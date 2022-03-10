INFO6019 Physics and INFO6025 Configuration Final Project

Built and run in Visual Studios Community 2019 in Debug and Release x64.

Controls:
WASD		- Move camera
QE		- Move camera up/down
Mouse		- Aim camera
Left Mouse	- Fire laser from camera
Space		- Launch fountain particle from origin
1		- Launch bullet from cannon
Arrow Keys	- Aim cannon

Demo video should be located in same location as README.txt
I got the cannon shot working again, I was multiplying the velocity by it's size, not the velocity in the config file, so that's fixed now.
I will be deleting the Dist folder and Dist.zip along with the usual Visual Studio junk to clear up space.  Video was a little long, but hopefully it's small enough (I'll try compressing it if it is too large on its own).

PHYSICS
Implemented Force Register for the spring entity.  As noted in the demo, behaves somewhat normally until acted upon by another force, then just kinda goes off on its own.
For some reason, the particle world really didn't like my bullet and laser classes inheriting from cParticle, and would cause the shots to bounce wildly and eventually break the collision detection.  I've left them included, but they are not used.  
Otherwise, entities use constraints and configurations to behave accordingly with their names and descriptions.

CONFIGURATION
Config.json file can be used to modify the specified values of different entities and particles.
Please ensure when modifying the file that you keep integers as integers, floats as floats etc.  The program checks for these and will crash if the values aren't right.
Reminder: I deleted the Dist and Dist.exe folders, so to recompile Final_Installer.nsi, the program will nedd to be run in Release mode at least once.
Final_Installer.nsi would need to be recompiled for the executable to update, otherwise, included final_installer.exe will install the last version I had before submission (after video, after fixing the cannon).
FinalPhysicsAndConfigEvanSinasac.vcxproj edited to create the distribution folder and zip it after build.  I could have had the installer just grab that, I went with the longer and more annoying route just to show that I can grab files from in folders.  Not very efficiently, but it works.

Thank you for the great semester.  Your classes were quite enjoyable and I learned/re-learned a lot.  The configuration stuff, in particular making the distributal and the nsi scripting, wasn't something I thought I'd learn one day, but I'm glad I did.  And it was fun :)

VIDEO
https://youtu.be/7x8nBs6u0xM