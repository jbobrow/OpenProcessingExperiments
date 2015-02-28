
/*Artistic intent: When my daughter was learning to ride a bicycle, she was hesitant to cross bumps in the sidewalk.
 We devised a reward system of attaching a colorful bead to the spokes of her bike when she traveled across a bump.
 In this sketch, I'm creating an homage to that experience. A bicycle wheel image is loaded (my photoshop image),
 then rotated along with the appearance of spiraling ellipses - or "beads".
 User Interaction: Upon pressing "b" key- the user hears a cascading sound, created by Leon Milo (link below).
 Pressing Backspace or Delete- the user can refresh the screen and the color and mood of the experience changes.
 Mouse movements alter the color of the beads.*/
//________________
//Bike_Beads, final project for Coursera: Introduction to Computational Arts
//submitted by Lisa Koepke, Lisa@LisaKoepke.com, www.lisakoepke.com, 022614
//please feel free to contact me if you encounter issues while running this sketch
//________________
//resources: Coursera: Introduction to Computational Arts Lessons
//http://fre//http://www.funprogramming.org/28-Rotate-and-even-move-your-axes.html
//http://freesound.org/people/milo/sounds/17337/
//________________
/*Assignment Description: 
 Following details are incorporated into this sketch:
 1. Sketch runs without error. (note: links step 6 below for users who encounter sound file challenges).
 2. Design is clean and intuitive: Notes in above comments and instructional pdf guide. Most interaction details covered in class.
 3. Clean code, plenty of comments
 4. Original visual integrated in sketch (wheel_3.png)
 5. Clearly demonstrates visual concept, matching theme of the work.
 6. Documentation links:
 */
 
//wheel png image and .wav file are in data folder
//Sound plays with 'b' key pressed- like a bicycle bell
//The sound file is about 9 seconds long. Pushing 'b' starts the sound again each time. Overlapping can occur.

/*Import 'Minim' from Processing
 Main Menu>Sketch>Import Library...>Minimim lots more automatically imports,
 what is shown at top here is minimal*/

//Delcare global variables
Minim minim;
AudioSample bike;
PImage wheel;
float r = 0;
import ddf.minim.*;

// void setup() start
void setup() {
  size(800, 800);
  background(255);
  wheel = loadImage("wheel_3.png");
  smooth();
  noStroke();
  colorMode(HSB, width, height, 100);

  minim = new Minim(this); // defines minim as a new instance of the Minim class- this is the argument
  bike = minim.loadSample("17337__milo__cycling1.wav");
}

// void draw() start
void draw() {
  //translate changes the axis moves the x, y to the middle of the screen
 
  translate(width/2, height/2);
  noStroke();
  fill(random(mouseY), random(mouseX), 75);
  rotate(r);
  float circle_size = random(5, 15);
  ellipse(200 + r, 10, circle_size, circle_size);
  r = r + 0.2;

  image (wheel, 0, 0);
  //creates transparency in the image
  tint(255, 10);
 
}

// Key triggers
  // Press 'b' key to activate sound- sound file runs about 9 seconds each time key is pressed
  void keyPressed() {
  if (key == 'b') bike.trigger();
 
}

  // Refresh background press Delete or Backspace key
  void keyReleased() {
  if (key== DELETE || key== BACKSPACE) background(random(width), random(height), random(100));

  // Screenshot Saving Capability
  if (key== 's' || key== 'S') saveFrame("screenshot.png");
}


