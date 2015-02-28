
//I just...I don't know anymore, I really don't.

CloudLlama[] instances = new CloudLlama[3];

void setup()
{
  size(800, 600);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
    for (int i=0; i<instances.length; i++) {
        instances[i] = new CloudLlama((i*100)+300, 400, i*(-50), (i*2)+10);
    }
}
 
void draw() {
  background(37, 32, 78);
  movement();
    for (int i=0; i<instances.length; i++) {
        instances[i].jump();
        instances[i].llamaDraw();
    }
}
 
 
class CloudLlama {
   
  //from now on, no global variables for dealing with stuff inside
  //the class.
   
     int localX, localY, minJump, maxJump, movement, wingX, wingY;
     int jumping = 0;
     boolean fleft = true;
       
     CloudLlama(int posX, int posY, int maxMax, int movespeed) {
       localX = posX;
       localY = posY;
       minJump = localY;
       maxJump = maxMax+200;
       movement = movespeed;
       wingX = localX;
       wingY = localY;
     }
     
     void llamaDraw() {
         pushMatrix();
         if (!fleft) {
          scale (-1, 1);
          translate(-localX*2, 0);
        }
        earShadow(localX, localY);
        frontLegShadow(localX, localY);
        backLegShadow(localX, localY);
        backWing(wingX, wingY, jumping);
        chestCloud(localX, localY);
        tailCloud(localX, localY);
        neck(localX, localY);
        ear(localX, localY);
        head(localX, localY);
        body(localX, localY);
        frontLeg(localX, localY);
        backLeg(localX, localY);
        eye(localX, localY);
        eyeShine(localX, localY);
        stars(localX, localY);
        wing(wingX, wingY, jumping);
        popMatrix();
     }
      
     void left() {
       fleft = true;
       localX = localX - movement;
       wingX = localX;
        if (localX < 235) {
         localX = 235;
         wingX = localX;
       }
     }
      
     void right() {
       fleft = false;
       localX = localX + movement;
       wingX = localX;
       if (localX > width-235) {
         localX = width-235;
         wingX = localX;
       }
     }
      
     void jump() {
      if (keyPressed) {
        if ((key == ' ') && (jumping == 0)) {
          jumping = 1;
        }
      }
      if (jumping == 1) {
        localY = localY - movement;
        wingY = localY;
        if (localY < maxJump) {
          jumping = 2;
        }
      }
      if (jumping == 2) {
        localY = localY + movement;
        wingY = localY;
        if (localY > minJump) {
         jumping = 0;
         localY = minJump;
         wingY = localY;
        }
      }
    }
    
}
 
 
void movement() {
  if (keyPressed == true) {
      if (keyCode == LEFT) {
        instances[0].left();
      }
      else if (keyCode == RIGHT) {
       instances[0].right();
      }
      else if (key == 'a' || key == 'A') {
        instances[1].left();
      }
      else if (key == 'd' || key == 'D') {
        instances[1].right();
      }
      else if (key == 'j' || key == 'J') {
        instances[2].left();
      }
      else if (key == 'l' || key == 'L') {
        instances[2].right();
      }
  }
}
 
 
 
//building parts separately
 
void earShadow(int localX, int localY){
  noStroke();
  fill(83, 78, 138);
  ellipse(localX-150, localY-190, 20, 40);
}
 
void frontLegShadow(int localX, int localY){
  beginShape();
  vertex(localX-80, localY+10);
  bezierVertex(localX-60, localY+70, localX-80, localY+200, localX-80, localY+200);
  vertex(localX-130, localY+20);
  endShape();
}
 
void backLegShadow(int localX, int localY){
  beginShape();
  vertex(localX+100, localY-30);
  bezierVertex(localX+140, localY+20, localX+110, localY+150, localX+70, localY+200);
  bezierVertex(localX+70, localY+150, localX+80, localY+90, localX+60, localY+40);
  endShape();
}
 
void backWing(int wingX, int wingY, int jumping) {
  fill(92, 136, 174);
  strokeWeight(6);
  stroke(189, 208, 225);
  pushMatrix();
  flutter(wingX,wingY,jumping);
  beginShape();
  vertex(wingX-10, wingY-20);
  bezierVertex(wingX-50, wingY+40, wingX-150, wingY-50, wingX-70, wingY-100);
  bezierVertex(wingX-100, wingY-150, wingX-40, wingY-200, wingX+40, wingY-170);
  endShape();
  popMatrix();
}
 
void chestCloud(int localX, int localY) {
  fill(176, 205, 229);
  stroke(236, 243, 248);
  beginShape();
  vertex(localX-180, localY-160);
  bezierVertex(localX-220, localY-130, localX-210, localY-110, localX-190, localY-100);
  bezierVertex(localX-230, localY-90, localX-260, localY-10, localX-190, localY-20);
  bezierVertex(localX-200, localY+20, localX-170, localY+20, localX-160, localY+10);
  bezierVertex(localX-160, localY+30, localX-130, localY+30, localX-120, localY);
  endShape();
  bezier(localX-200, localY-50, localX-170, localY-80, localX-150, localY-40, localX-190, localY-20);
}
 
