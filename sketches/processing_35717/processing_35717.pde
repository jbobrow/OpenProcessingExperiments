
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//Erica Lazrus - interactiveFace
//Face is awake when mouse is on the screen
//When face is awake, it will respond to the sound it hears
//Its eyes will also follow the mouse
//Clicking the various mouse buttons will make the face blink
//Both eyes or wink one eye at a time

int offset = 20;

//variables for detecting interactivity
boolean mouseOnScreen = false;
boolean wink = false;
boolean blink = false;

//variables to track locations of pupils in relation to location 
//of the mouse
float pupilX1;
float pupilX2;
float pupilY;

void setup() {
  setupAudio();
  size(600, 600);
}

void draw() {

  //determine if the mouse is on the screen
  setMouseOnScreen(mouseX, mouseY);
  smooth();

  //draw background
  if (mouseOnScreen) {
    background(19, 160, 152);

    //middle line

    //yellow stripe
    strokeWeight(60);
    stroke(246, 190, 31);
    line(width/2, 0, width/2, height);

    //green stripe
    strokeWeight(40);
    stroke(54, 159, 119);
    line(width/2, 0, width/2, height);

    //white triangles
    noStroke();
    fill(255, 255, 255);
    for (int i=0; i <= height-20; i += 20) {
      triangle(width/2, i, width/2-20, i+20, width/2+20, i+20);
    }

    //black stripe  
    strokeWeight(10);
    stroke(0, 0, 0);
    line(width/2, 0, width/2, height);

    //pink squares
    noStroke();
    fill(226, 93, 52);
    for (int i=5; i < height; i += 20) {
      rect(width/2-5, i, 10, 10);
    }

    //side lines

    //white stripes
    strokeWeight(40);
    stroke(227, 246, 250);
    line(width/4-15, 0, width/4-15, height);
    line(3*width/4+15, 0, 3*width/4+15, height);

    //background yellow stripes
    strokeWeight(10);
    stroke(238, 170, 37);
    line(width/4-15, 0, width/4-15, height);
    line(3*width/4+15, 0, 3*width/4+15, height);

    //black triangles
    noStroke();
    fill(0, 0, 0);
    for (int i=height; i > 0; i -= 20) {
      triangle(width/4-15, i, width/4-35, i-20, width/4+5, i-20);
      triangle(3*width/4+15, i, 3*width/4-5, i-20, 3*width/4+35, i-20);
    }

    //overlay yellow stripe
    strokeWeight(10);
    stroke(238, 170, 37, 50);
    line(width/4-15, 0, width/4-15, height);
    line(3*width/4+15, 0, 3*width/4+15, height);


    //side triangles
    noStroke();
    for (int i = -10; i <= height+10; i+=20) {
      //maroon triangles
      fill(68, 21, 41);
      triangle(0, i, width/8-20, i+10, 0, i+20);
      triangle(width, i, width-width/8+20, i+10, width, i+20);
      triangle(width/2+30, i, 5*width/8+10, i+10, width/2+30, i+20);
      triangle(width/2-30, i, 3*width/8-10, i+10, width/2-30, i+20);
      //red triangles
      fill(154, 37, 27);
      triangle(width/4+5, i, 3*width/8-15, i+10, width/4+5, i+20);
      triangle(width/4-35, i, width/8-15, i+10, width/4-35, i+20);
      triangle(3*width/4+35, i, 7*width/8+15, i+10, 3*width/4+35, i+20);
      triangle(3*width/4-5, i, 5*width/8+15, i+10, 3*width/4-5, i+20);
    }

    //dull background
    fill(255, 255, 255, 50);
    rect(0, 0, width, height);
  }
  else {
    background(200);
  }


  //draw hair
  noStroke();
  fill(0, 0, 0);
  ellipse(width/2, (height/3)+(2*offset), 2*(width/3), 
  3*(height/4));

  //draw lower face
  noStroke();
  fill(102, 101, 193);
  quad(width/2, height/2, width/4, 3*(height/4), width/2, 
  height-(2*offset), 3*(width/4), 3*(height/4));

  //draw cheeks
  noStroke();
  fill(229, 188, 72);
  quad(width/2, height/2, width/4, 3*(height/4), 2*offset, 
  height/2, width/4, height/3);
  quad(width/2, height/2, 3*(width/4), 3*(height/4), 
  width-(2*offset), height/2, 3*(width/4), height/3);

  //draw upper face
  noStroke();
  fill(155, 36, 46);
  beginShape();
  vertex(width/2, height/2);
  vertex(width/4, height/3);
  vertex((width/3)+20, height/5);
  vertex(width/2, (height/4)+40);
  vertex((2*(width/3))-20, height/5);
  vertex(3*(width/4), height/3);
  endShape(CLOSE);

  //draw nose
  noStroke();
  fill(124, 209, 150);
  triangle(width/2, height/3, width/3, 2*(height/3), 2*(width/3), 
  2*(height/3));

  //draw forehead
  noStroke();
  fill(102, 59, 111);
  quad(width/2, height/3, (width/3)+20, height/5, width/2, 
  height/8, (2*(width/3))-20, height/5);

  //draw mouth

  getVolume();

  if (mouseOnScreen) {
    //open mouth
    noStroke();
    fill(242, 90, 73);
    //let the volume determine how open the mouth is
    arc(width/2, (3*(height/4))-20, 150, 10+volume, radians(30), 
    radians(150));
  } 
  else {
    //closed mouth
    noFill();
    stroke(0, 0, 0);
    strokeWeight(5);
    beginShape();
    vertex((width/2)-65, (3*(height/4))+5);
    vertex(width/2, (3*(height/4))-20);
    vertex((width/2)+65, (3*(height/4))+5);
    endShape();
  }

  //draw blush

  //let volume determine how flushed the face is
  float blush = map(volume, 0, 50, 0, 255);

  if (mouseOnScreen) {
    //face is only flushed if the mouse is on screen
    noStroke();
    fill(250, 141, 248, blush);
    ellipse(width/4, (height/2)+20, 100, 100);
    ellipse(3*(width/4), (height/2)+20, 100, 100);
  }

  //draw eyes

  //determine pupil locations in relation to position of the 
  //mouse
  pupilX1 = map(mouseX, offset, width-offset, (width/3)+20, 
  (width/3)+30);
  pupilX2 = map(mouseX, offset, width-offset, 2*(width/3)-30, 
  2*(width/3)-20);
  pupilY = map(mouseY, offset, height-offset, (height/3)-10, 
  height/3);

  if (mouseOnScreen) {
    //determine if the face should be blinking or winking based 
    //on mouse clicks
    setBlink();
    setWink();
    if (!blink && !wink) {

      //if the face is not blinking or winking and the mouse is 
      //on screen, then open eyes

      noStroke();

      //white eyeball
      fill(255, 255, 255);
      arc((2*(width/3))-25, (height/3)+10, 80, 60, PI, TWO_PI);
      arc((width/3)+25, (height/3)+10, 80, 60, PI, TWO_PI);

      //blue irises
      fill(39, 100, 183);
      ellipse((2*(width/3))-25, (height/3)-5, 30, 30);
      ellipse((width/3)+25, (height/3)-5, 30, 30);

      //black pupils
      fill(0, 0, 0);
      ellipse(pupilX2, pupilY, 10, 10);
      ellipse(pupilX1, pupilY, 10, 10);
    }
    else {
      if (blink) {
        //if middle mouse button is pressed, blink both eyes
        blink();
      }
      if (wink) {
        //wink one eye based on right or left mouse button being 
        //pressed
        wink();
      }
    }
  }
  else {
    //if the mouse is not onscreen, then closed eyes
    noFill();
    strokeWeight(5);
    stroke(0, 0, 0);
    arc((width/3)+25, (height/3)-5, 70, 50, 0, PI);
    arc((2*(width/3))-25, (height/3)-5, 70, 50, 0, PI);
  }

  //draw nostrils

  float nostrilSize;

  if (mouseOnScreen) {
    //if the mouse is on screen, determine the nostril size based 
    //on volume
    nostrilSize = map(volume, 0, 200, 40, 60);
  }
  else {
    //if mouse is not on screen, use a fixed nostril size
    nostrilSize = 40;
  }

  noStroke();
  fill(0, 0, 0);
  arc((width/2)-35, 2*(height/3), nostrilSize, nostrilSize, PI, 
  TWO_PI);
  arc((width/2)+35, 2*(height/3), nostrilSize, nostrilSize, PI, 
  TWO_PI);

  if (!mouseOnScreen) {
    //if the mouse is not on screen, draw Z's to show that the
    //face is asleep
    drawZs();
  }
}

