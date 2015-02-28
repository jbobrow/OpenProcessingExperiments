
// DEFINE VARIABLES
int bg = 0;
int LeyeX = 130;
int LeyeY = 200;
int ReyeX = 350;
int ReyeY = 200;
float d = dist(mouseX, mouseY, LeyeX, LeyeY);
float rd = dist(mouseX, mouseY, ReyeX, ReyeY);
boolean cleareverything = false;

// SETUP -----------------------------------------------
void setup() {
  size(480, 640);
  smooth( );
  background(bg);
  noStroke();
}

// DRAW -------------------------------------------------

//drawing tools-----------
void draw () {
  if (cleareverything)
  {
    background(0);
    cleareverything = false;
  }
  float b = dist(mouseX, mouseY, pmouseX, pmouseY);
  float c = constrain(b, 5, 25);
  if(mousePressed && (mouseButton == LEFT)) {
    fill(mouseX, 0, mouseY);
    ellipse(mouseX, mouseY, c, c);
  } else if(mousePressed && (mouseButton == RIGHT)) {
    fill(0);
    ellipse(mouseX, mouseY, 30, 30);
  } else {
    noFill();
  }
 
//left eye---------------------------
  /////colorful rim/////
  fill(mouseX, mouseY, 0);
  ellipse(LeyeX, LeyeY, 160, 160);
  
  /////white part/////
  fill(255);
  ellipse(LeyeX, LeyeY, 150, 150);
 
  /////iris/////
  fill(mouseX, 0, mouseY);
  d = constrain(d, 0, 25);
  float a = atan2(mouseY-LeyeY, mouseX-LeyeX);
  float x = LeyeX + cos(a) * d;
  float y = LeyeY + sin(a) * d;
  ellipse(x, y, 100, 100);
  
  fill(0, mouseX, mouseY);
  ellipse(x, y, 80, 80);
  
  fill(mouseX, mouseY, 0);
  ellipse(x, y, 60, 60);

  fill(mouseX, mouseY, 0);
  float v = constrain(b, 0, 150);
  ellipse(LeyeX, LeyeY, v, v);

  /////pupil/////
  fill(0);
  ellipse(x, y, 50, 50);
  
  /////reflection/////
  fill(255, 210);
  ellipse(LeyeX+40, LeyeY-40, 25, 25);
  
  fill(255, 210);
  ellipse(LeyeX+55, LeyeY-20, 10, 10);
  
 
  
//right eye---------------------------------
  /////colorful rim/////
  fill(mouseX, 0, mouseY);
  ellipse(ReyeX, ReyeY, 160, 160);
  
  /////white part/////
  fill(255);
  ellipse(ReyeX, ReyeY, 150, 150);
  
  /////iris/////
  fill(0, mouseX, mouseY);
  rd = constrain(rd, 0, 25);
  float ra = atan2(mouseY-ReyeY, mouseX-ReyeX);
  float rX = ReyeX + cos(ra) * rd;
  float rY = ReyeY + sin(ra) * rd;
  ellipse(rX, rY, 100, 100);
  
  fill(mouseX, mouseY, 0);
  ellipse(rX, rY, 80, 80);
  
  fill(mouseX, 0, mouseY);
  ellipse(rX, rY, 60, 60);

  fill(mouseX, 0, mouseY);
  ellipse(ReyeX, ReyeY, v, v);

  /////pupil/////
  fill(0);
  ellipse(rX, rY, 50, 50);
  
  /////reflection/////
  fill(255, 210);
  ellipse(390, 160, 25, 25);
  
  fill(255, 210);
  ellipse(405, 180, 10, 10);
  
  
// SCARED EYES --------------------------------
  if(mouseX > -10 && mouseX < 20 && mouseY > 620 && mouseY < 650) {
    fill(bg);
    rect(-20, -20, 500, 660); 
 
    fill(255);
    ellipse(LeyeX, LeyeY, 170, 300);
    ellipse(ReyeX, ReyeY, 170, 300);
    ellipse(240, 500, 100, 100);
  
    fill(0);
    ellipse(x-20, y+100, 150, 150);
    ellipse(rX-20, rY+100, 150, 150);
    ellipse(240, 580,  180, 180);
    
    fill(255, 0, 0);
    ellipse(x-15, y+100, 10, 10);
    ellipse(rX-15, rY+100, 10, 10);
    cleareverything = true;
    }

//erase everything-----------------     
    if(keyPressed) {
    if (key == 'b' || key == 'B') {
      fill(bg);
      rect(-20, -20, 500, 660);
    }
   }
}

