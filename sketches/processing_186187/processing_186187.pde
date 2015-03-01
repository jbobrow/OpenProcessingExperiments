
/*

Week 2 Thursday Assignment

by: Jeremy Crossman

*/

int x = 0;
int y = 0;

void setup(){
 size(360,240);
 background(255,255,255);
 frameRate(60);

}

void draw(){

  rectMode(CENTER);
  background (x/1);
 
  x = mouseX;
  y = mouseY; 
  
  fill(0,255,255);//face color
  ellipse(x,y,100,100);//face
  fill(255,255,255);//eyes and mouth color
  rect(x-20,y,10,10);//eye
  rect(x+20,y,10,10);//eye
  rect(x,y+30,50,10);//mouth
  
  if (mousePressed == true) { 
      fill(255,0,0);
      ellipse(x-20,y,15,15);
      ellipse(x+20,y,15,15);
      
  }
  if (keyPressed == true){
      fill(0,0,0);
      rect(x,y+30,55,10);
  }
  

}
