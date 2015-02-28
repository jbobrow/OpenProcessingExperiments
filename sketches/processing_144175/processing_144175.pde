
//Devon Nitz
//Creative Code, Object assigment
  
  
/////////////////////////
//Variables/Array Start//
/////////////////////////

//Net net;
Timer timer;
Ghost[] ghosts= new Ghost[250];
int totalGhosts=0;
int score = 0;
int savedTime;
int TotalTime=100000;

//////////////
//Void Setup//
//////////////
 
void setup() {
 frameRate(20);
 size (700, 700);
 smooth();
 textSize(18);
 savedTime= millis();
// net = new Net();
 }
 
 
 
 /////////////
//Void Draw//
/////////////
 
void draw() {
  background(245);
  
    noStroke(); 
    fill(150);
    ellipse(mouseX,mouseY,30,30); 
   // fill(245);
  //  stroke(0);
  //  rect(40,20,50,30);
  
   /////////////////////
  //TIMER AND SCORE ///
  ////////////////////
  stroke(200);
  fill(200);
  text("Score:  "+score,20,40); 
  text("Timer: "+millis()/1000,20,65);
  /*
int passedTime= millis() - savedTime;
//Has 100 seconds passed? if so:
   if (passedTime > totalTime) {
    textFont(48);
    textAlign(CENTER);
    fill(0);
    text(" score:"+score,width/2,height/2);
  }*/

  

 
  ghosts[totalGhosts]= new Ghost(random(width), 750);
  if (frameCount % (10) == 0) {         // every second add one to the ghosts
    totalGhosts++;
  }
 
  if (totalGhosts>=ghosts.length) {
    totalGhosts=0;   
  }
 
    for (int i=0; i<totalGhosts; i++) {
      if (ghosts[i].flattenIt) {
      ghosts[i].splat();
      }else{
      ghosts[i].fly();
      ghosts[i].display();
    }
  }
  
// net.displayone();
  
  
}

////////////////////////////////////
//////Mouse Pressed 'Disapear'//////
////////////////////////////////////

void mouseClicked() {
  for (int i=0; i<totalGhosts; i++) {
    if (ghosts[i].kill()) {
      ghosts[i].flattenIt=true; score++; 
    }
   
  }
}


//////////////////////////
//Class Net? Not working//
//////////////////////////

/*
class Net{
 float r;  //radius
 float x;
 float y;
   
 Catcher(){
   x=MouseX;
   y=MouseY;
  r = 20;
 }
   
void displayone(){
 stroke(0);
fill(150);
ellipse(mouseX, mouseY, r, r);
} 
} */


 ////////////
//Ghost////
////////////
 
 
class Ghost {
  int cx;
  int cy;
  float speed;
  float critterSize;
  float critterRotate;
  float span;
  int opacity;
  float r=254;
  float g=252;
  float b=184;
  boolean up;
  boolean blink;
  boolean flashing;
  boolean flattenIt;
 
  Ghost(int centerX, int centerY) {
    cx=centerX;
    cy=centerY;
    speed=random(.75, 10);
    span= random(40,90);
    critterSize=random(0.20, .90);
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
fill(r,g,b);
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




