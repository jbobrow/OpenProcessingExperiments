
//Devon Nitz
//Creative Code, Object assigment
   
   
/////////////////////////
//Variables/Array Start//
/////////////////////////
 

int t;
int interval = 120;
Ghost[] ghosts= new Ghost[250];
//start Mystart;
int totalGhosts=0;
int score = 0;
int play = 0;
int time;
boolean starter; 
PImage img;
PImage imgone;
PImage imgtwo;
PImage hand;
//PImage imgtwo;
//////////////
//Void Setup//
//////////////
  
void setup() {
 frameRate(20);
 size (700, 700);
 smooth();
 starter=true;
 
 img=loadImage("SplashScreen.jpg");
 
 imgone=loadImage("GameOver.jpg"); 
 
 imgtwo=loadImage("Game-Backdrop.jpg");
 
 hand=loadImage("hand.tif");


 }
 /////////////
//Void Draw//
/////////////
  
void draw() {

   /////////////////////
  //TIMER AND SCORE ///
  ////////////////////
  
//hand.setLocation(mouseX,mouseY);
//hand.display();
  
image(imgtwo,0,0,700,700);
  noStroke();
  fill(150);
  ellipse(mouseX,mouseY,30,30);

  t = interval-int(millis()/500);
 time = nf(t,2);
textFont("Arial",14);
  fill(20);
  text("Timer: "+time,20,70);
  text("Score: "+score,20,50);
  
  ghosts[totalGhosts]= new Ghost(random(width), 750);
  if (frameCount % (10) == 0) {        // every second add one to the ghosts
    totalGhosts++;
  }
  
  if (totalGhosts>=ghosts.length) {
    totalGhosts=0;  
  }
    for (int i=0; i<totalGhosts; i++) {
      if (ghosts[i].flattenIt) {
      ghosts[i].splat();
      } else {
      ghosts[i].fly();
      ghosts[i].display();
    }   }
         if(t <= 0){
        gameOver();
        t.stop();  }

   if(starter){
     instructions();
   }
}
/*
class hand {
int r;// radius
int x;
int y;

hand(int tempR) {
r=tempR;
x=0;
y=0;
}

void setLocation(int tempX, int tempY) {
    x= tempX;
    y= tempY;
  }
   
  void display(){
    image(hand,mouseX,mouseY);
    noFill();
    noStroke();
    ellipse(x+r*1.7,y+r*1.5,r*4.5,r*4.5); // x and y (which is now mouseX and mouseY) diamter and diamter
  }



}
   */
   
   
   
   
////////////////////////////////////
//////Mouse Pressed 'Disapear'//////
////////////////////////////////////
 
void mouseClicked() {
  starter=false;
  for (int i=0; i<totalGhosts; i++) {
    if (ghosts[i].kill()) {
      ghosts[i].flattenIt=true; score++;
    }  }  }

///////////////////////////
//// Game Over Screen/////
/////////////////////////
void gameOver() {
        image(imgone,0,0,700,700);
        fill(0);
        stroke(0);
        text("Score: "+score,320,410); 
        t==0; 
        if(mousePressed) {
        instructions(); 
        interval= 120;
        }
 
}
 

 ///////////////////////////
//// Splash Screen   //////
////////////////////////
void instructions(){
  t==101; 
image(img,0,0,700,700); 
//   fill(50);
 //  text("Instructions",250,200);
//   text("Kill the bugs within 100 seconds!",180,250);
}
 
 
 ///////////
//Ghost////
/////////
  
class Ghost {
  int cx;
  int cy;
  float speed;
  float critterSize;
  float critterRotate;
  float span;
  int opacity;
  float r=254;
  float b=184;
  float greenBegin = 254;
  float greenEnd = 184; 
  float greenDiff;
  float greenTrue; 
  boolean up;
  boolean blink;
  boolean flashing;
  boolean flattenIt;
  
  Ghost(int centerX, int centerY) {
    cx=centerX;
    cy=centerY;
    speed=random(2, 15);
    span= random(40,90);
    critterSize=random(0.20, .90);
    greenDiff = random(greenEnd,greenBegin);
    greenTrue = greenDiff;
    opacity=60;
    flattenIt=false;
    flashing=true;
    blink=true;
    up=true;
  }
  
  
  
  void display() {
    pushMatrix();
   /* scales entire creature*/
    translate(cx, cy);
    scale(critterSize);
    translate(-cx, -cy);
  
  /*shadow of body*/
  noStroke();
fill(200,200,200,40);
ellipse(cx,cy,120,190);
 
  /*body wings*/
stroke(161,222,239);
fill(213,240,248);
ellipse(cx,cy,200,span);
 
stroke(161,222,239,120);
noFill();
ellipse(cx,cy,200,span-10);
 
/*body wings details*/
noStroke();
fill(161,222,239,160);
ellipse(cx,cy,200,span-25);
fill(213,240,248,160);
ellipse(cx,cy,200,span-65);
 
/*body white*/
stroke(220);
fill(r,greenTrue,b);
ellipse(cx,cy,110,190);
stroke(240);
fill(250,250,250,80);
ellipse(cx,cy,100,190);
fill(250,250,250,60);
ellipse(cx,cy,80,190);
fill(250,250,250,40);
ellipse(cx,cy,50,190);
fill(250,250,250,30);
ellipse(cx,cy,30,190);
fill(250,250,250,20);
ellipse(cx,cy,10,190);
 
/*Facial Features*/
noStroke();
fill(50);
ellipseMode(CENTER);
 ellipse(cx,cy+40,30,30);
 ellipse(cx,cy,10,10);
   
/*eyes*/
 ellipse(cx-23,cy-35,30,50);
 ellipse(cx+23,cy-35,30,50);
   
 //eyeballs
fill(255);
ellipse(cx-20,cy-35,10,20);
ellipse(cx+20,cy-35,10,20);
fill(252,252,252,20);
ellipse(cx-20,cy-35,25,40);
ellipse(cx+20,cy-35,25,40);
 
if(frameCount % 20 == 0){
 // g=random(180,200);
span=random(20,100);
    }
 
    popMatrix();
  } 
  
 /*ACTIONS go here, flyment, splat, etc.*/
  
  
  
  void fly() {
    if (cy>-200) {
      cy=cy-speed;
    }
    else {
      cy=height;
    }
  
  }
 
  void splat() {
    noFill();
 noStroke();
  }
  
  boolean kill() {
    float distance=dist(mouseX, mouseY, cx, cy);
    if (distance<60) {
      return true;
    }
    else {
      return false;
    }
  }
  


 
  
  
  
}






