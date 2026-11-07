just in case if you cant open it from the website, you can look at my username and copy it. then at roblox, search my
username and look at my profile and click the game under it

WASD for normal walking
LeftShift for Sprinting
Q for dash
ctrl for shift lock

complete the stage by getting to the top!

some things that kill you are: 
anything that is glowing~ duh~

difference is that some damages you, some kills you, some kills you after 10 second, 
and some can be deactivated by pushing a block against it

the goal of doing this project is to LEARN! as i am quite new to programming and its the first time i touch game making. of course,
by learning means this project might not be as refined as some full fledged game. i will update it was as many random features as
i can do.

**update log:**
**(week 1):**
learnt scripting from scratch...
- added killbricks
  the hard part here is to get the brick to detect the player, because the inital version doesnt get triggered if the player's accessories touch
  anything that doesnt parent up the heirachy to humanoid root part, the game will just return it nill. so i added another call to search it's parent's parent
  so now it works by searching the parent of the part that hits it, if humanoid couldn't be found, then it will search its grandparent.
  
- designed stage obstacle
  did everything by hand, not using other people's map
  
- designed props using blender
  also did it by hand with some inspiration from prnterest

- coded a sprint
  using user input service, and relation to the player's humanoid and its walk speed, i am able to let the person run. then i thought it hadn't have enough
  impact and feel, so i decided to learn how to use camera and add a fov change. when sprint is pressed, a for loop runs to increase the fov smoothly with a
  wait function for a fraction of a second. when the key is un-held, the fov would smoothly return to the original fov with the same method
  
- coded a dash
  dash was the first hardest thing for me to cope with as a beginner as i have to utilise math, body velocity, debris service, remote function, user input
  service and much much more. the new concepts made my feeble mind explode, with way too much knowledge to handle at once, lucky i managed to push through.
  it works by shooting a remote event when "q" is pressed, and it also detects which key is pressed to determine the direction, eg. W = front and so on.
  The remote event will let server call and execute the function needed, which is to boost the calling player's velocity by the direction it is looking at,
  which also is relative to the direction the player wants the dash to be. The way i do this is to create a new instance called body velocity and lets the
  physics system boost the player. and in the end used some math so when its closing to the end of the boost, the boost softens and deletes itself. the hard
  part of debugging was to make the boost delete itself as it flies like axel everytime something doesnt go accordingly and cant stop.

**(week 2):**

- 1) finished stage 1
  finished the final part of the stage with obstaces 
  
- 2) bug fixing
  lots of them... i invited friends to play so i noticed lots of things going wrong
  
- respawn on top of tower
  the respawn pad collides with the tower wall's hitbox and so it launches up the player to the top of the tower by the y axis. the solution is to just move
  the respawn pad by a few studs
  
- sprint and shiftlock collides
  the key bind for sprint is shft, so is the dedfault shiftlock key. i want to keep the sprint key as shift, else your pinky would be so tired if you are pressing
  ctrl. after many yt tutorials teaching method that doesnt work, i found that you can acess the player's module script that controls these stuff just by playing
  the game, copy the script and relocating it to the starter player, cuz it doesnt appear in starter player by default, it is only created after the game is run.
  after that, i located the camera module which is responsible for sprint and added the new keybind as ctrl

- FOV stuck
  after sprinting, the FOV of the player should return to original, but the case is sligtly different, when the player sprints, the FOV somehow increased more
  value that i have set for it, forcing it to be stuck with an increment value from the original FOV. i realised that KeyIsHeld controlled event more differently
  than playerInput.keycode, because for some reason it fired a little more times than intended ,so i swapped that out and it works.

-3) learnt some optimisation

- removing unessacary features and options
 for majority of the part, i realised they dont have to be touched as they are just there to stand still and not trigger any events, so i removed a somehting call
 canTouch and canQuery. then there are simpler stufff like removing shodaws, just cuz why not?

- using a collection service and tag to manage duplicate codes
 because stuff like kill bricks can be duplicated and used tons of times, so i decided to collect them and give them a group identifier called a tag. each tag
 will be called by a server script which will share the coded that the tagged object needs to execute, think of it as a central command system which gives
 commands, the tags are what assigning them to do whichever job. so the code now runs across the server instead of locally, which reduces the stress of repeating 
 multiple same code on multiple instance.

 -4) New Features and things
 - board
   give hints to player as how to pass the stage
   
 - improved dash
   the current dash looks bland and stupid. so why not bump it up with a cool trail and animations? animating roblox characters is brand new thing, so is VFX.
   so i added a simple trail that have a set lifetime while dashing, and it fades when its time is up. by creating a new instance and separate attachments that
   pinpoints the character's humanoid and stick it to get a nice trail. and i made it more happy by adding math.Random to adjust the color of rgb of the trail.
   for animations, its not too hard as i already use blender for sometime, so importing a 0.5 second animation as asset into roblox, then give the animation a
   priority, then let it play and end while dashing. i also added a gui that displays the cd timer of the dash using a local script

- added a sword
  i thought having a sword would be cool, god i know how torturing to do is this
  first i designed a sword inside blender and separate it into more parts so it could be weld together inside roblox. then also made 3 separate poses and
  animation for each of the sword swing inside blender. in roblox studio, i imported the model and animation and began scripting. using local scripts and
  remote events. i let the user click to swing the sword with the custom made sword animations. after each click, combo value will go up and it will end up
  playing different animation, then combo resets to first animation. with a timed click detector that detects ur last input and current time, the script will
  reset the combo when time arrives. then it calls a remote event for the server to detect if your sword has hit the enemy, then deals damage and plays the vfx.

 
  
  




