
Jack jack;
Jill jill;
Mountain mountain;
Rope rope;
Timer timer;
TimeBar timeBar;
VictoryBucket victoryBucket;
Bucket[] bucket= new Bucket[3];
int totalCubes = 100;
int last;
int timePassed;
Ice[] iceCube= new Ice[totalCubes];
PImage startImage;
boolean start;

void setup() {
  size(900, 600);
  smooth();
  startImage = loadImage("startScreen.png");
  mountain= new Mountain();
  bucket[0]= new Bucket(width/10);
  bucket[1]= new Bucket(width/2.5);
  bucket[2]= new Bucket((width/10)*9);

  for (int i=0; i< totalCubes; i++) {
    iceCube[i]= new Ice();
  }
  jack = new Jack(15, 7); 
  jill= new Jill(15, 10);
  rope= new Rope(2);
  timer= new Timer(15000);
  timer.start();
  victoryBucket= new VictoryBucket();
  timeBar= new TimeBar();
  start= false;
  timePassed =0;
  last =0;
}

void draw() {
  //blueSky
  background(197, 240, 250);
 timePassed= millis()-last;
  //startScreen
  if (start == false) {
    fill(197, 240, 250); 
    noStroke();
    rect(0, 0, width, height);
    textSize(40);
    textAlign (CENTER);

    if (mouseX > (((width/2)+300)-50) && mouseX < (((width/2)+300)+50) && mouseY > (550-20) && mouseY < (550+20)) {
      fill(255, 31, 31);
      text("start", (width/2)+300, 550);
      if(mousePressed){
       start = true; 
      }
      
    } else {
      fill(0);
      text("start", (width/2)+300, 550);
    }
    image(startImage, 0, 0);
    resetProgram();
  }
  
  if (start == true) {
    timeBar.make (timePassed/500, timePassed/225);

    //grabbing buckets
    if ( bucket[0].captured()) {
      println("you got bucket1!");
      bucket[0].y= height/12;
      bucket[0].x= width/25;
    }
    if ( bucket[1].captured()) {
      println("you got bucket2!");
      bucket[1].y= height/12;
      bucket[1].x= (width/25)*2.2;
    }
    if ( bucket[2].captured()) {
      println("you got bucket3!");
      bucket[2].y= height/12;
      bucket[2].x= (width/25)*3.4;
    }

    mountain.placeMountain();
    victoryBucket.make(width/2, height/6);
    bucket[0].make();
    bucket[1].make();
    bucket[2].make();

    for (int i=0; i< totalCubes; i++) {
      iceCube[i].display();
      iceCube[i].breakCubes();
    }
    jack.freezeJack();
    jack.moveJack();
    jill.constrainJill();
    jill.moveJill();
    rope.affectRope();
    rope.drawRope();
    jack.drawJack();

    jill.display();

    timeBar.expire();
    victoryBucket.victory();
    if (timer.isFinished()) {
      println("reset ice");
      timer.start();
      for (int i=0; i< totalCubes; i++) {
        iceCube[i].x= random(0+iceCube[i].w, width-iceCube[i].w);
        iceCube[i].y=random((height/6)+iceCube[i].w, ((height/40)*39)-iceCube[i].w);
        iceCube[i].w= random(15, 50);
      }
    }
  }

  

  
}
  void resetProgram() {
    last= millis();
    bucket[0].x=width/10;
    bucket[1].x=width/2.5;
    bucket[2].x=((width/10)*9);
    
    bucket[0].y =random(height/5, (height/30)*28);
    bucket[1].y =random(height/5, (height/30)*28);
    bucket[2].y =random(height/5, (height/30)*28);
    
    jack.resetVariables();
    jill.resetVariables();
  }
//things to do:
/*
make snow shrink/grow in relation to the timer
 make ice cubes fracture when jill hits them once
 make ice cubes size vary based on the sensitivity size
 */
class Bucket {
  float x;
  float y= random(height/5, (height/30)*28);
  float r=30;
  Bucket(float tempX) {
    x=tempX;
  } 