void tailCloud(int localX, int localY) {
  pushMatrix();
  beginShape();
  vertex(localX+70, localY-70);
  bezierVertex(localX+230, localY-100, localX+260, localY+30, localX+210, localY+40);
  bezierVertex(localX+230, localY+80, localX+170, localY+120, localX+130, localY+60);
  endShape();
  noFill();
  bezier(localX+190, localY-10, localX+140, localY-30, localX+150, localY+50, localX+210, localY+40);
  popMatrix();
}
 
void neck(int localX, int localY) {
  noStroke();
  fill(118, 114, 166);
  beginShape();
  vertex(localX-140, localY-170);
  bezierVertex(localX-140, localY-170, localX-50, localY-30, localX-20, localY-20);
  bezierVertex(localX+30, localY-20, localX-110, localY+30, localX-124, localY+35);
  bezierVertex(localX-140, localY+10, localX-180, localY-150, localX-180, localY-150);
  endShape();
}
 
void ear(int localX, int localY) {
  ellipse(localX-140, localY-190, 20, 40);
}
 
void head(int localX, int localY) {
ellipse(localX-182, localY-160, 90, 50);
}
 
void body(int localX, int localY) {
ellipse(localX+10, localY+20, 275, 120);
}
 
void frontLeg(int localX, int localY) {
beginShape();
vertex(localX-50, localY+10); //start point of curve
bezierVertex(localX-30, localY+70, localX-50, localY+200, localX-50, localY+200); //1st handle, 2nd handle, end point of curve
vertex(localX-100, localY+20); //final vertex
endShape();
}
 
void backLeg(int localX, int localY) {
beginShape();
vertex(localX+130, localY-30);
bezierVertex(localX+170, localY+20, localX+140, localY+150, localX+100, localY+200);
bezierVertex(localX+100, localY+150, localX+110, localY+90, localX+90, localY+40);
endShape();
}
 
void eye(int localX, int localY) {
fill(0, 0, 0);
ellipse(localX-175, localY-160, 30, 30);
}
 
void eyeShine(int localX, int localY) {
fill(255, 255, 255);
ellipse(localX-180, localY-165, 10, 10);
}
 
void stars(int localX, int localY) {
pushMatrix();
translate(localX-140, localY-120);
rotate(radians(45));
rect(0, 0, 18, 18);
popMatrix();
  
pushMatrix();
translate(localX-105, localY-95);
rotate(radians(45));
rect(0, 0, 10, 10);
popMatrix();
  
pushMatrix();
translate(localX-115, localY-50);
rotate(radians(45));
rect(0, 0, 25, 25);
popMatrix();
  
pushMatrix();
translate(localX-75, localY+10);
rotate(radians(45));
rect(0, 0, 35, 35);
popMatrix();
  
//body squares into diamonds
pushMatrix();
translate(localX-60, localY+80);
rotate(radians(45));
rect(0, 0, 15, 15);
popMatrix();
  
pushMatrix();
translate(localX-20, localY+50);
rotate(radians(45));
rect(0, 0, 10, 10);
popMatrix();
  
pushMatrix();
translate(localX+20, localY+5);
rotate(radians(45));
rect(0, 0, 50, 50);
popMatrix();
  
pushMatrix();
translate(localX+65, localY+40);
rotate(radians(45));
rect(0, 0, 5, 5);
popMatrix();
  
pushMatrix();
translate(localX+85, localY);
rotate(radians(45));
rect(0, 0, 15, 15);
popMatrix();
  
pushMatrix();
translate(localX+120, localY+35);
rotate(radians(45));
rect(0, 0, 25, 25);
popMatrix();
}
 
void wing(int wingX, int wingY, int jumping) {
fill(176, 205, 229);
strokeWeight(6);
stroke(236, 243, 248);
pushMatrix();
flutter(wingX,wingY,jumping);
beginShape();
vertex(wingX+20, wingY-30);
bezierVertex(wingX-20, wingY+40, wingX-120, wingY-50, wingX-40, wingY-90);
bezierVertex(wingX-70, wingY-150, wingX-10, wingY-200, wingX+70, wingY-170);
bezierVertex(wingX+100, wingY-180, wingX+120, wingY-160, wingX+120, wingY-140);
bezierVertex(wingX+140, wingY-160, wingX+200, wingY-160, wingX+200, wingY-120);
bezierVertex(wingX+240, wingY-120, wingX+240, wingY-90, wingX+210, wingY-70);
bezierVertex(wingX+210, wingY-30, wingX+110, wingY+10, wingX+80, wingY-20);
bezierVertex(wingX+80, wingY-20, wingX+50, wingY+10, wingX+20, wingY-30);
endShape();
  
//finishing touches
noFill();
bezier(wingX+10, wingY-140, wingX-10, wingY-100, wingX+140, wingY-120, wingX+70, wingY-170);
bezier(wingX+200, wingY-120, wingX+180, wingY-80, wingX+150, wingY-120, wingX+170, wingY-130);
bezier(wingX+20, wingY-30, wingX+40, wingY-70, wingX-20, wingY-70, wingX-20, wingY-50);
bezier(wingX+80, wingY-20, wingX+50, wingY-70, wingX+160, wingY-90, wingX+120, wingY-40);
popMatrix();
}

void flutter(int wingX, int wingY, int jumping) {
  if (jumping == 1) {
     translate(wingX, wingY);
     rotate(radians(10));
     translate(-wingX, -wingY);
   }
  else if (jumping == 2) {
     translate(wingX, wingY);
     rotate(radians(-3));
     translate(-wingX, -wingY);
  }
}
