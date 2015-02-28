
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;

int rectX1, rectY1;
int rectX2, rectY2;
int rectX3, rectY3;
int rectX4, rectY4;
int rectX5, rectY5;
int rectX6, rectY6;
int rectSize = 30;

float alpha1 = 0;
float alpha2 = 0;
float alpha3 = 0;
float alpha4 = 0;
float alpha5 = 0;
float alpha6 = 0;

color baseColor;
//timeline notches
boolean rect1Over = false;
boolean rect2Over = false;
boolean rect3Over = false;
boolean rect4Over = false;
boolean rect5Over = false;
boolean rect6Over = false;

void setup() {
  size(747,640);
  smooth();
  img1 = loadImage("bringthefunkpurple.png");
  img2 = loadImage("orange.png");
  img3 = loadImage("prettypink.png");
  img4 = loadImage("green.png");
  img5 = loadImage("funkblue.png");
  img6 = loadImage("yellow.png");
  baseColor = color(255);
  // timeline notch locations
  rectX1 = width/4-rectSize-100;
  rectY1 = height/2-rectSize/2;
  rectX2 = width/4-rectSize;
  rectY2 = height/2-rectSize/2;
  rectX3 = width/4-rectSize+100;
  rectY3 = height/2-rectSize/2;
  rectX4 = width/4-rectSize+200;
  rectY4 = height/2-rectSize/2;
  rectX5 = width/4-rectSize+300;
  rectY5 = height/2-rectSize/2;
  rectX6 = width/4-rectSize+400;
  rectY6 = height/2-rectSize/2;
}

void draw(){
   update(mouseX,mouseY);
 
  noStroke();
  if (rect1Over) {
    background(img1);
    alpha1 = 255;
    alpha2 = 255;
    alpha3 = 255;
    alpha4 = 255;
    alpha5 = 255;
    alpha6 = 255;
  } else if (rect2Over) {
    background(img2);
     alpha1 = 255;
    alpha2 = 255;
    alpha3 = 255;
    alpha4 = 255;
    alpha5 = 255;
    alpha6 = 255;
  } else if (rect3Over) {
    background (img3);
    alpha1 = 255;
    alpha2 = 255;
    alpha3 = 255;
    alpha4 = 255;
    alpha5 = 255;
    alpha6 = 255;
  } else if (rect4Over) {
    background(img4);
     alpha1 = 255;
    alpha2 = 255;
    alpha3 = 255;
    alpha4 = 255;
    alpha5 = 255;
    alpha6 = 255;
  } else if (rect5Over) {
    background(img5);
     alpha1 = 255;
    alpha2 = 255;
    alpha3 = 255;
    alpha4 = 255;
    alpha5 = 255;
    alpha6 = 255;
  } else if (rect6Over) {
    background(img6);
    alpha1 = 255;
    alpha2 = 255;
    alpha3 = 255;
    alpha4 = 255;
    alpha5 = 255;
    alpha6 = 255;
  } else {
    background(baseColor);
  }
// Notches fade
alpha1 = alpha1-1;
alpha2 = alpha2-1;
alpha3 = alpha3-1;
alpha4 = alpha4-1;
alpha5 = alpha5-1;
alpha6 = alpha6-1;
//Drawing timeline notches
stroke(255);
fill(alpha1);
rect(rectX1, rectY1, rectSize, rectSize+20);
fill(alpha2);
rect(rectX2, rectY2, rectSize, rectSize+20);
fill(alpha3);
rect(rectX3, rectY3, rectSize, rectSize+20);
fill(alpha4);
rect(rectX4, rectY4, rectSize, rectSize+20);
fill(alpha5);
rect(rectX5, rectY5, rectSize, rectSize+20);
fill(alpha6);
rect(rectX6, rectY6, rectSize, rectSize+20);
}

void update(int x, int y) {
  if (overRect1(rectX1, rectY1, rectSize, rectSize+20)) {
    rect1Over= true;
    rect2Over= false;
    rect3Over= false;
    rect4Over= false;
    rect5Over= false;
    rect6Over= false;
  } else if (overRect2 (rectX2, rectY2, rectSize, rectSize+20)) {
    rect1Over= false;
    rect2Over= true;
    rect3Over= false;
    rect4Over= false;
    rect5Over= false;
    rect6Over= false;
  } else if (overRect3 (rectX3, rectY3, rectSize, rectSize+20)) {
    rect1Over= false;
    rect2Over= false;
    rect3Over= true;
    rect4Over= false;
    rect5Over= false;
    rect6Over= false;
  } else if (overRect4 (rectX4, rectY4, rectSize, rectSize+20)) {
    rect1Over= false;
    rect2Over= false;
    rect3Over= false;
    rect4Over= true;
    rect5Over= false;
    rect6Over= false;
  }else if (overRect5 (rectX5, rectY5, rectSize, rectSize+20)) {
    rect1Over= false;
    rect2Over= false;
    rect3Over= false;
    rect4Over= false;
    rect5Over= true;
    rect6Over= false;
  } else if (overRect6 (rectX6, rectY6, rectSize, rectSize+20)) {
    rect1Over= false;
    rect2Over= false;
    rect3Over= false;
    rect4Over= false;
    rect5Over= false;
    rect6Over= true;
  }else {
    rect1Over = rect2Over = rect3Over = rect4Over = rect5Over = rect6Over =false;
  }
}

boolean overRect1 (int x, int y, int width, int height)
{
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}

boolean overRect2 (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}

boolean overRect3 (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}
boolean overRect4 (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}
boolean overRect5 (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}
boolean overRect6 (int x, int y, int width, int height) {
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
        return true;
      } else {
        return false;
      }
}

