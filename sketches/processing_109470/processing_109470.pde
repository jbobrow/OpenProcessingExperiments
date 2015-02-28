
//Alex Lee, asl1@andrew.cmu.edu, 60-257, HW5
//Copyright Alex Lee 2013, Pittsburgh PA

/*

LEFT-CLICK to teleport. 
Press SPACE to enter OR leave death. 
Press UP arrow to grow. 
Press DOWN arrow to shrink. 
Press 'r' to restart.

*/

Teleport teleportSquare;


float ps; //pixelsize
float psChange = 2;

float mouseLastX;
float mouseLastY;

boolean lightBoolean; 


color lightBgColor = #F6F6F6;
color lightWordColor = #041224;

color figHair = #8A7E79;
color figSkin = #FADDC3;
color figJacket = #854848;
color figPants = #0D1D38;
color figShoes = #FAD2C0;
color figWatch = #3457FF; 

color teleportBoxColor = color(5,218,230,110);
color teleportAppearColor = color(217,24,101,110);

color darkBgColor = #1C1D1F;

float darkTransparency = 150;
color darkStroke = color(28,29,31,255);
color darkHair = color(0, 140, 158, darkTransparency);
color darkJacket = color(0,180,204, darkTransparency);
color darkSkin = color(0, 223, 252, darkTransparency);
color darkWatch = color(222, 44, 44, darkTransparency/2);

color darkCurrentFig = lightBgColor;

float[] darkFigXArray = new float[0];
float[] darkFigYArray = new float[0];

//is there a way to adjust spacing so you don't have to do this? 
String explanationWord = "This is Orpheus. He is wearing a blue teleportation watch. He can LEFT-CLICK to teleport.";
String explanationWord2 = "But this is not a teleportation watch. Each time he LEFT-CLICKs, he builds a new iteration"; 
String explanationWord3 = "of himself. Press SPACE to view his discarded iterations.";

//this is a stupid way to do it, generating new classes is cleaner 
int[] teleportTimeArray = new int[0];
float[] teleportXArray = new float[0];
float[] teleportYArray = new float[0];
int[] teleportColorArray = new int[0];  

void setup() {
  size(600, 600);
  textSize(11);
  frameRate(20);
  restartGame();
}

void restartGame() {
  background(lightBgColor);
  ps = 8; 
  mouseLastX = width/2;
  mouseLastY = height/2;
  lightBoolean = true;
  switchToLight();
  darkFigXArray = new float[0];
  darkFigYArray = new float[0];
}

void draw() {
  refreshScreen(lightBoolean);
  if(lightBoolean) {
    refreshTeleportTimer();
    drawFigure(mouseLastX - ps*8/2, mouseLastY - ps*16/2, lightBgColor, figHair, figSkin, figJacket, figPants, figShoes, figWatch);
  }
  else {
    for(int i = 0; i < darkFigXArray.length; i++) {
      drawFigure(darkFigXArray[i] - ps*8/2, darkFigYArray[i] - ps*16/2, darkStroke, darkHair, darkSkin, darkJacket, darkHair, darkJacket, darkWatch);
    }
    drawFigure(mouseLastX - ps*8/2, mouseLastY - ps*16/2, darkStroke, darkCurrentFig, darkCurrentFig, darkCurrentFig, darkCurrentFig, darkCurrentFig, figWatch);
  }
  
}

void refreshScreen(boolean Light) {
  if(Light) {
    background(lightBgColor);
    fill(lightWordColor);
    textAlign(CENTER);
    int x = 30;
    text(explanationWord, width/2, 100 + x);
    text(explanationWord2, width/2, 111 + x);
    text(explanationWord3, width/2, 122 + x);
  }
  if(!Light) {
    background(darkBgColor);
    fill(lightWordColor);
    //text(explanationWord, width/2 - 150, 100, 300, 200);
  }
}


