
float x;
float y;

int r; //red 0 - 255
int g; //green 0 - 255
int b; //blue 0 - 255

boolean colorchange;

color palegreen = color (200,255,200); 
color darkgreen = color (0, 127, 0);

color palered = color (255,200,200); 
color darkred = color (127, 0, 0);

color paleblue = color (200,200,255); 
color darkblue = color (0, 0, 127);

color white = color (255); 
color gray = color (50);

color pink = color (255, 200, 200); 
color yellow = color (255, 255, 0);

color orange = color (204, 102, 0); 
color cyan = color (0, 250, 250);

color purple = color (100, 0, 200); 
color magenta = color (250, 0, 250);

float lerp = 0.0;

int whichTool;

void setup () {
  
  size (900, 900);
  background (0);
  textSize(20);
  text("Clear = space bar", 10, 20);
  text("Press 1, 2, 3, 4, 5, 6, or 7", 10, 50);
  fill(255);
  colorchange = false;
  whichTool = 1;
  
}

void draw () {
  
  if (whichTool == 1) {
   
    toolOne();
    
  }
  
  if (whichTool == 2) {
   
    toolTwo();
    
  }
  
  if (whichTool == 3) {
   
    toolThree();
    
  }
  if (whichTool == 4) {
   
    toolFour();
    
  }
  
  if (whichTool == 5) {
   
    toolFive();
    
  }
  if (whichTool == 6) {
   
    toolSix();
    
  }
  if (whichTool == 7) {
   
    toolSeven();
    
  }
 
}



