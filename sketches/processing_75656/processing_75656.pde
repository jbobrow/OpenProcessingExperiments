
//Amy Rosen
//Introduction to Digital Media
//09.13.12
//Section B


int value = 0;
int randomDiameter = 0;
int thin = 8;
int thick = 36;
float xpos1 = 134.0;
float xpos2 = 44.0;
float xpos3 = 58.0;
float xpos4 = 120.0;

void setup() {
  size(1200, 600);
  for(int i=0; i<100; i++) {
  background(randomDiameter,randomDiameter,randomDiameter);
  frameRate(20);
}
}

void draw() {
  
  if(mousePressed) {
    stroke(255);
    fill(100,0,0);
  } else {
    stroke(0);
    fill(204,100,0);
  }
  line(mouseX-66, mouseY, mouseX+66, mouseY);
  line(mouseX, mouseY-66, mouseX, mouseY+66); 

 
    if(mousePressed) {
      ellipse (mouseX,mouseY,randomDiameter, randomDiameter);
    }
      else {
        rect(mouseX,mouseY,randomDiameter,randomDiameter);
    }
    if(randomDiameter < 100) {
      randomDiameter ++;
    }
    else {
      randomDiameter = 0;
    }
    float mx = mouseX * 0.4 - width/5.0;
  
  fill(value);
  rect(xpos2, 0, thick, height/2);
  fill(value);
  rect(xpos1, 0, thin, height/2);
  fill(100,0,0);
  rect(xpos4, height/2, thick, height/2);
  fill(204,100,0);
  rect(xpos3, height/2, thin, height/2);
    
  xpos1 += mx/16;
  xpos2 += mx/64;
  xpos3 -= mx/16;
  xpos4 -= mx/64;
  
  if(xpos1 < -thin)  { xpos1 =  width; }
  if(xpos1 >  width) { xpos1 = -thin; }
  if(xpos2 < -thick) { xpos2 =  width; }
  if(xpos2 >  width) { xpos2 = -thick; }
  if(xpos3 < -thin)  { xpos3 =  width; }
  if(xpos3 >  width) { xpos3 = -thin; }
  if(xpos4 < -thick) { xpos4 =  width; }
  if(xpos4 >  width) { xpos4 = -thick; }
   for(int i=0; i<100; i++) {
 
  stroke(0,0,0);
  strokeWeight(.5);
}    
}

void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}

void keyPressed() {
  if (key == 's') {
    save ("amyRosen4.png");
    }
}
