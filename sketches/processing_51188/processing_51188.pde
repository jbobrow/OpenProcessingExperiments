
// "L'Origine (et la fin) du Monde" by R.A. Robertson 2009 - 2011

float x1, y1, x2, y2, cx1, cy1, cx2, cy2, x;

color c0 = color(0, 10);  // Raven
color c1 = color(150, 150, 0, 15); // Blonde
color c2 = color(65, 50, 0, 15); // Brunette
color c3 = color(120, 30, 0, 15); // Redhead
color[] Pigment = { c0, c1, c2, c3 };
int i = 0; // Initialize color index in the array
boolean toggleLoop, toggleFill, toggleStroke;

void setup() {
  size(600, 600);
//  size(screen.height - 45, screen.height - 45);
  background (255);

  fill(127, 5, 0, 1);
  smooth ();
  frameRate(24);
  toggleLoop = toggleFill = toggleStroke = true;
}

void draw() {
  
  pushStyle();  // Hide pause display.
  noStroke();
  fill(255);
  rect(0, 0, 50, 50);
  popStyle();
  
  if (toggleStroke) {
    stroke(Pigment[i % 4]);
  }
  x1 = random(width*.45, width*.55);
  y1 = random(height*.1, height*.2);
  x2 = random(width*.49, width*.51);
  y2 = random(height*.8, height*.9);

  for (int L = 0; L < 1; L++) {

    cx1 = random(width);
    cy1 = random(height);
    cx2 = random(width);
    cy2 = random(height);

    bezier (x1, y1, cx1, cy1, cx2, cy2, x2, y2);
  }

  if (frameCount % 600 == 0) {  // Prevent runaway progression.
    toggleLoop = false;
    showPause();
  }

  //  Debugger block.  
//  float fc = frameCount;
//  println(fc);
//  println(i % 4);
//  println(hex(Pigment[i % 4]));  
//  println(toggleLoop);
}

void mousePressed() {  // Mouse toggles loop().
  if (toggleLoop) { 
    noLoop(); 
    toggleLoop = false;
    showPause();
  }
  else { 
    loop(); 
    toggleLoop = true;
  }
}

void keyPressed() {
  if (key == RETURN || key == ENTER) {  // Duplicates mouse toggle of loop().
    if (toggleLoop) { 
      noLoop(); 
      toggleLoop = false;
      showPause();
    }
    else { 
      loop(); 
      toggleLoop = true;
    }
  }
  if (key == ' ') {  // Space key resets canvas.
    background(#ffffff);
  }
  else if (key == 'f' || key == 'F') { // "F" key toggles fill().
    if (toggleFill) { 
      noFill(); 
      toggleFill = false;
    }
    else { 
      fill(127, 5, 0, 1); 
      toggleFill = true;
    }
  }
  else if (key == 's' || key == 'S') {  // "S" key toggles stroke().
    if (toggleStroke) { 
      noStroke(); 
      toggleStroke = false;
    }
    else { 
      stroke(Pigment[i % 4]);
      toggleStroke = true;
    }
  }
  else if (key == 'c' || key == 'C') {  // "C" cycles color presets.
    i++;
  }
  else if (key == 'i' || key == 'I') { // Saves an image file.
    saveFrame("origine-####.jpg");
  }
}

void showPause() {  // Display pause indicator.
    pushStyle();
    fill(100);
    rect(10, 10, 5, 20);
    rect(20, 10, 5, 20);
    popStyle();
    noLoop();
}
                
