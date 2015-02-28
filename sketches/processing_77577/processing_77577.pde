
//learned sin wave from example 13-7 in Learning Processing book
//angle starts at 0.0

float theta=0.0;

void setup(){
  size(500,500);
  smooth();
}

void draw(){
 background(0);
//angle increments 
  theta+=0.02;
  noStroke();
  fill(0,120,0,120);// green tails outside of for loop
  float x= theta;
//wave of rect with y value determined by cos
  
  for (int i=0; i<=500; i+=2){
    
    float y=cos(x)*height/5;
  
  rect(i*10,y+width, 25,25);
  rect(i*5,y+width/2, 20,20);
  fill(0,0,120,120);
  rect(i*2.5, y+width/4,15,15);
  fill(120,0,0,120);
  rect(i*1.25, y+width/8,10,10);
  
  //moves along x-axis
  x+=0.2;

  }
}

