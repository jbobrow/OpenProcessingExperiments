
float randX;
float randY;
float myCol;

void setup(){
  
  size(600,400);
  background(255,0,0);
  smooth(); 
  frameRate(12);

  

  
  
}

void draw(){
  fill(255,40);
  noStroke();
  rect(0,0,width,height);

randX=random(0,width);
randY=random(0,height);
  myCol=random(0,255);
  fill(myCol,100,100);
  triangle(randX,randY,randX+40,randY,randX+20,randY+40);
  

  
}

