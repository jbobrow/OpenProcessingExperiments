
//Amy's homework #3

float myInt;   //declare variable
int postIt;
int postIt1; //declare variable
int myBl;  //declare variable
float c1;
float c2;
float c1dir = 10;
float c2dir= 15;


void setup(){
  size(800,600);
  smooth();
  myInt = 0;
  myInt=myInt+.50;
  postIt = 0;
  postIt=postIt+1;
  myBl = 50;
  myBl=myBl+10;
  
}

void draw(){
  background(158,209,postIt);
  postIt++;
  myBl++;
  myInt++;
  stroke(myInt,255,240);
  fill(postIt,postIt,58,50);
  line(postIt,0,postIt,600);
  noFill();
  fill(myBl,250,215,postIt);
  ellipse(postIt,myInt,200,myBl);
  if(myBl > 250)
  myBl = 50; 
  if(postIt > 800)
  postIt = 0;
  if(myInt > 800)
  myInt = 0;
  noFill();
  fill(114,myBl,227);
  beginShape();
  vertex(575,postIt);
  vertex(postIt,300);
  vertex(500,275);
  vertex(450,postIt);
  vertex(595,255);
  vertex(380,postIt);
  endShape();
  fill(222,213,237);
  line(myBl,85,postIt,myBl);
  noFill();
  fill(c1,0,c2,70);
  rect(0,myBl,120,200);
  rect(myBl,0,100,200);
  c1 = c1 + c1dir;
  c2 = c2 + c2dir;
  if (c1 < 0 || c1 > 800){
    c1dir *= -1;
  }
  if (c2 < 0 || c2 > 800){
    c2dir *= -1;
  rect(300,150,myBl,myBl);
  }
  
  


  
  
}


