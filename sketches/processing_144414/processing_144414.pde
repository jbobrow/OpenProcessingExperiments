
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: Park Seeun
 // ID: 201420078 parkseeun
/*
float x, y; 
int i=3; 
int startTime=3600*hour()+60*minute()+second();  


void setup() {  
  size(600, 600); 
  smooth();
  background(112,112,112); 
  //Font 
  font = createFont("AdobeHebrew-BoldItalic",80);
} 
PFont font; 
void draw() {  
 //center clock
 fill(50,50,50); 
  noStroke();   
  ellipse(x,y,370,370);
  
  stroke(60,60,60); 
  strokeWeight(1); 
  noFill(); 
  ellipse(x,y,420,420); 
 
  stroke(60,60,60); 
  strokeWeight(1); 
  noFill(); 
  ellipse(x,y,450,450); 
 
   stroke(100,100,100); 
  strokeWeight(1); 
  noFill(); 
  ellipse(x,y,460,460); 

  x=width/2; 
  y=height/2; 
  textFont(font); 
 
  //small clock
  textAlign(CENTER, CENTER); 
  fill(255); 
  text(second(), 150+(50*cos(x-PI/2)), 150+(50*sin(y-PI/2))); 
  text(minute(), 150+(70*cos(x-PI/2)), 90+(70*sin(y-PI/2))); 
  text(hour()%12, 150+(90*cos(x-PI/2)), 40+(90*sin(x-PI/2))); 

  //pont
  fill(random(250), 0, 0);
  textSize(100);
  text("the time flies", 320, 500); 



  //Second 
  strokeWeight(3); 
  stroke (random(255), 0, 0); 
  line (x, y, x+157*sin(second()*TWO_PI/60.0), y-170*cos(second()*TWO_PI/60.0));
  //Minute 
  strokeWeight(4); 
  stroke (100, 100, 100); 
  line (x, y, x+120*sin(minute()*TWO_PI/60.0+second()*TWO_PI/3600.0), y-120*cos(minute()*TWO_PI/60.0+second()*TWO_PI/3600.0)); 
  //Hour 
  strokeWeight(6); 
  stroke (30, 30, 30); 
  line (x, y, x+60*sin(hour()*TWO_PI/12.0+minute()*TWO_PI/3600.0), y-60*cos(hour()*TWO_PI/12.0+minute()*TWO_PI/3600.0)); 
  ellipseMode(CENTER); 
  println(hour()+":"+minute()+":"+second()); 
  println(sin(hour()*TWO_PI/8)); 
  println(cos(hour()*TWO_PI/8)); 
  fill(0,12); 
  stroke(255); 
  rect(0, 0, width, height); 
} 
/*
