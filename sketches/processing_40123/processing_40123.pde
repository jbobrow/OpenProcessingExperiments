
//max u homework 3

void setup(){
  background(0);
  size(800,800);
  rectMode(CENTER);
  smooth();
}

void draw(){
  background(0);
  for(int i=0;i<100;i++){  
    noFill();
    stroke(255);
    pushMatrix();
    rotate(radians(i*5));
    if(i % 10 == 0){
      stroke(255,0,0);
    }
    if(i % 20 == 0){
      stroke(0,0,255);
    }
    rect(0,0,i*10,i*10); //width/2,height/2 centers anything
      float ellSize = map(mouseX,0,width,50,400);
    ellipse(width/2,height/2,ellSize*2,ellSize*4);
    popMatrix();
  } 
}