void setMouseOnScreen(float x, float y) {
  //set variable based on whether or not the mouse is on screen
  if (mouseOnScreen(x, y)) {
    mouseOnScreen = true;
  }
  else {
    mouseOnScreen = false;
  }
}

boolean mouseOnScreen(float x, float y) {
  //mouse is on screen if it is within the width of the screen 
  //and within the height of the screen
  return (mouseWithinWidth(x) && mouseWithinHeight(y));
}

boolean mouseWithinWidth(float x) {
  //returns true if mouse is within the width of the screen
  return (x > offset && x < width-offset);
}

boolean mouseWithinHeight(float y) {
  //returns true if the mouse is within the height of the screen
  return (y > offset && y < height-offset);
}

void setBlink() {
  //if the center mouse button is clicked, the face should blink
  if (mousePressed && mouseButton == CENTER) {
    blink = true;
  }
  else {
    blink = false;
  }
}

void blink() {
  //blink both eyes
  noFill();
  strokeWeight(5);
  stroke(0, 0, 0);
  arc((width/3)+25, (height/3)-5, 70, 50, 0, PI);
  arc((2*(width/3))-25, (height/3)-5, 70, 50, 0, PI);
  //remember to reset blink variable to false
  blink = false;
}

void setWink() {
  //set wink variable to true if the left or right mouse button 
  //is pressed
  if (mousePressed && mouseButton != CENTER) {
    wink = true;
  }
  else {
    wink = false;
  }
}

