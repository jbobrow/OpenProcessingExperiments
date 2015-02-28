
// The project shows vinyl that creates disco atmosphere. 

// Press any key at the beginning to create and show the vinyl.
// Press 's' key to save sketch.
// Freely move mouse to change background color.
// Press mouse button to put the needle over vinyl and hear the needle sound. The crowd will go crazy!!!
// Drag the mouse and in addition to enabling the needle and changing the background color,
// you will be able to see the vinyl rounding. The music will start and the crowd will go wild.
// Continue to round and round the vynil, by dragging the mouse, to listen to the entire song.

// The effect of rounding vynil is achieved changing the x and y of the ellipse. I'm very proud with this!!!
// The sound is my final sound project with small modifications.
// The sound of the needle is taken from freesound.org

import ddf.minim.*;

// vynil varialbes
int vinylRadius = 450;
int centerX = 450;
int centerY = 300;
color[] palette = {#FFFFFF, #000000, #E82525, #C6C4C4, #3E3B3B };
int[] circles = {5, 50, 20, 50, 50, 50, 50, 20 };
boolean isVinylDrawed = false;
int margin = 0;

// sound variables
Minim minim;
AudioPlayer mainSound;
AudioPlayer needleSound;

// image variables
PImage party1;
PImage party2;
PImage party3;
PImage party4;
PImage party5;
PImage party6;
PImage party7;
int indexImages = 0;
// PImage[] partyImages = { party1, party2, party3, party4, party5, party6, party7 };

void setup() {
  size(800, 800);      
  textSize(32);
  text("Press any key to get the party started!!!", 10, 30);
  
  minim = new Minim(this);
  mainSound = minim.loadFile("main.mp3");
  needleSound = minim.loadFile("vynil-needle.mp3");
  
  party1 = loadImage("party1.jpg");
  party2 = loadImage("party2.jpg");
  party3 = loadImage("party3.jpg");
  party4 = loadImage("party4.jpg");
  party5 = loadImage("party6.jpg");
  party6 = loadImage("party7.jpg");
}

void stop()
{
  mainSound.close();
  needleSound.close();
  minim.stop();
  super.stop();
}

void draw() {
  if(isVinylDrawed) {
    colorMode(HSB, width, height, 100);
    background(mouseX, mouseY, 70);
    fill(mouseX, mouseY, 70);
    line(0, 600, 800, 600);
    drawVinyl(false);
    if(mousePressed) {
        drawVinyl(true);
    }
  }
}

void keyPressed() {
    isVinylDrawed = true;
}

void mousePressed() {
  needleSound.play();
}

void mouseDragged() {
  needleSound.pause();
  mainSound.play();
  if(margin == 0) {
    margin = 2;
  } else {
    margin = 0;
  }
}

void mouseReleased() {
    needleSound.pause();
    mainSound.pause();
    if(isVinylDrawed) {
      drawVinyl(false);
    }
}

void keyReleased() {
  if(key == 's' || key == 'S') {
    saveFrame("vinyl.png");
  }
}

void drawImages() {
     if(indexImages >= 0 && indexImages < 8) {
       image(party1, 200, 602, 400, 198);
     } else if (indexImages >= 8 && indexImages < 16) {
       image(party2, 200, 602, 400, 198);
     } else if (indexImages >= 16 && indexImages < 24) {
        image(party3, 200, 602, 400, 198);
     } else if(indexImages >= 24 && indexImages < 32) {
       image(party4, 200, 602, 400, 198);
     } else if (indexImages >= 32 && indexImages < 40) {
       image(party5, 200, 602, 400, 198);
     } else if (indexImages >= 40 && indexImages < 48) {
        image(party6, 200, 602, 400, 198);
     } else if (indexImages >= 48) {
        indexImages = -1;
     }
     indexImages++;
}

void drawVinyl(boolean isNeedleOn) {
  drawElipsese();
  fill(palette[1]);
  ellipse(centerX, centerY, 160, 160);
  fill(palette[2]);
  ellipse(centerX, centerY, 130, 130);
  fill(palette[0]);
  stroke(palette[0]);
  ellipse(centerX, centerY, 10, 10);
  drawNeedle(isNeedleOn);
  drawButtons();
}

void drawElipsese() {
  fill(palette[4]);
  stroke(palette[1]);
  int index = 0;
  int sum = 0;
  while(index < circles.length - 1) {
      ellipse(centerX, centerY, vinylRadius - margin, vinylRadius + margin);
      vinylRadius-=circles[index];
      sum+=circles[index];
      index++;
  }
  vinylRadius+=sum;
}

void drawNeedle(boolean isNeedleOn) {   
  if(isNeedleOn) {
      stroke(mouseX, mouseY, 70);
      strokeWeight(11);
      line(100, 500, 250, 100);
  } 
   stroke(palette[1]);
   strokeWeight(10);
   ellipse(100, 500, 100, 100);
   ellipse(200, 500, 50, 50);
   fill(mouseX, mouseY, 70);
   if(isNeedleOn) {
     stroke(palette[1]);
     line(100, 500, 350, 140);
     drawImages();
   } else {
     stroke(palette[1]);
     line(100, 500, 250, 100);
   }
}

void drawButtons() {
  int centerX = 750; 
  int centerY = 500;
  int radius = 60;
  int weight = 16;
  for(int x=0; x < 3; x++) {
    for(int y = 0; y < 4; y++){
      strokeWeight(weight);
      ellipse(centerX, centerY, radius, radius);
      radius = radius/2;
      weight = weight/2;
    }
    radius = 60;
    weight = 16;
    centerY = centerY - 100;
  }
}

