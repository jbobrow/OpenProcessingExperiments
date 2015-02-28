
// variables for eye position and mouse over detection
int xpos;
int ypos;
int hr;
int vr;

// variables for iris x and y positions
float lixpos;
float rixpos;
float iypos;

// variables for distance for left and right irises
float ld;
float rd;
float lx;
float rx;
float y;
float langle;
float rangle;

// variables for boundary circles for irises
float lboundx;
float rboundx;
float boundy;
float boundr;

void setup() {
  size(640, 480);
  background(0);
  noStroke();
  
  xpos = width/2;
  ypos = height/2;
  
  // determines the "personal space" zone
  hr = 125;
  vr = 75;
  
  lixpos = xpos-57;
  rixpos = xpos+57;
  iypos = ypos-20;
  
  ld = dist(mouseX, mouseY, lixpos, iypos);
  rd = dist(mouseX, mouseY, rixpos, iypos);
}

void draw() {
  background(0);
  fill(255);
  
  xpos = constrain(xpos, 120, width-120);
  ypos = constrain(ypos, 70, height-20);
  
  // these need to be updated each time the eye moves, I think, so they can't just be in setup? 
  lixpos = xpos-57;
  rixpos = xpos+57;
  iypos = ypos-20;
  
  // left eye white
  beginShape();
  vertex(xpos-20, ypos);
  bezierVertex(xpos-30, ypos-100, xpos-80, ypos-60, xpos-110, ypos);
  bezierVertex(xpos-80, ypos+20, xpos-40, ypos+20, xpos-20, ypos);
  endShape();
  
  // right eye white
  beginShape();
  vertex(xpos+20, ypos);
  bezierVertex(xpos+30, ypos-100, xpos+80, ypos-60, xpos+110, ypos);
  bezierVertex(xpos+80, ypos+20, xpos+40, ypos+20, xpos+20, ypos);
  endShape();
  
  // eyes follow the cursor, but stay within a boundary circle at (xpos+57,ypos-20) with radius 65
  // ellipse(xpos+57,ypos-20,65,65);
  // ld and rd function as the radius boundary
  // langle and rangle calculate the angle to the mouse
  // lx and rx use that angle to determine the position of the irises
  
  ld = constrain(ld, 0, 17);
  langle = atan2(mouseY-iypos, mouseX-lixpos);
  lx = lixpos + cos(langle)*ld;
  //ly = iypos + sin(langle)*ld;
  
  rd = constrain(rd, 0, 17);
  rangle = atan2(mouseY-iypos, mouseX-rixpos);
  rx = rixpos + cos(rangle)*rd;
  //ry = iypos + sin(rangle)*rd;
  
  y = iypos + sin((rangle + langle)/2.0)*((rd + ld)/2);

  // irises and pupils
  // this version moves with the eye, but will not follow the cursor
  /*fill(58, 98, 160);
  ellipse(lixpos, iypos, 30, 30);
  ellipse(rixpos, iypos, 30, 30);
  fill(0);
  ellipse(lixpos, iypos, 7, 7);
  ellipse(rixpos, iypos, 7, 7);*/
  
  // irises and pupils
  // attempting moving using lx, ly, rx, ry
  fill(58, 98, 160);
  ellipse(lx, y, 30, 30);
  ellipse(rx, y, 30, 30);
  fill(0);
  ellipse(lx, y, 7, 7);
  ellipse(rx, y, 7, 7);
  
  // move away if the mouse invades personal space
  if (abs(mouseX-xpos) < hr && abs(mouseY-ypos)-40 < vr) {
    if (mouseX > xpos) {
      xpos += -3;//random(-3, 0);
    }
    
    if (mouseX < xpos) {
      xpos += 3;//random(2, 5);
    }
    
    if (mouseY > ypos-40) {
      ypos += -3;//random(-3, 0);
    }
    
    if (mouseY < ypos-40) {
      ypos += 3;//random(2, 5);
    }
  }
  
  // get scared and close eyes if the mouse is clicked
  if (mousePressed) {
    background(0);
  }
}