void wink() {
  if (mouseButton == LEFT) {

    //if left mouse button is clicked, wink left eye 
    noFill();
    strokeWeight(5);
    stroke(0, 0, 0);
    arc((width/3)+25, (height/3)-5, 70, 50, 0, PI);

    //keep right eye open
    noStroke();

    //white eyeball
    fill(255, 255, 255);
    arc((2*(width/3))-25, (height/3)+10, 80, 60, PI, TWO_PI);

    //blue iris
    fill(39, 100, 183);
    ellipse((2*(width/3))-25, (height/3)-5, 30, 30);

    //black pupil
    fill(0, 0, 0);
    ellipse(pupilX2, pupilY, 10, 10);
  }
  if (mouseButton == RIGHT) {

    //if right mouse button is clicked, wink right eye 
    noFill();
    strokeWeight(5);
    stroke(0, 0, 0);
    arc((2*(width/3))-25, (height/3)-5, 70, 50, 0, PI);

    //keep left eye open
    noStroke();

    //white eyeball
    fill(255, 255, 255);
    arc((width/3)+25, (height/3)+10, 80, 60, PI, TWO_PI);

    //blue iris
    fill(39, 100, 183);
    ellipse((width/3)+25, (height/3)-5, 30, 30);

    //black pupil
    fill(0, 0, 0);
    ellipse(pupilX1, pupilY, 10, 10);
  }
  //remember to reset wink variable back to false
  wink = false;
}

void drawZs() {
  //draw Z's to indicate that the face is asleep
  float xLoc;
  float yLoc;
  float fontSize;
  float fontColor;
  delay(500);
  for (int i=0; i < 10; i++) {
    //draw 10 Z's in random locations with random color and size
    xLoc = random(0, width);
    yLoc = random(0, height);
    fontSize = random(50, 100);
    fontColor = random(0, 256);
    fill(fontColor);
    textFont(createFont("SansSerif", fontSize));
    text("Z", xLoc, yLoc);
  }
}