void drawFigure(float X, float Y, color Bg, color Hair, color Skin, color Jacket, color Pants, color Shoes, color Watch) { 
  //if you were to make this again, you want ps to be an internal variable, so that if you changed the size
  //with arrow keys you wouldn't change the existing iterations, only the newest one 
  //it would also be nice if this could work for the dark figures too
  
  stroke(Bg);
  
  pushMatrix();
  translate(X, Y); 
  
  fill(Hair);
  rect(2*ps,0*ps,ps,ps); 
  rect(3*ps,0*ps,ps,ps); 
  rect(4*ps,0*ps,ps,ps); 
  rect(3*ps,1*ps,ps,ps); 
  rect(3*ps,2*ps,ps,ps); 
  rect(4*ps,1*ps,ps,ps); 
  rect(4*ps,2*ps,ps,ps); 
  
  fill(Skin);
  rect(2*ps,1*ps,ps,ps); 
  rect(2*ps,2*ps,ps,ps); 
  rect(2*ps,3*ps,ps,ps); 
  rect(3*ps,3*ps,ps,ps); 
  rect(4*ps,3*ps,ps,ps); 
  rect(3*ps,4*ps,ps,ps); 
  rect(4*ps,4*ps,ps,ps);
  //rect(2*ps,9*ps,ps,ps); //possibly remove
  
  fill(Jacket);
  rect(2*ps,5*ps,ps,ps); 
  rect(3*ps,5*ps,ps,ps); 
  rect(4*ps,5*ps,ps,ps); 
  rect(2*ps,6*ps,ps,ps); 
  rect(3*ps,6*ps,ps,ps); 
  rect(4*ps,6*ps,ps,ps); 
  rect(2*ps,7*ps,ps,ps); 
  rect(3*ps,7*ps,ps,ps); 
  rect(4*ps,7*ps,ps,ps); 
  rect(2*ps,8*ps,ps,ps); 
  rect(3*ps,8*ps,ps,ps); 
  rect(4*ps,8*ps,ps,ps); 
  rect(3*ps,9*ps,ps,ps); 
  rect(4*ps,9*ps,ps,ps); 
  rect(2*ps,10*ps,ps,ps); 
  rect(3*ps,10*ps,ps,ps); 
  rect(4*ps,10*ps,ps,ps); 
  
  //right arm
  rect(5*ps,5*ps,ps,ps); 
  rect(6*ps,6*ps,ps,ps); 
  rect(6*ps,7*ps,ps,ps); 
  rect(6*ps,8*ps,ps,ps); 
  rect(6*ps,9*ps,ps,ps); 
  
  //left arm
  rect(1*ps,5*ps,ps,ps); 
  rect(0*ps,5*ps,ps,ps); 
  rect(0*ps,4*ps,ps,ps); 
  rect(0*ps,3*ps,ps,ps); 
  
  //hands
  fill(Skin);
  rect(5*ps,10*ps,ps,ps); 
  rect(0*ps,1*ps,ps,ps); 
  
  
  fill(Pants);
  rect(2*ps,11*ps,ps,ps); 
  rect(3*ps,11*ps,ps,ps); 
  rect(4*ps,11*ps,ps,ps);
  rect(2*ps,12*ps,ps,ps); 
  rect(3*ps,12*ps,ps,ps); 
  rect(4*ps,12*ps,ps,ps); 
  
  //left leg
  rect(1*ps,12*ps,ps,ps); 
  rect(0*ps,12*ps,ps,ps); 
  rect(0*ps,13*ps,ps,ps); 
  rect(0*ps,14*ps,ps,ps); 
  rect(0*ps,15*ps,ps,ps); 
  
  //right leg
  rect(4*ps,13*ps,ps,ps); 
  rect(4*ps,14*ps,ps,ps); 
  rect(4*ps,15*ps,ps,ps); 
  rect(5*ps,15*ps,ps,ps); 
  rect(6*ps,15*ps,ps,ps); 
  rect(7*ps,15*ps,ps,ps); 
  
  fill(Shoes);
  rect(0*ps,15*ps,ps,ps);
  rect(-1*ps,15*ps,ps,ps);
  rect(7*ps,15*ps,ps,ps);
  
  
  fill(Watch);
  rect(0*ps,2*ps,ps,ps); 
  popMatrix();
}


void switchToDark() {
  //println("dark");
}


void switchToLight() {
  //println("light");
}

