
//xy position of all of the wheels
int xpos_LF = 150;
int xpos_RF = 450;
int xpos_LR = 150;
int xpos_RR = 450;

int ypos_LF = 150;
int ypos_RF = 150;
int ypos_LR = 450;
int ypos_RR = 450;

int xin = 0;
int yin = 0;

float magnitude = 0;

void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  background(0);
  rectMode(CENTER);
  strokeWeight(6);
  stroke(255);
  noFill();
  rect(width/2, height/2, 180, 180);

  //mouse vector and magnitude
  magnitude();
  //Draw the wheels
  wheels(xpos_LF, ypos_LF, 0);
  wheels(xpos_RF, ypos_RF, 1);
  wheels(xpos_LR, ypos_LR, 1);
  wheels(xpos_RR, ypos_RR, 0);

  wheelMag();
}



void magnitude() {
  //set mouse positions
  if (mouseX > width/2-90 && mouseX < width/2 + 90) {
    if (mouseY > height/2-90 && mouseY < height/2 + 90) {
      stroke(0, 128, 255);
      line(width/2, height/2, mouseX, mouseY);
      float sqMag = sqrt(sq(mouseX-width/2) + sq(mouseY - height/2));
      magnitude = map(sqMag,-sqrt(sq(mouseX-width/2) + sq(mouseY - height/2)),sqrt(sq(mouseX-width/2)) + sq(mouseY - height/2),-45,45);
      xin = mouseX-width/2;
      yin = mouseY - height/2;
    }
    else {
      magnitude = 0;
    }
  }
  else {
    magnitude = 0;
  }
}



//draw the wheels
void wheels(int xpos, int ypos, int invert) {
  strokeWeight(15);
  stroke(0, 255, 60);

  if (invert == 0) {
    line(xpos - 15, ypos + 60, xpos + 15, ypos + 30);
    line(xpos - 15, ypos + 30, xpos + 15, ypos + 0);  
    line(xpos - 15, ypos + 0, xpos + 15, ypos + -30);     
    line(xpos - 15, ypos + -30, xpos + 15, ypos + -60);
  }

  else {

    line(xpos + 15, ypos + 60, xpos - 15, ypos + 30);
    line(xpos + 15, ypos + 30, xpos - 15, ypos + 0);  
    line(xpos + 15, ypos + 0, xpos - 15, ypos + -30);     
    line(xpos + 15, ypos + -30, xpos - 15, ypos + -60);
  }
  /*    
   else {
   
   }
   */
}


void wheelMag() {
  if (mousePressed == false) {
    strokeWeight(10);
    stroke(255, 0, 0);
    line(xpos_LF + 30, ypos_LF - xin + yin, xpos_LF + 30, ypos_LF);
    line(xpos_RF - 30, ypos_RF + xin + yin, xpos_RF - 30, ypos_RF);
    line(xpos_LR + 30, ypos_LR + xin + yin, xpos_LR + 30, ypos_LR);
    line(xpos_RR - 30, ypos_RR - xin + yin, xpos_RR - 30, ypos_RR);
  }
  else {
    strokeWeight(10);
    stroke(128,128, 0);
    line(xpos_LF + 30, ypos_LF - xin + yin, xpos_LF + 30, ypos_LF);
    line(xpos_RF - 30, ypos_RF + xin + yin, xpos_RF - 30, ypos_RF);
    line(xpos_LR + 30, ypos_LR - xin + yin, xpos_LR + 30, ypos_LR);
    line(xpos_RR - 30, ypos_RR + xin + yin, xpos_RR - 30, ypos_RR);
  }

}
  /*
//Draw the Vectors
   void vectors(int xpos, int ypos){
   strokeWeight(8);
   stroke(255,255,0);
   line(
   
   
   
   */
