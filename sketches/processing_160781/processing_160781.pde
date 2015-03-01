
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

float xSpeed = .25;
float xSpeed2 = .25;
float xPos =1;
float smallXPos =1;
float opacity, opacity2;
int rot, num, backgrdFill, xOffset, num2, rot2, diameter, diameter2;


void setup() {
  size (1000, 1000); 
  background(backgrdFill);
  num = 1;
  rot = 0;
  num2 = 8;
  rot2 = 0;
  opacity = 10;
  opacity2 = 50;
  backgrdFill=255;
  diameter=400;
}

void draw () {
  rot++;
  rot2--;
  diameter2 = mouseX-mouseY;
//  fill(random(100, 255), random(100, 255), random(100, 255), 50);
//  noStroke();
//  if (mousePressed) {
//    ellipse(mouseX, mouseY, diameter2, diameter2);
//  }
  fill(backgrdFill, 40);
  rect(0, 0, width, height);


  translate(width/2, height/2);
  noStroke();
  rotate(radians(rot));
  for (int i=0; i<num; i++) {
    rotate(radians(360/num * i));
  }

  //red circle
  pushMatrix();
  //rotate(radians(90));
  fill(255, 0, 0, opacity);
  bounce (xPos, 0, diameter); 
  popMatrix();

  //purple circle
  pushMatrix();
  fill(128, 3, 255, opacity);
  rotate(radians(45));
  bounce (xPos, 0, diameter); 
  popMatrix();

  //blue circle
  pushMatrix();
  fill(0, 50, 255, opacity);
  rotate(radians(90));
  bounce (xPos, 0, diameter); 
  popMatrix();

  //cyan circle
  pushMatrix();
  fill(0, 250, 235, opacity);
  rotate(radians(135));
  bounce (xPos, 0, diameter); 
  popMatrix();

  //green circle
  pushMatrix();
  fill(0, 150, 0, opacity);
  rotate(radians(180));
  bounce (xPos, 0, diameter); 
  popMatrix();

  //yellow circle
  pushMatrix();
  fill(255, 255, 60, opacity);
  rotate(radians(225));
  bounce (xPos, 0, diameter); 
  popMatrix();

  //orange circle
  pushMatrix();
  fill(255, 150, 0, opacity);
  rotate(radians(270));
  bounce (xPos, 0, diameter); 
  popMatrix();

  //redorange circle
  pushMatrix();
  fill(250, 109, 0, opacity);
  rotate(radians(-45));
  bounce (xPos, 0, diameter); 
  popMatrix();

  //small circles
  pushMatrix();
  rotate(radians(rot2));
  for (int j=0; j<num2; j++) {
    rotate(radians(360/num2 * -j));
    fill(255, opacity2);
    smallCircle (smallXPos, 0, 10);
  }
  popMatrix();
}
void bounce (float x, float y, float size) {
  xPos= xPos + xSpeed;
  ellipse (xPos, y, size, size);

  if (xPos >= width*.5) {
    xSpeed = xSpeed * -1;
  }
  if (xPos <= 0) {
    xSpeed = xSpeed * -1;
  }
}

void smallCircle (float x2, float y2, float size2) {
  smallXPos = smallXPos + xSpeed2;
  ellipse (smallXPos, y2, size2, size2);
  if (smallXPos >= width*.5) {
    xSpeed2 = xSpeed2 * -1;
  }
  if (smallXPos <= 0) {
    xSpeed2 = xSpeed2 * -1;
  }
}

//void mousePressed() {
//  if (opacity == 150) {
//    opacity = random(10, 200);
//  } else {
//    opacity = 150;
//  }
//}

void keyPressed() {
  if (key == ' ') 
  {
    xSpeed = random(.0625, 2);
  } else {
    xSpeed = .125;
  }
}
  void mousePressed() 
  {
    if (backgrdFill == 255) {
      backgrdFill = 0;
    }
  }
  void mouseReleased() 
  {
    if (backgrdFill == 0) {
      backgrdFill = 255;
    }
  }



