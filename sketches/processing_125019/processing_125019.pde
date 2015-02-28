
// import(s)
import ddf.minim.*; // for audio effects

// declarations
PImage bg; // background image
Minim minim; // audio library 
AudioSample imageSaved, whoosh; // audio effects
float objectType; // which object type?
float x, y; // for x and y positions
color[] palette = {
  #F0F4F5, #8ED3D9, #A4D6DA, #D2EEF1, #C0DCDD
}; // stroke palette
color[] fillPalette = {
  #9FD1D9, #F0F4F5, #9ED6D9, #D2EEF1, #C0DCDD
}; // fill palette

// setup() method
void setup() {
  size(800,600); // set the size at 800x600
  bg = loadImage("bg.jpg"); // load background image
  image(bg, 0, 0); // draw the background at (0,0)
  minim = new Minim(this); // for audio effects
  imageSaved = minim.loadSample("ImageSaved.mp3"); 
  whoosh = minim.loadSample("Whoosh.mp3");
}

// draw() method
void draw(){
  if (mousePressed) { // waits for mousePress before drawing items
    objectType = int(random(4)); // which object type?
    // draw the object
    float strokeColor = random(1, 5); // choose a random stroke color
    float fillColor = random(1, 5); // choose a random fill color
    float alpha = random(256); // choose a random transparency
    strokeWeight(random(1, 6)); // choose a random stroke weight
    stroke(palette[int(strokeColor)]); // assign the stroke color
    fill(fillPalette[int(fillColor)], alpha); // assign the fill color
    x = mouseX; // get x position from mouse
    y = mouseY; // get y position from mouse
    float sz = random(10, 100); // choose a random size, at least 10 pixels 
    if (objectType == 0) // ellipse 
      ellipse(x, y, sz, sz);
    else if (objectType == 1) // rectangle 
      rect(x-sz/2, y-sz/2, sz, sz);
    else if (objectType == 2) // up-facing triangle 
      triangle(x-sz/2, y+sz/2, x+sz/2, y+sz/2, x, y-sz/2); 
    else if (objectType == 3) // down-facing triangle 
      triangle(x-sz/2, y-sz/2, x+sz/2, y-sz/2, x, y+sz/2);
    delay(100); // a bit of a delay to reduce the drawing rate
  }
}

void keyPressed() {
  // screen shot on 's' key
  if (key == 's' || key == 'S') {
    saveFrame("screenshot-####.png"); // save as numbered file
    imageSaved.trigger(); // play Image Saved audio
  }
  // delete graphics on 'delete' or 'backspace' keys
  if (key == DELETE || key == BACKSPACE) { 
    image(bg, 0, 0); // load full screen
    whoosh.trigger(); // play Whoosh audio
  }
}


