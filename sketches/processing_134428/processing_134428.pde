
int x=0;
int speed=8;
  
void setup(){
  size(400,400);
}
   
//Pacman
void pacMan(){
  noStroke();
  background(255);
  frameRate(5);
  fill(255,215,0);
  ellipse(x,200,57,57);
  fill(255);
  triangle(x,200,x+29,215,x+29,185);
  x=x+speed;
  if ((x<0)||(x>=400)){
    speed=speed*-1;
 }
}


void draw(){  
//Moving Ghost
  pacMan();
  noStroke();
  fill(0);
  rect(0,0,400,150);
  rect(0,250,400,400);
  fill(51,161,201);
  ellipse(x+70,200,50,50);
  rect(x+45,200,50,27);
  fill(255);
  triangle(x+50,250,x+70,250,x+60,220);
  triangle(x+70,250,x+90,250,x+80,220);
  ellipse(x+60,195,10,10);
  ellipse(x+80,195,10,10);
  fill(0);
  ellipse(x+82,195,7,7);
  ellipse(x+62,195,7,7);
}

