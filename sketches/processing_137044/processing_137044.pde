
/* @pjs preload = "beard1.jpg, beard2.jpg, beard3.jpg, beard4.jpg, beard5.jpg, beard6.jpg, beard7.jpg, beard8.jpg, beard9.jpg, beard10.jpg, beard11.jpg, beard12.jpg, beard13.jpg, beard14.jpg, beard15.jpg, beard16.jpg, beard17.jpg, beard18.jpg, beard19.jpg, beard20.jpg, beard21.jpg, beard22.jpg"; */

PImage b1;
PImage b2;
PImage b3;
PImage b4;
PImage b5;
PImage b6;
PImage b7;
PImage b8;
PImage b9;
PImage b10;
PImage b11;
PImage b12;
PImage b13;
PImage b14;
PImage b15;
PImage b16;
PImage b17;
PImage b18;
PImage b19;
PImage b20;
PImage b21;
PImage b22;
int click = 0;
int mouseClicks;
int myState = 0;

void setup() {
  size(500, 500);
  background(255, 255, 255);
  b1 = loadImage("beard1.jpg");
  b2 = loadImage("beard2.jpg");
  b3 = loadImage("beard3.jpg");
  b4 = loadImage("beard4.jpg");
  b5 = loadImage("beard5.jpg");
  b6 = loadImage("beard6.jpg");
  b7 = loadImage("beard7.jpg");
  b8 = loadImage("beard8.jpg");
  b9 = loadImage("beard9.jpg");
  b10 = loadImage("beard10.jpg");
  b11 = loadImage("beard11.jpg");
  b12 = loadImage("beard12.jpg");
  b13 = loadImage("beard13.jpg");
  b14 = loadImage("beard14.jpg");
  b15 = loadImage("beard15.jpg");
  b16 = loadImage("beard16.jpg");
  b17 = loadImage("beard17.jpg");
  b18 = loadImage("beard18.jpg");
  b19 = loadImage("beard19.jpg");
  b20 = loadImage("beard20.jpg");
  b21 = loadImage("beard21.jpg");
  b22 = loadImage("beard22.jpg");
  imageMode(CENTER);
};

void draw() {
  println();
  smooth();
  noStroke();
  println(mouseClicks);
  
  switch(myState) {
    case 0:
    image(b1,width/2,height/2);
    if (mouseClicks > 5) {
      myState = 1;
    }
    break;
    
    case 1:
    image(b2, width/2, height/2);
    if (mouseClicks > 10) {
      myState = 2;
    }
    break;
    
    case 2:
    image(b3, width/2, height/2);
    if (mouseClicks > 15) {
      myState = 3;
    }
    break;
    
    case 3:
    image(b4, width/2, height/2);
    if (mouseClicks > 20) {
      myState = 4;
    }
    break;
    
    case 4:
    image(b5, width/2, height/2);
    if (mouseClicks > 25) {
      myState = 5;
    }
    break;
    
    case 5:
    image(b6, width/2, height/2);
    if (mouseClicks > 30) {
      myState = 6;
    }
    break;
    
    case 6:
    image(b7, width/2, height/2);
    if (mouseClicks > 35) {
      myState = 7;
    }
    break;
    
    case 7:
    image(b8, width/2, height/2);
    if (mouseClicks > 40) {
      myState = 8;
    }
    break;
    
    case 8:
    image(b9, width/2, height/2);
    if (mouseClicks > 45) {
      myState = 9;
    }
    break;
    
    case 9:
    image(b10, width/2, height/2);
    if (mouseClicks > 50) {
      myState = 10;
    }
    break;
    
    case 10:
    image(b11, width/2, height/2);
    if (mouseClicks > 55) {
      myState = 11;
    }
    break;
    
    case 11:
    image(b12, width/2, height/2);
    if (mouseClicks > 60) {
      myState = 12;
    }
    break;
    
    case 12:
    image(b13, width/2, height/2);
    if (mouseClicks > 65) {
      myState = 13;
    }
    break;
    
    case 13:
    image(b14, width/2, height/2);
    if (mouseClicks > 70) {
      myState = 14;
    }
    break;
    
    case 14:
    image(b15, width/2, height/2);
    if (mouseClicks > 75) {
      myState = 15;
    }
    break;
    
    case 15:
    image(b16, width/2, height/2);
    if (mouseClicks > 80) {
      myState = 16;
    }
    break;
    
    case 16:
    image(b17, width/2, height/2);
    if (mouseClicks > 85) {
      myState = 17;
    }
    break;
    
    case 17:
    image(b18, width/2, height/2);
    if (mouseClicks > 90) {
      myState = 18;
    }
    break;
    
    case 18:
    image(b19, width/2, height/2);
    if (mouseClicks > 95) {
      myState = 19;
    }
    break;
    
    case 19:
    image(b20, width/2, height/2);
    if (mouseClicks > 100) {
      myState = 20;
    }
    break;
    
    case 20:
    image(b21, width/2, height/2);
    if (mouseClicks > 105) {
      myState = 21;
    }
    break;
    
    case 21:
    image(b22, width/2, height/2);
    if (mouseClicks > 110) {
      mouseClicks = 0;
      myState = 0;
    }
    break;
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    mouseClicks++;
  } else { mouseClicks = 0;
  }
}



