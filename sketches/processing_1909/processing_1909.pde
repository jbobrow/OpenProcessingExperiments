
//R.M. Watkins
//Learning Processing
//NMD102 

//Lesson Two Project

//Click the mouse to change the color and size of Zoog's body





void setup () {
  //Set the size of the window
  size(200,200);
 //Set  ellipses and rectangles to CENTER mode
    ellipseMode(CENTER);
    rectMode(CENTER); }
  
  void draw() {
 
    
    //Draw a fading background
    background(bgcolor);
    
    
    bgcolor = bgcolor + bginc;
    
    //Reverse color
    
    if (bgcolor < 0 || bgcolor > 255) {
      bginc = bginc * -1; }
    
    for (int x = 0; x < width; x+=20) {
  for (int y = 0; y < height; y+=20) {
    noStroke();
    fill(random(150));
    rect(x,y,15,15);
  }
    }
    
   circbg(width,5);
    boxes(0,255,125);
    circles();
     Zoog();
  }
    
    void circbg (float w, float b) {
      while (w > 0) {
        stroke(0);
        fill(w);
        ellipse(width/2,height/2,w,w);
        w = w - b;
      }
    }
 
      
    
    
   void circles() { //Circles
    smooth();
  //Purple circle
  fill(155,27,146);
  ellipse(Ford-40,Sienna-40,Elarion,Lance);
  //Red circle
  fill (162,15,15);
  ellipse(Ford-40,Sienna+40,Elarion,Lance);
  //Blue circle
    fill(50,79,191);
    ellipse(Ford,Sienna,Elarion,Lance);
  //Green circle
  fill(5,90,10);
  //Yellow circle
  fill(255,244,104);
  ellipse(Ford-20,Sienna-20,Elarion,Lance);
  //Black circle
  fill(0);
  ellipse(Ford-20,Sienna+20,Elarion,Lance);
  //White circle
  stroke(0);
  fill(255);
  ellipse(Ford+20,Sienna-20,Elarion,Lance);
  //Teal circle
  fill(13,250,244);
  ellipse(Ford+20,Sienna+20,Elarion,Lance);
  //Purple circle
  fill(155,27,146);
  ellipse(Ford-80,Sienna-80,Elarion,Lance);
  //Red circle
  fill (162,15,15);
  ellipse(Ford-80,Sienna+80,Elarion,Lance);
  //Blue circle
    fill(50,79,191);
    ellipse(Ford+40,Sienna+40,Elarion,Lance);
  //Green circle
  fill(5,90,10);
  //Yellow circle
  fill(255,244,104);
  ellipse(Ford-60,Sienna-60,Elarion,Lance);
  //Black circle
  fill(0);
  ellipse(Ford-60,Sienna+60,Elarion,Lance);
  //White circle
  stroke(0);
  fill(255);
  ellipse(Ford+60,Sienna-60,Elarion,Lance);
  //Teal circle
  fill(13,250,244);
  ellipse(Ford+60,Sienna+60,Elarion,Lance);
    //Purple circle
  fill(155,27,146);
  ellipse(Ford-40,Sienna-40,Elarion,Lance);
  //Red circle
  fill (162,15,15);
  ellipse(Ford-40,Sienna+40,Elarion,Lance);
  //Blue circle
    fill(50,79,191);
    ellipse(Ford,Sienna,Elarion,Lance);
  //Green circle
  fill(5,90,10);
  //Yellow circle
  fill(255,244,104);
  ellipse(Ford-20,Sienna-20,Elarion,Lance);
  //Black circle
  fill(0);
  ellipse(Ford-20,Sienna+20,Elarion,Lance);
  //White circle
  stroke(0);
  fill(255);
  ellipse(Ford+20,Sienna-20,Elarion,Lance);
  //Teal circle
  fill(13,250,244);
  ellipse(Ford+20,Sienna+20,Elarion,Lance);
  

  //Random codes for circles
  Elarion = random(-20,20);
  Lance = random(-20,20);
  ellipse(Ford-80,Sienna,Elarion,Lance);

  }
  
  void boxes(float BB, float WB, float GB) {
  
  //Boxes
  
  //Black box
  fill(BB);
  rect(Ford-40,Sienna,Kerri,Kerri);
  //White box inside black box
  fill(WB);
  rect(Ford-40,Sienna,Dahlia,Dahlia);
   //Grey box inside black box
  fill(GB);
  rect(Ford-40,Sienna,Strith,Strith); 
 //Random codes for squares
Kerri= random(-20,20);
Strith=random(-10,10);
Dahlia= random(-5,5);

//All random
Ford=random (0,220);
Sienna=random (0,220);

Kerri=Kerri+0.05;
Dahlia=Dahlia+0.05;
Elarion=Elarion+0.2;
Lance=Lance+0.2;
Strith=Strith+0.1;

//Speed and location

  x = x + xspeed;
  y = y + yspeed;
  
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  } 
  
  
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1; 
  }
  
  }
  
  
  void Zoog() {

 //Zoog's body
  stroke(0);
  fill(Body);
  rect(x,y,Nolan,Watkins);
  Nolan = 40;
  Watkins = 100;

  //Zoog's head
  stroke(0);
  fill(x,150,y);
  ellipse(x,y-30,60,60);
  
  //Zoog's eyes
  fill(x,50,y);
  ellipse(x-19,y-30,16,32);
  ellipse(x+19,y-30,16,32);
  
  //Zoog's eyebrows
  line(x,y-40,x-30,y-50);
  line(x+8,y-50,x+40,y-50);
 
  //Zoog's legs
  stroke(0);
  fill(255);
  line(x-10,y+50,x-10,y+80);
  line(x+10,y+50,x+10,y+80);
  
  }
  


  void mousePressed() {
    Nolan=random(0,255);
    Watkins=random(0,255);
   Body=random(0,150);
    println("Disco Zoog!");
    
    
  }
  
 
  //black box width and height
float Kerri;

//white box width and height
float Dahlia;

//circle width
float Elarion;

//circle height
float Lance;

//grey box width and height
float Strith;

//x location
float Ford;

//y location
float Sienna;


float Dome; 

//Zoog's body color
float Body;
//Zoog Body width
float Nolan;

//Zoog Body height
float Watkins;

float x = 100;
float y = 100;
float xspeed = 2;
float yspeed = 1;
float bgcolor = 0;
float bginc = 1;



