
import processing.video.*;
MovieMaker mm; // Declare MovieMaker object


void setup () {
  size(800, 500);
  background(230);

  // Create MovieMaker object with size, filename,
  // compression codec and quality, framerate
  mm = new MovieMaker(this, width, height, "drawingluz.mov",
  30, MovieMaker.ANIMATION, MovieMaker.HIGH);


  smooth();
  noStroke();
}



void draw () {
}


void keyPressed () {
  if (key == 'd') {
    endRecord();
    exit();
  }

  //cuadrados
  noStroke();
  int y = int(random(20, 40));
  //is w is pressed, draw this
  if (key == 'y') {
    fill (random(30,200), random(60), random(20, 90), 40);
    rect (mouseX, mouseY, y, y); //use the mouse to draw with and use r variable to determine random size
    stroke (random(30,200), random(60), random(20, 90), 40);
    line (mouseX, mouseY, 200, y); //use the mouse to draw with and use r variable to determine random size

    fill (random(20,100), random(40), random(50, 80), 20);
    rect (mouseX, mouseY, 20, 20); //use the mouse to draw with and use r variable to determine random size
    stroke (random(30,200), random(60), random(20, 90), 20);
    line (mouseX, mouseY, y, y); //use the mouse to draw with and use r variable to determine random size
  }
  //cuadrados2
  noStroke();
  int t = int(random(20, 40));
  //is w is pressed, draw this
  if (key == 't') {
    fill (random(30,200), random(30), random(20, 90), 40);
    rect (mouseX, mouseY, t, t); //use the mouse to draw with and use r variable to determine random size
    stroke (random(30,200), random(60), random(20, 90), 40);
    line (mouseX, mouseY, 400, t); //use the mouse to draw with and use r variable to determine random size
  }
  
  //solo
  int u = int(random(10, 20));
  if (key == 'u') {
    fill (random(30,200), random(30), random(20, 90), 60);
    rect (mouseX, mouseY, u, u); //use the mouse to draw with and use r variable to determine random size
    stroke (random(30,200), random(60), random(20, 90), 40);
    
  }
  
  
  if (key == 's') {
    mm.finish(); // Finish the movie if space bar is pressed!
  }


  if (key=='c') {
    fill(230);
    rect(0,0,width,height);
  
}

//cuadrados3
noStroke();
int r = int(random(20, 40));
//is w is pressed, draw this
if (key == 'r') {
  fill (random(30,200), random(60), random(20, 90), 40);
  rect (mouseX, mouseY, r, r); //use the mouse to draw with and use r variable to determine random size
  stroke (random(30,200), random(60), random(20, 90), 40);
  line (mouseX, mouseY, 600, r); //use the mouse to draw with and use r variable to determine random size
}

mm.addFrame(); // Add window's pixels to movie
}


