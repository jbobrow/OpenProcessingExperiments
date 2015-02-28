
PFont mouseMe;
PImage waldo;
float mouseDistX;
float mousePosY;
boolean spot;
boolean mouseP;

void setup() {
  size(1200, 900);
  background(#FFDA08);
  mouseMe = loadFont("Helvetica-15.vlw");
  waldo = loadImage("waldo.jpg");
  fill(255);
  textFont(mouseMe);
}

void draw() {
  mouseDistX= dist(mouseX, mouseY, 1000, 135);
  mousePosY= dist(mouseX, mouseY, 1000, 135);
//  println(spot);
  spot =false;
  

  if (mouseDistX <=25) {

    fill(255);
    background(#FFDA08);
    text("You hit the spot, CLICK!!!!", mouseX, mouseY);
    spot= true;
  } 
  else {
    if (mouseDistX<=100) {
      fill(255);
      background(#FFDA08);
      text("You are almost there", mouseX, mouseY);
      spot=false;
    }
    else {
      if (mouseDistX<=200) {
        fill(255);
        background(#FFDA08);
        text("Getting closer", mouseX, mouseY);
        spot=false;
      }
      else {
        if (mouseDistX<=500) {
          fill(255);
          background(#FFDA08);
          text("You are still far", mouseX, mouseY);
          spot=false;
        }
        else {
          if (mouseDistX<=700) {
            fill(255);
            background(#FFDA08);
            text("You are really far away", mouseX, mouseY);
            spot=false;
          }
          else {
            if (mouseDistX<=900) {
              fill(255);
              background(#FFDA08);
              text("You are way off, are you even trying?", mouseX, mouseY);
              spot=false;
            }
            else {
              if (mouseDistX<=2000) {
                fill(255);
                background(#FFDA08);
                text("Cold as an iceberg", mouseX, mouseY);
                spot=false;
              }
            }
          }
        }
      }
    }
  }
  if ((spot==true) && (mousePressed)) {
    background(255, 255, 255);
    image(waldo, 100, 100);
    fill(#000000);
    text("YOU FOUND ME!!!!!!", mouseX, mouseY);
  }
}



