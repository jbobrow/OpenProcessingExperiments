
//Assignment #1
//Name: Janielle Vidal
//Email: jvidal@brynmawr.edu
//Date: September 6, 2010


void setup () {
   size(500,500);
   background (0);
   smooth ();
   frameRate(60);
}

void draw () {
  //Background;
  noStroke();
  fill (247,2,2);
  rect(0,0,499,166);
  fill(252,215,0);
  rect(0,166,499,166);
  fill(25,185,2);
  rect(0,332,499,166);
  
  //FACE
  stroke (0);
  strokeWeight (2);
  fill(144,71,12);
  ellipse(250,200,250,300);
  ellipseMode (CENTER);
  
  
  //HAIR
  fill(0);
  strokeWeight (50);
  ellipse(85,330,75,250);
  ellipse(410,310,75,250);
  fill(0);
  strokeWeight(70);
  curve(-500,0,260,50,430,220,100, -500);
  strokeWeight (20);
  curve(1200,0,80,300,220,60,0,1200);
  arc(245,80,100,50,0,2*PI);
  
  
  //EYEBROWS 
  noFill();
  stroke(0);
  strokeWeight(2);
  arc(175,175,60,20,PI,2*PI);
  arc(320,175,60,20,PI,2*PI);
  
  //EYES
  fill(255);
  stroke(0);
  strokeWeight(1);
  ellipse(175,200,50,35);
  ellipse(320,200,50,35);
  fill(mouseX,10,mouseY);
  ellipse(175,200,5,5);
  ellipse(320,200,5,5);
  
  //NOSE
  stroke(0);
  noFill();
  strokeWeight (2);
  arc(250,240,40,50,PI/4, PI);
  
  //MOUTH
  arc(250,300,100,20,0,PI);
  
 }

