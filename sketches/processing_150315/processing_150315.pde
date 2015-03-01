
//My project incorporates drawing and uses processing as a tool for animation and making the viewer be able to interact with the animation and art, which I think is a very cool idea. 
//I drew all the animation but I was inspired by Natalie Freed after seeing her animation in class. Ms. Freed helped me with my code and Maddy Nakada gave me emotional support. 
boolean swimtime = false;
boolean girlboolean;
boolean laugh = false;
PImage lightocean;
PImage darkocean;
PImage happycreature;
PImage sadcreature;
PImage cryingcreature;
PImage girlcreature;
PImage solemncreature;
PImage laughingcreature; 
PImage surprisedcreature;
PImage haha;
PImage madcreature;
PImage swimmingcreature;
int numClicks=0;//keeps track of the amount of time the user has clicked the creature
int OceanX=100;
int OceanY;
float oceanY2;
int oceanY=1000;//set so the ocean is off the screen when it starts to rise
int oceanplus=50; 
float bobbyX;
float bobbyY;
float girlX;
float girlY;
float SwimmingX=0;
float SwimmingY=0;
boolean swimtime2=false;
boolean notswimtime = false; 

int redfishX;

void setup() {
  frameRate(10);//this makes my code run through slower so my creatures won't look so crazy when they are wabling
  background(230, 237, 242);
  size(700, 700);
  sadcreature=loadImage("sad.png");//These name each of the photos I have in my data folder so I can call them later in my code
  cryingcreature=loadImage("crying.png");
  girlcreature=loadImage("girl.png");
  haha=loadImage("haha.png");
  happycreature=loadImage("happy4.png");
  laughingcreature=loadImage("laughing.png");
  solemncreature=loadImage("solemn.png");
  surprisedcreature=loadImage("surprised.png");
  madcreature=loadImage("mad.png");
  darkocean=loadImage("darkocean.png");
  lightocean=loadImage("lightocean.png");
  swimmingcreature=loadImage("swimming.png");
}

void draw() {
  background(247, 250, 252);
  bobbyX =round(random(300, 305));//this rounds the random float numbers into integers that can be used to specify a point on my screen ; note that they are not converted to a int
  bobbyY =round(random(300, 302));//these make my creatures wable and look more animated because of their randomness
  girlX  =round(random(0, 5));//same thing just for the girl because she is not in a set place but rather follows the mouse
  girlY =round(random(0, 2));
  oceanY2 =round(random(0, 15));
  if (swimtime2==false) {//this makes sure that the other creature emotions do not run while my swimming creature is on the screen
    if (numClicks==0) {//makes sure certain emotions only appear when you click on a creature with a certain emotion
      image(happycreature, bobbyX, bobbyY, 100, 100);
    }
    if (numClicks==1) {
      image(madcreature, bobbyX, bobbyY, 100, 100);
    }
    if (numClicks==2) { 
      image(sadcreature, bobbyX, bobbyY, 100, 100);
    }
    if (numClicks==3) { 
      image(cryingcreature, bobbyX, bobbyY, 100, 100);
    }
    if (numClicks==4) { 
      image(solemncreature, bobbyX, bobbyY, 100, 100);
    }
    if (numClicks>7) {
      if (laugh=false) {// to make sure numClicks doesnt reset when my laughing creature is onscreen and make it disappear when I don't want it to
        numClicks=0;
      }
    }
    if(numClicks ==8){
    numClicks=0;}
    
    if (laugh==true) {//make sure that my laughing creature will only appear when someone tickles it (by dragging)
      if (numClicks>4) {//makes sure my laughing creature will only appear after the solemn creature
        image(laughingcreature, bobbyX, bobbyY, 100, 100);
        image(haha, bobbyX+70, bobbyY-30, 50, 50);
       
      }
    }
  }
println(numClicks);
  if (girlboolean==true) {
    if (key == 'g'|| key=='G') { //if the key "g" is pressed my girl creature will appear
      image(girlcreature, mouseX+girlX, mouseY+girlY, 100, 100);
    }
  }
  if(key=='e'||key=='E'){
    swimtime=false;
    swimtime2=false;
  }
  
  if (swimtime==true) {
    if (key=='o' || key=='O') {//if key "o" is pressed my ocean and swimming creature will appear
      swimtime2=true;//insures that the other creatures will go away when the water comes otherwise they might drown
      oceanY=oceanY-1;//helps affect of slowly raising the water
      oceanplus=oceanplus+1;//without these it would just stay pretty much in the same place
      float b =atan2((mouseY-SwimmingY)/2, (mouseX-SwimmingX)/2);//getting angle between mouse and swimming creature
      imageMode(CENTER);//this makes my images draw from the center as opposed to a corner

      pushMatrix();//confines rotate to swimmingcreature
      SwimmingX =(SwimmingX+(mouseX-SwimmingX)/10);//this makes the shark travel 1/10th of the X distance to the object each time the code runs through
      SwimmingY=(SwimmingY+(mouseY-SwimmingY)/30);//this makes the shark travel 1/30th of the Y distance to the object each time the code runs through
      translate(SwimmingX, SwimmingY);//this moves the origin of the rotation to the middle of the shark
      rotate(b);//rotates the shark the angle specified by atan2


      image(swimmingcreature, 0, 0, 100, 100);//draws my swimming creature
      popMatrix();
      if (oceanY-oceanplus-oceanY2>450) {//ocean will rise until this point
        tint(255, 127);//half transparency 
        image(darkocean, 300, oceanY-oceanplus-oceanY2, 800, 700);// makes it rise so it looks more animated and real
        tint(255, 255); //ensures that only the ocean is transparent
      }
      else {//doesn't let my ocean float off the screena and stops the rising
        tint(255, 127);
        image(darkocean, 300, 450-oceanY2, 800, 700);
        tint(255, 255);
      }
    }
  }
}

void mousePressed() {
  if (mouseX>bobbyX && mouseX<bobbyX+100) {//ensures that the emotion will only change if the creature itself is pressed 
    if (mouseY>bobbyY && mouseY<bobbyY+100) {
      numClicks++;
    }
  }
}
void keyPressed() {
  girlboolean=true;//
  swimtime=true;
}
void mouseDragged() {
  if (mouseX>bobbyX && mouseX<bobbyX+100) {//ensures that the laughing creature will only laugh because he has been actually tickled
    if (mouseY>bobbyY && mouseY<bobbyY+100) {

      laugh=true;
    }
  }
}