  void make() {
    rectMode(CENTER);
    noStroke();
    fill(167, 108, 73);
    rect(x, y, r, r);
    fill(100, 58, 33);
    rect(x-15, y-10, 4, 50);
    rect(x+15, y-10, 4, 50);
    fill(167, 108, 73);
    rect(x, y-34, 30, 5);
    stroke(100, 58, 33);
    strokeWeight(2);
    line(x-7, y-14, x-7, y+14);
    line(x+7, y-14, x+7, y+14);
  }

  boolean captured() {
    if (dist(x, y, jack.jX, jack.jY)< jack.r+r && dist(x, y, jill.x, jill.y)< jill.r+r ) {
      return true;
    }
    else {
      return false;
    }
  }
}

class Ice {
  float w= random(10, 60);
  float h= random(1, 15);
  float x= random(0+w, width-w);
  float y= random((height/6)+w, ((height/40)*39)-w);
  float a= random(0, 6);
  float b= random(0, 13);
  float c= random(0, 20);
  Ice() {
  }
  void breakCubes() {
    if (mousePressed && dist(mouseX, mouseY, x, y) <= w && dist(jill.x, jill.y, x, y)<= w+jill.r) {
      if (mouseEvent.getClickCount()==2) {
        x= width*2;
      }
    }
  }
  void display() {
   
   strokeWeight(3);
   stroke(255);
   fill(116, 226, 245);
  // noFill();
   //noStroke();
    rect(x, y, w, w);
  
    /*  beginShape();
    vertex(x-(10+b), y-(10+b));
    vertex(x+(10+a), y-(10+a));
    vertex(x+(10+c), y+(10+c));
    vertex(x-(10+a), y+(10+a));
    vertex(x-(10+b), y-(10+b));
     endShape();*/
  }
}

class Jack {
  float jX, jY, r, s;



  Jack(float tempR, float tempS) {
    r= tempR;
    s= tempS;
    jX= width/2;
    jY= height-r;
  } 

  void moveJack() {



    if ( keyPressed == true && key == 'a' || key == 'A') {

      jX=jX-s;
    }  
    else if (keyPressed == true && key == 'd' || key == 'D') {

      jX= jX+s;
    }
    else if (keyPressed == true && key == 'w' || key == 'W') {

      jY= jY-s;
    }
    else if (keyPressed == true && key == 's' || key == 'S') {

      jY= jY+s;
    }
    if (jX <=0+r) {
      jX= 0+r;
    }
    else if (jX >=width-r/2) {
      jX= width-r/2;
    }
    if (jY <= height/6) {
      jY= height/6;
    }   
    else if (jY >=height-(r/2)) {
      jY= height-(r);
    }

    //curbs speed if Jill is more than x points away from Jack 
    if ( dist(jX, jY, jill.x, jill.y) > 100) {
      s=0;
    }
    else {
      s=7;
    }
  }

  //if Jack touches an iceCube
  void freezeJack() {
    for (int i=0; i< totalCubes; i++) {
      if (dist(jX, jY, iceCube[i].x, iceCube[i].y)<= r+((iceCube[i].w)/2)) {
       jY=jY+100;
       }
    }
  }
  

  void drawJack() {
    ellipseMode(CENTER);
    noStroke();
    fill(225, 220, 196);
    ellipse(jX, jY, r*2, r*2);
    fill(10);
    ellipse(jX-7, jY+4, 5,5); 
    ellipse(jX+7, jY+4, 5,5);
    fill(255);
    ellipse(jX-6, jY+2, 2, 2);
    ellipse(jX+8, jY+2, 2, 2);
    fill(225, 220, 196);
    rect(jX-7, jY+7, 6, 2);
    rect(jX+7, jY+7, 6, 2);
    fill(222, 65, 65);
    ellipse(jX, jY+7,6,9);
    fill(35, 21, 12);
    ellipse(jX, jY-9, 20, 15);
    
    strokeWeight(1);
    stroke(11, 54, 13);
    fill(23, 80, 26);
    beginShape();
    vertex(jX-25, jY);
    vertex(jX, jY-25);
    vertex(jX+25, jY);
    vertex(jX-25, jY);
    endShape();
  }
  
  void resetVariables(){
   jX =width/2;
   jY= height-r; 
  }
}

class Jill {
  float r; //radius
  float s; //speed
  float x, y; //start location
  float jiX;
  float jiY; //where she goes when the mouse is clicked

