
// part 4 of the HW ...

// TODO: put all your variable declarations here

float rect1x;
float rect1y;
float rect2x;
float rect2y;
float rectr;
float c;
float c2;
float c3;
float circleWidth;
int l = 10;


void setup() {

  // size() goes inside setup() here. Like this:
  size(600, 600);
  
  strokeWeight(1);
  fill(0, 0, 0);
  rect(0,0,600,600);
 
  
  strokeWeight(48);
  stroke(30, 30, 30);
  line(l,0,l,600);
  line(l+100,0,l+100,600);
  line(l+200,0,l+200,600);
  line(l+300,0,l+300,600);
  line(l+400,0,l+400,600);
  line(l+500,0,l+500,600);
  line(l+600,0,l+600,600);
  
  noStroke();
  fill(70, 70, 70);
  rect(0,490,600,300);
  
  fill(130, 130, 130);
  rect(290,146,20,110);
  rect(140,400,320,20);
  rect(205,450,200,20);
  rect(250,180,100,20);
  rect(385,346,20,174);
  rect(205,346,20,174);
  fill(255,255,255);
  rect(150,200,300,200);
  frameRate(60);
}

void draw() {

  
  rect1x = random(160, 440);
  rect1y = random(210, 390);
  rectr = random(0,20);
  rect2x = random(160, 440);
  rect2y = random(210, 390);
  c  = random(0,255);
  c2 = random(0,255);
  c3 = random(0,255);
  
  circleWidth = random(15, 100);

  // TODO: paste all your draw code here (ie, the code that uses those variables)  
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  noStroke();

  
  fill(c, c, c,c2);
  ellipse(rect1x, rect1y, rectr, rectr);

 

  fill(c3, c, c2, 250);
  ellipse(rect2x, rect2y, 5, 5);


  
  



}
