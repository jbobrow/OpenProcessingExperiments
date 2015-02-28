
PFont myFont;
 
String title="Victory Ceremony";
String word="London Olympics 2012";

float r, g, b;  
float t; 
float x, y, x1, y1, x2, y2;  
 
int maxCir = 500;
int maxRec = 100;
int numCir=30;
int numRec=20;
  
  

void setup() {
  size(640, 360); 
  smooth(); 
  frameRate(5);
  myFont= loadFont("David-Bold-48.vlw");
  textFont(myFont); 
 
} 

void draw(){
  background(0,55);
  bgimg();//funtion
  fill(255);
  strokeWeight(2);
  stroke(255);
  textSize(48);
  text(title,width/2-textWidth(title)/2,(height/2)+45);//position
   line(125,228,525,228);
  fill(180);
  textSize(30);
  text(word,width/2-textWidth(title)/2-30,(height/2)+75);
 
  update1();//funtion
  update2();//funtion

  logo();//funtion
}

void update1() {
  if (numCir < maxCir) {
    numCir++;
  }
}
void update2() {
  if (numRec < maxRec) {
    numRec++;
  }
}

 
void bgimg(){ 
  for ( int i = 0; i < numRec; i++) { 
    x = random(width); 
    y = random(height);
    t = random(10,50); 
    fill(random(250),random(250),random(250),random(50));;
    rectMode(CENTER); 
    noStroke();
    rect(x, y,t,t);
  }
 
  for ( int i = 0; i < numCir; i++) {
    x = random(width); 
    y = random(height);
    x1 = random (width); 
    y1 = random (height); 
    x2 = random (width); 
    y2 = random (height); 
  //fill(255, 10);
    noStroke();
    triangle(x, y, x1, y1, x2, y2);
    fill(random(50,250),random(50,250),random(50,255),random(80));
    ellipse (x, y, t, t);
    stroke(255,30);
    strokeWeight(2);
    line( x, y, width/2, height/2); 
  }
}

// Draw Olympic logo funtion
 void logo(){
  strokeWeight(5);
  noFill();
  stroke(5, 131, 232);//blue
  ellipse((width/2)-70, (height/2)-60, 60, 60);
   stroke(0);//black
  ellipse((width/2), (height/2)-60, 60, 60);
   stroke(230,0, 0);//red
  ellipse((width/2)+70, (height/2)-60, 60, 60);
   stroke(255, 255, 0);//yellow
  ellipse((width/2)-35, (height/2)-25, 60, 60);
   stroke(0, 255, 0);//green
  ellipse((width/2)+35, (height/2)-25, 60, 60);
  }