void teleportAnimation(String mode, float X, float Y, int Color) {
  //draw a rect that's rotated on its side
  //have another function that's called every frame, if a teleport animation is ongoing (determined by a number of
  //frames that's winding down), the squares expand outward (there's an array with a number of timers that wind down,
  //these determine when the square starts moving (it disappears after another set amount of frames))
  //maybe easier as an object? so you generate a new iteration of that object, and have it play, you could have
  //more variables in it 
  
  //if you're just using one square (no additional class), then maybe append them to an array and remove them when their
  //value reaches 0?
  //their size is linked to the amount of time left
  
  teleportTimeArray = append(teleportTimeArray, 0);
  teleportXArray = append(teleportXArray, X);
  teleportYArray = append(teleportYArray, Y);
  teleportColorArray = append(teleportColorArray, Color);
  
  
  if(mode == "In") {//for now don't worry about going in and out (unless you find its easy in the refreshteleport function)
  
  }
}

void refreshTeleportTimer() {
  int numOfBoxes = 5;
  int maxBoxSize = 100;
  int maxTime = 10;
  for(int i = 0; i < teleportTimeArray.length; i++) {
    teleportTimeArray[i] += 1;
    if(teleportTimeArray[i] < maxTime) {
      if (teleportColorArray[i] == 0) {
        stroke(teleportBoxColor);
      }
      else if (teleportColorArray[i] == 1) {
        stroke(teleportAppearColor);
      }
      fill(0,0,0,0);
      //you CAN draw multiple rects this way
      //put constraints so that at first only the largest one draws, and at the end only the smallest one draws
      pushMatrix();
      translate(teleportXArray[i], teleportYArray[i]);
      rotate(radians(45));
      rectMode(CENTER);
      for(int j = 0; j < numOfBoxes; j++) {
        int intervalSize = maxBoxSize/maxTime;
        float boxSize = teleportTimeArray[i]*maxBoxSize/maxTime - j*intervalSize;
        if(boxSize > 0 && boxSize < maxBoxSize) {
          rotate(radians(random(-30,30)));
          rect(0,0,boxSize,boxSize); 
        }
      }
      popMatrix();
    }
    else {
      
    }
  }
  
}


void generateDead(float X, float Y) {
  darkFigXArray = append(darkFigXArray, X);
  darkFigYArray = append(darkFigYArray, Y);
}


void mousePressed() {
  if(lightBoolean) {
    //teleport animation (a one going in for the origin, and one going out for the new location
    teleportAnimation("In", mouseLastX, mouseLastY, 0);
    teleportAnimation("Out", mouseX, mouseY, 1);
    //generate dead
    generateDead(mouseLastX, mouseLastY);
    
    mouseLastX = mouseX;
    mouseLastY = mouseY; 
  }
}

void keyPressed() {
  if(keyCode == UP) {
    ps += psChange;
  }
  if(keyCode == DOWN) {
    if(ps > psChange) {
      ps -= psChange;
    }
  }
  if (key == ' ') {
    //change to dark world 
    if(lightBoolean) {
      switchToDark();
      lightBoolean = false;
    }
    else {
      switchToLight();
      lightBoolean = true;
    }
  }
  
  if (key == 'r') {
    restartGame();
  }
  
}

/*

clothes color changes each time, maybe have an array? maybe just one array for
both jackets and pants, they draw randomly from the array 


This is Orpheus. He is wearing a blue teleportation watch. He can LEFT-CLICK to teleport. But
this is not a teleportation watch. Each time he LEFT-CLICKs, he dies and is born again. Press 
SPACE to view his dead selves. 

you are wearing a teleportation watch. left-click to teleport. but this is not a
teleportation watch. each time you click, you are instead reborn. press space to 

this is further evidenced by the fact that you can grow or shrink the size of your
next iteration with the UP and DOWN arrows. 

an alternate version where your ghosts lose pixels, or you lose pixels each time, you
disintegrate more, how about whenever a body part is no longer connected to your body
it falls off completely 

so whenever you draw the figure, add an element to an array for the ghosts in his
previous location 
-have them rotate randomly within a small quarter circle 

the watch color is red in the underworld 

how can you make them transparent? use lower opacity fills for the color variables 

*/
public class Teleport {
  
  int numOfSquares = 5; 
  int countdownInterval = 2;
  int[] countdownArray = new int[0];
  
  Teleport() {
    for(int i = 0; i < numOfSquares; i ++) {
      countdownArray = append(countdownArray, countdownInterval*i);
    }
  }
  
}


