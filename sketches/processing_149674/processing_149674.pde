
// You're Just so Game-Like

// The sketch is prepared as the final project in Introduction to Computational Arts Course: Audio.

// Import library
import ddf.minim.*;

// Global variables
color[] sightSeeing = {#D9919C , #173C5E , #FAD9B0 , #F5D8C1 , #F0A2A0 };
color[] thickCupcake = {#DA5074 , #BF4E6A , #60728A , #F2D4BC , #DBD7D8 };
float counter = 0;

Minim minim;
AudioSample stutter;
AudioSample lines;
AudioSample newcanvas;

// Create  setup code block
void setup() {
  size(1280, 720);
  background(sightSeeing[0]);
  
  minim = new Minim(this);
  stutter = minim.loadSample("Stutter.mp3");
  lines = minim.loadSample("Lines.mp3");
  newcanvas = minim.loadSample("NewCanvas.mp3");
}

// Create the draw code block
void draw() {
  // Setup while loop counting up to 8000
  while(counter < 8000){
    stroke(thickCupcake[int(random(1,5))]);
    strokeWeight(random(1,10));
    fill(sightSeeing[int(random(1,5))]);
    float x = random(width);
    float y = random(height);
    float d = random(10, 80);
    ellipse(x, y, d, d);
    counter += random(-1, +2);
  }
}

// Assign key interactions
void keyPressed() {
  if (key == DELETE || key == BACKSPACE) background(thickCupcake[int(random(1,5))]); 
  if (key == '2') stutter.trigger();  
  if (key == '7') lines.trigger();
  if (key == DELETE || key == BACKSPACE) newcanvas.trigger();

  switch(key) {
    case '1':
      stroke(thickCupcake[int(random(1,5))]);
      strokeWeight(random(1,10));
      fill(sightSeeing[int(random(1,5))]);
      ellipse(random(width), random(height), random (10, 80), random (10, 80));
      ellipse(random(width), random(height), random (10, 80), random (10, 80));
      ellipse(random(width), random(height), random (10, 80), random (10, 80));
      ellipse(random(width), random(height), random (10, 80), random (10, 80));
      ellipse(random(width), random(height), random (10, 80), random (10, 80));
      ellipse(random(width), random(height), random (10, 80), random (10, 80));
      ellipse(random(width), random(height), random (10, 80), random (10, 80));
      ellipse(random(width), random(height), random (10, 80), random (10, 80));
      ellipse(random(width), random(height), random (10, 80), random (10, 80));
      ellipse(random(width), random(height), random (10, 80), random (10, 80));
      ellipse(random(width), random(height), random (10, 80), random (10, 80));
      break;
      
    case '2':
      stroke(thickCupcake[int(random(1,5))]);
      strokeWeight(random(1,10));
      fill(sightSeeing[int(random(1,5))]);
      ellipse(random(width/2), 100, 100, 100);
      ellipse(random(width/2), 500, 100, 100);
      break;
      
    case '3':
      ellipse(250, random(height/2), 100, 100);
      ellipse(100, random(height/2), 100, 100);
      ellipse(width-50, random(height/2), 100, 100);
      break;
      
    case '4':
      stroke(thickCupcake[int(random(1,5))]);
      strokeWeight(random(1,10));
      fill(sightSeeing[int(random(1,5))]);
      ellipse(random(height/3), 100, 100, 100);
      ellipse(random(height/2), 200, 100, 100);
      ellipse(random(height/4), 300, 100, 100);
      ellipse(random(height/5), 400, 100, 100);
      break;
      
    case '5':
      stroke(thickCupcake[int(random(1,5))]);
      strokeWeight(random(1,10));
      fill(sightSeeing[int(random(1,5))]);
      ellipse(width/2, 25, random(400), 400);
      ellipse(width/3, 600, random(500), 500);
      ellipse(width/4, random(700), 100, 100);
      ellipse(height/5, random(height), 500, 500);
      ellipse(width, random(200), 300, 300);
      break;
      
    case '6':
      stroke(thickCupcake[int(random(1,5))]);
      strokeWeight(random(1,10));
      fill(thickCupcake[int(random(1,5))]);
      ellipse(0, 0, 200, 200);
      ellipse(random(width), random(100), 100, 100);
      ellipse(height/2, 100, 50, 50);
      ellipse(100, height/2, 60, 60);
      ellipse(400, 400, 80, 80);
      ellipse(400, 600, 100, 100);
      break;
      
    case '7':
      stroke(thickCupcake[int(random(1,5))]);
      strokeWeight(random(1,10));
      line(random(width), random(height), random(width), random(height));
      stroke(sightSeeing[int(random(1,5))]);
      strokeWeight(random(1,10));
      line(random(width), random(height), random(width), random(height));
    
  }
}

