
int startingTime;
float TextFont;
boolean reset = false;
boolean locked = false;
boolean paused = false;
boolean cOver = false;
PImage myImage;
PImage myOne;
PImage myTwo;
PImage myThree;
PImage myFour;
PImage myFive;
PImage mySix;
PImage mySeven;
PImage myEight;
PImage myNine;
PImage myTen;

PImage myStart;
PImage myWell;
PFont myFont;
boolean showItem = false;
boolean showOne, showTwo, showThree, showFour, showFive, showSix, showSeven, showEight, showNine, showTen = false;
boolean wait = false;
boolean start = false;
boolean wel = true;
boolean blinker;
int timer = -3000;

 int cX = 73;
  int cY = 154;
  float cD = 41;
  float cE = 130;
void setup() {
   size(540, 500);

  myImage=loadImage("iphone5b.png");
  myStart=loadImage("start.png");
  myWell=loadImage("well.png");
  myOne=loadImage("myOne.png");
  myTwo=loadImage("myTwo.png");
  myThree=loadImage("myThree.png");
  myFour=loadImage("myFour.png");
  myFive=loadImage("myFive.png");
  mySix=loadImage("mySix.png");
  mySeven=loadImage("mySeven.png");
  myEight=loadImage("myEight.png");
  myNine=loadImage("myNine.png");
  myTen=loadImage("myTen.png");
   PFont font= loadFont("Verdana-48.vlw");
   textFont(font);
   myFont=loadFont("Verdana-48.vlw");

   noStroke();
  smooth();
  startingTime = millis(); 
     }
      
     void draw() {
  background(100);
       textFont(myFont);
  fill(0);
  textSize(14);
  text("Call the number as fast as possible.", 250,150);

       
       
  fill(0);
  image(myImage,0,0); 
  //if(start)image(myStart,100,0);
  //if(wel)image(myWell,0,0);
  if(showOne)image(myOne,0,0); 
  if(showTwo)image(myTwo,0,0);
  if(showThree)image(myThree,0,0); 
  if(showFour)image(myFour,0,0);
  if(showFive)image(myFive,0,0); 
  if(showSix)image(mySix,0,0); 
  if(showSeven)image(mySeven,0,0); 
  if(showEight)image(myEight,0,0);
  if(showNine)image(myNine,0,0); 
  if(showTen)image(myTen,0,0);
  
   int seconds = (millis() - startingTime) / 1000;
   int minutes = seconds / 60;
   int hours = minutes/60;
   seconds-=minutes * 60;
   minutes-=hours * 60;
   String sm = nf(minutes, 2); //minutes
   String s2 = nf(seconds, 2); //seconds
   fill(255,255,255);
   //stroke(0);
   //rect(150,95,100,50);
   fill(0,0,0);
    textSize(34);
   text(( sm) + ":" + (s2),300,405);
   fill(255,255,255);
  

  // Test if the cursor is over the box 
  if (mouseX > 150 && mouseX < 250 && 
  mouseY > 150 && mouseY < 200) {
    reset = true;  
    if(!locked) { 
  } 
  } else {   
    reset = false;   
  }

 if (mouseOverCircle(cX, cY, cD)) { fill(255,150); }
  else { fill(255, 0); }
  if(wait) ellipse(cX, cY, cD, cD);
 
 if (mouseOverCircle(cX, cY, cD)) { fill(255,150); }
  else { fill(255, 0); }
  ellipse(cX, cY, cD, cD);
  
  if (mouseOverCircle(cX+55, cY, cD)) { fill(255,150); }
  else { fill(255, 0); }
  ellipse(cX+55, cY, cD, cD);
  
  if (mouseOverCircle(cX+110, cY, cD)) { fill(255,150); }
  else { fill(255, 0); }
  ellipse(cX+110, cY, cD, cD);
  
  if (mouseOverCircle(cX, cY+51, cD)) { fill(255,150); }
  else { fill(255, 0); }
  ellipse(cX, cY+51, cD, cD);
  
  if (mouseOverCircle(cX+55, cY+101, cD)) { fill(255,150); }
  else { fill(255, 0); }
  ellipse(cX+55, cY+101, cD, cD);
  
  if (mouseOverCircle(cX+111, cY+101, cD)) { fill(255,150); }
  else { fill(255, 0); }
  ellipse(cX+111, cY+101, cD, cD);
  
  if (mouseOverCircle(cX, cY+101, cD)) { fill(255,150); }
  else { fill(255, 0); }
  ellipse(cX, cY+101, cD, cD);
  
  if (mouseOverCircle(cX+55, cY+51, cD)) { fill(255,150); }
  else { fill(255, 0); }
  ellipse(cX+55, cY+51, cD, cD);
  
  if (mouseOverCircle(cX+111, cY+51, cD)) { fill(255,150); }
  else { fill(255, 0); }
  ellipse(cX+111, cY+51, cD, cD);
  
  if (mouseOverCircle(cX+55, cY+151, cD)) { fill(255,150); }
  else { fill(255, 0); }
  ellipse(cX+55, cY+151, cD, cD);
 
}
boolean mouseOverCircle(int x, int y, float diameter) {
  return (dist(mouseX, mouseY, x, y) < diameter*0.5);

}

void mousePressed() {

  /*if(mouseX > 38 && mouseX < 216 && mouseY > 90 && mouseY < 300) {
    wel = false; 
    locked = true;     
    startingTime = millis();
  }*/
 if(mouseX > 43 && mouseX < 91 && mouseY > 130 && mouseY < 175) { /*if(reset)*/
    showSeven = true; 
  }
  else if(mouseX > 107 && mouseX < 145 && mouseY > 130 && mouseY < 175) { /*if(reset)*/
    showThree = true; 
  }
  else if(mouseX > 171 && mouseX < 209 && mouseY > 130 && mouseY < 175) { /*if(reset)*/
    showOne = true; 
  }
  else if(mouseX > 43 && mouseX < 91 && mouseY > 181 && mouseY < 224) { /*if(reset)*/
    showSix = true; 
  }
  else if(mouseX > 107 && mouseX < 145 && mouseY > 181 && mouseY < 224) { /*if(reset)*/
    showEight = true; 
  }
  else if(mouseX > 171 && mouseX < 209 && mouseY > 181 && mouseY < 224) { /*if(reset)*/
    showTen = true; 
    start= false;
    paused = !paused;
    noLoop();
  }
  else if(mouseX > 43 && mouseX < 91 && mouseY > 232 && mouseY < 278) { /*if(reset)*/
    showTwo = true; 
  }
  else if(mouseX > 107 && mouseX < 145 && mouseY > 232 && mouseY < 278) { /*if(reset)*/
    showNine = true; 
  }
  else if(mouseX > 171 && mouseX < 209 && mouseY > 232 && mouseY < 278) { /*if(reset)*/
    showFour = true; 
  }
  else if(mouseX > 107 && mouseX < 145 && mouseY > 282 && mouseY < 314) { /*if(reset)*/
    showFive = true; 
  }
  else {
    locked = false;
  }
 
} 