  // makes Jill move towards the mouse click
  float velFriction(float origin, float dest, float coeff) {
    return (dest-origin)/coeff;
  }

  Jill(float tempR, float tempS) {
    r= tempR;
    s= tempS;
    x= (width/2)+r*2;
    y= height-r;
  }



  void moveJill() {
    jiX= mouseX;
    jiY= mouseY;

    //sets velocity friction for Jill's movement
    if (mousePressed && mouseX >= 0 && mouseX <= width && mouseY >= 0 && mouseY<= height) {  
      x += velFriction(jill.x, jiX, s);
      y += velFriction(jill.y, jiY, s);
    }
  }

  //keeps Jill below Jack 
  void constrainJill() {
    if (y < jack.jY) {
      y= jack.jY;
    }
  }

  //draws Jill
  void display() {
    fill(216, 44, 44);
    strokeWeight(1);
    stroke(137, 8, 8);
    beginShape();
    vertex(x-25, y);
    vertex(x, y-25);
    vertex(x+25, y);
    vertex(x-25, y);
    endShape();
    ellipseMode(CENTER);
    noStroke();
    fill(225, 220, 196);
    ellipse(x, y, r*2, r*2);
    fill(10);
    ellipse(x-7, y+4, 5,5); 
    ellipse(x+7, y+4, 5,5);
    fill(255);
    ellipse(x-6, y+2, 2, 2);
    ellipse(x+8, y+2, 2, 2);
    fill(225, 220, 196);
    rect(x-7, y+7, 6, 2);
    rect(x+7, y+7, 6, 2);
    fill(255, 95, 138);
    ellipse(x-9, y+8, 5, 2);
    ellipse(x+9, y+8, 5, 2);
    fill(35, 21, 12);
    ellipse(x, y-9, 20, 15);

  }
  void resetVariables(){
     jiX= (width/2)+r*2;
    jiY= height-r;
  }
}

class Mountain {

  Mountain() {
  }

  void placeMountain() {

    noStroke();
    fill(64, 51, 38);
    beginShape();
    vertex(0, height/4);
    vertex(0, height);
    vertex(width, height);
    vertex(width, height/4);
    vertex(width/2, height/6);
    vertex( 0, height/4);
    endShape();
    
  fill(240);
  strokeWeight(2);
  stroke(255);
  beginShape();
  vertex(width/2, height/6);
  vertex((3*width/5), height/5.5);
  vertex(width/2, height/4.5);
  vertex(2*(width/5), height/5.5);
   vertex(width/2, height/6);
  
  endShape();
    
  }
}

class Rope {
  float s;
  float r, g, b;
  Rope(float tempS) {
    s= tempS;
  } 


  void affectRope() {
    if ( dist(jack.jX, jack.jY, jill.x, jill.y) > 100) {
      r= 107;
      g= 225;
      b=247;
    }
    else {
      r= 209;
      g=9;
      b=2;
    }
  } 

  void drawRope() {
    stroke(r, g, b);
    strokeWeight(s);
    line(jack.jX, jack.jY, jill.x, jill.y);
  }
}

class Timer {
  int savedTime;//when did it start?
  int totalTime;//how long should it go?

  Timer(int tempTotalTime) {
    totalTime= tempTotalTime;
  }  

  void start() {
    savedTime= millis();
  }

  boolean isFinished() {
    int passedTime= millis()-savedTime;
    if (passedTime > totalTime) {
      return true;
    }
    else {
      return false;
    }
  }
}

