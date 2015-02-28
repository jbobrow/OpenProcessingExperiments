
float y = 5;
float sw = 0.1;

void setup(){
  size(250, 250);
  smooth();
}

void draw(){ 
  background(30);
  strokeWeight(sw);
  noFill();
  frameRate(15);
  
  rectMode(CENTER);
 
  stroke(#033639, 150); 
  rect(125, 125, random(250), y);
  stroke(#22A99A, 150);
  rect(125, 125, random(250), y);
  stroke(#44BFAB, 150);
  rect(125, 125, random(250), y);
  stroke(255, 150); 
  rect(125, 125, random(250), y);
 
  sw+=0.25; //strokeweight increases value by 0.25
  
  if (sw > 50){
    sw = 0.25; //if strokeweight is greater than 50, it resets itself to 0.25
  }
}


