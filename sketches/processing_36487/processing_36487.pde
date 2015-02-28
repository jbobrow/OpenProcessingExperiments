
//Assignment 3 processing functions & user imput
//Copyright Felipe Castelbalnco, September 6th, 2011

float x = 0;
color col;
float yR;

void setup()
{
  size(600, 600);
  smooth();
  randomSeed(1500);
  
 }

void draw()
{ 
  x = x +.5; //loop that increases x by 50%
  if (x >= 100) { //goes from 0 till 250
    x =0;
  }
  
  
  yR= random(300);//random variable / any avlues between 0 to 300
 
  fill(col);
  rect(mouseX,mouseY,x, x);//rect that moves around
  
   
  rotate(x);
  
  //rect 
  fill(x,x);
  noStroke();
  rect(width/2,height/2,width + .5*x,height/2);
  
   //rect 
  fill(x,x);
  noStroke();
  rect(width/2,height/2,width + .75*x,height);
  
  //rect
  fill(x,x);
  rect(width/2,0,width/2,height/2);
  
  //line Random
  stroke(col);
  line(0,yR,width,height/2);
  line(yR,0,width/2,height);
  
  line(0,yR,width,height/2);
  line(yR,0,width/2,height);
  
  fill(col,x); //ellipse that makes drawings
  ellipse(width/2, height/2,yR,yR);
  
  col = color(random(255),random(255),random(255),75); //control color
 
}

void keyPressed()
{
  background(col, x *2, x - .5*col);
}