void keyPressed() {
  if (key==' ') {
    background(0);
  }
  
  if (key== '1' ) {
    whichTool = 1;
  }
  
  if (key=='2') {
    whichTool = 2;
  }
  
  if (key=='3') {
    whichTool = 3;
  }
   if (key=='4') {
    whichTool = 4;
  }
  if (key=='5') {
    whichTool = 5;
  }
  if (key=='6') {
    whichTool = 6;
  }
  if (key=='7') {
    whichTool = 7;
  }
}
void toolFive() {

  stroke(7);
  x= mouseX;
  y= mouseY;
  fill(r, g, b, 50);
  stroke (r, g, b, 50);


  if (mousePressed == true) {
    color temp = lerpColor (pink, yellow, lerp);
    noFill ();
    stroke (temp);
    strokeWeight(1);
    triangle(x+6, y+6, x-8, y-8, x-10, y+10);
    triangle(y+6, x+6, y-8, x-8, y-10, x+10);
    if (!colorchange) { // colorchange = false
      lerp += 0.01;
    } 
    else if (colorchange == true) {
      lerp -= 0.01;
    }
    if (lerp <=0 || lerp >= 1.0) {
      colorchange = !colorchange; // flipswitch. if colorchange used to be true it is now false
    }
  }
}
void toolFour() {

  stroke(7);
  x= mouseX;
  y= mouseY;
  fill(r, g, b, 50);
  stroke (r, g, b, 50);


  if (mousePressed == true) {
    color temp = lerpColor (white, gray, lerp);
    fill (temp);
    stroke (temp);
    strokeWeight(1);
    ellipse (x, y, 5, 5);
    noFill();
    stroke (temp);
    ellipse (x, y+5, 5, 5);
    ellipse (x-5, y, 5, 5);
    if (!colorchange) { // colorchange = false
      lerp += 0.01;
    } 
    else if (colorchange == true) {
      lerp -= 0.01;
    }
    if (lerp <=0 || lerp >= 1.0) {
      colorchange = !colorchange; // flipswitch. if colorchange used to be true it is now false
    }
  }
}
void toolOne() {
 
  stroke(7);
  x= mouseX;
  y= mouseY;
  fill(r, g, b, 50);
  stroke (r, g, b, 50);


  if (mousePressed == true) {
    color temp = lerpColor (palegreen, darkgreen, lerp);
    noFill ();
    stroke (temp);
    strokeWeight(1);
    rect(x,y,10,10);
    rect(y,x,10,10);
    if (!colorchange) { // colorchange = false
      lerp += 0.01;
    } 
    else if (colorchange == true) {
      lerp -= 0.01;
    }
    if (lerp <=0 || lerp >= 1.0) {
      colorchange = !colorchange; // flipswitch. if colorchange used to be true it is now false
    }
   fill(0,255,0);
   stroke(255,255,0);
    ellipse(x+5,y+5,5,5);
    
  } 
  
}
void toolSeven() {

  stroke(7);
  x= mouseX;
  y= mouseY;
  fill(r, g, b, 50);
  stroke (r, g, b, 50);


  if (mousePressed == true) {
    color temp = lerpColor (purple, magenta, lerp);
    fill (temp);
    stroke (temp);
    strokeWeight(1);
    ellipse (x, y, 10, 10);
    ellipse (y, x, 10, 10);
    noFill();
    stroke (temp);
    ellipse (x+50, y+50, 10, 10);
    ellipse (y+50, x+50, 10, 10);
    if (!colorchange) { // colorchange = false
      lerp += 0.01;
    } 
    else if (colorchange == true) {
      lerp -= 0.01;
    }
    if (lerp <=0 || lerp >= 1.0) {
      colorchange = !colorchange; // flipswitch. if colorchange used to be true it is now false
    }
  }
}
void toolSix() {

  stroke(7);
  x= mouseX;
  y= mouseY;
  fill(r, g, b, 50);
  stroke (r, g, b, 50);


  if (mousePressed == true) {
    color temp = lerpColor (orange, cyan, lerp);
    fill (temp);
    stroke (temp);
    strokeWeight(1);
    ellipse (x+5, y, 5, 5);
    ellipse (x, y, 5, 5);
    noFill();
    stroke (temp);
    ellipse (x+55, y+50, 5, 5);
    ellipse (x+50, y+50, 5, 5);
    if (!colorchange) { // colorchange = false
      lerp += 0.01;
    } 
    else if (colorchange == true) {
      lerp -= 0.01;
    }
    if (lerp <=0 || lerp >= 1.0) {
      colorchange = !colorchange; // flipswitch. if colorchange used to be true it is now false
    }
  }
}
void toolThree(){

stroke(7);
  x= mouseX;
  y= mouseY;
  fill(r, g, b, 50);
  stroke (r, g, b, 50);


  if (mousePressed == true) {
    color temp = lerpColor (paleblue, darkblue, lerp);
    noFill ();
    stroke (temp);
    strokeWeight(1);
    ellipse(x,y,10,10);
    ellipse(y,x,10,10);
    if (!colorchange) { // colorchange = false
      lerp += 0.01;
    } 
    else if (colorchange == true) {
      lerp -= 0.01;
    }
    if (lerp <=0 || lerp >= 1.0) {
      colorchange = !colorchange; // flipswitch. if colorchange used to be true it is now false
    }
   fill(0,0,255);
   stroke(255,255,0);
    ellipse(x,y,5,5);
    
  }
}
 void toolTwo() {
 
 stroke(7);
  x= mouseX;
  y= mouseY;
  fill(r, g, b, 50);
  stroke (r, g, b, 50);


  if (mousePressed == true) {
    color temp = lerpColor (palered, darkred, lerp);
    noFill ();
    stroke (temp);
    strokeWeight(1);
    triangle(x+6, y+6, x-8, y-8, x-10, y+10);
    triangle(y+6, x+6, y-8, x-8, y-10, x+10);
    if (!colorchange) { // colorchange = false
      lerp += 0.01;
    } 
    else if (colorchange == true) {
      lerp -= 0.01;
    }
    if (lerp <=0 || lerp >= 1.0) {
      colorchange = !colorchange; // flipswitch. if colorchange used to be true it is now false
    }
   fill(255,0,0);
   stroke(255,255,0,90);
    ellipse(x-3,y+3,5,5);
    
  }
}