class VictoryBucket {
  float x, y;
  float r=30;
  boolean winScreen;
  VictoryBucket() {
    winScreen= false;
  } 
  //width/2 height/6
  void make(float tempX, float tempY) {
    x= tempX;
    y=tempY;
    rectMode(CENTER);
    ellipseMode(CENTER);
    stroke(54, 44, 10);
    line (x-10, y-10, x-10, y-45);
    line (x+8, y-10, x+8, y-45);
    noStroke();
    fill(188, 172, 139);//centerbox
    rect(x, y, r, r);
    strokeWeight(1);
    stroke(113, 95, 35);
    line(x-15, y-5, x+15, y-5);
    line(x-15, y+5, x+15, y+5);
    line(x-10, y-5, x-10, y+5);
    line(x+6, y-5, x+6, y+5);
    line(x+2, y+5, x+2, y+15);
    noStroke();
    fill(74, 166, 245);
    ellipse(x, y-10, (r/4)*3, r/4);
    fill(113, 95, 35);
    rect(x-15, y-10, 5, 50);
    rect(x+15, y-10, 5, 50);
    beginShape();
    vertex(x, y-35);
    vertex(x-30, y-35);
    vertex(x-10, y-50);
    vertex(x+10, y-50);
    vertex(x+30, y-35);
    vertex(x, y-35);
    endShape();
    stroke(54, 44, 10);
    line (x-16, y-45, x+16, y-45);
    line(x-12, y-45, x-15, y-36);
    line(x, y-45, x, y-36);
    line(x+12, y-45, x+15, y-36);
    line(x-5, y-50, x-8, y-45);
    line(x+5, y-50, x+8, y-45);
  }  

  void victory() {
    for (int i=1; i< 3; i++) {
      if (dist(jack.jX, jack.jY, x, y) < jack.r+r/2 && dist(jill.x, jill.y, x, y) < jill.r+r/2 && bucket[0].y== height/12 && bucket[1].y== height/12 &&  bucket[2].y== height/12) {
        println("you win!");
        rectMode(CENTER);
        noStroke();
        fill(255, 210, 26);
        rect(width/2, height/2, width, height);

        textSize(50);
        textAlign (CENTER);
        fill(255, 31, 31);
        text("You got all the buckets in time!", width/2, 145); 
        winScreen= true;
      }
    }

    if (winScreen==true) {
      fill(255, 31, 31);
      textSize(30);
      text("Restart?", width/2, height/2+275);
      jill.jiX=x;
      jill.jiY=y;
      jack.jX=x;
      jack.jY=y;
      if (mouseX > ((width/2)-50) && mouseX < ((width/2)+50) && mouseY > ((height/2+275)-20) && mouseY < ((height/2+275)+20)) {

        if (mousePressed) {
          //RESETS THE GAME
          winScreen=false;
          start= false;

          resetProgram();
        }
      } 
      else {
        fill(255);
        textSize(30);
        text("Restart?", width/2, height/2+275);
      }
    }
  }
}

class TimeBar{
  float l;
  float darkValue;
  
  TimeBar(){
    
  }
  //The sun keeps track of how long is left
  void make(float tempL, float tempDark){
    l= tempL;
    darkValue= tempDark;
    
    //fade out the sky
    rectMode(CENTER);
    noStroke();
    fill(0, darkValue);
    
    //shrink the sun
    rect(width/2,0, width, height);
    stroke(255, 246, 167);
    fill(255, 234, 36);
    ellipse(width/2, height/6, 120-l, 120-l);
  }
  
  void expire(){
    if (l > 120){ 
      l= 120;
      rectMode(CENTER);
      fill(0);
      rect(width/2, height/2, width, height);
      fill(255);
      ellipse(width/2, height/2, 250, 250);
      rect(width/2, height/2+100, 100, 100);
      fill(0);
      ellipse(width/2-75, height/2+50, 50, 50);
      ellipse(width/2+75, height/2+50, 50, 50);
      rect(width/2, height/2+125, 100, 5);
      rect(width/2-25, height/2+125, 5, 25);
      rect(width/2, height/2+125, 5, 25);
      rect(width/2+25, height/2+125, 5, 25);
      
      
    textSize(50);
    textAlign (CENTER);
    fill(255, 31, 31);
    text("Night has fallen", width/2, 145); 
    text("Jack and Jill failed", width/2, height/2+225); 
   
    if (mouseX > ((width/2)-50) && mouseX < ((width/2)+50) && mouseY > ((height/2+275)-20) && mouseY < ((height/2+275)+20)) {
    fill(255, 31, 31);
    textSize(30);
    text("Restart?", width/2, height/2+275); 
    if(mousePressed) {
   //RESETS THE GAME
       start= false;
    }
    
    } else {
       fill(255);
    textSize(30);
    text("Restart?", width/2, height/2+275); 
    }
      
    }  
  }
  
  
}


