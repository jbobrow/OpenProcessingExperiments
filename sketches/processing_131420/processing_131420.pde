
void setup(){
  size(1000,1000);
  background(80,50,90);
  frameRate(20);
  
  
}
 
void draw(){
  rectMode(CENTER);
  translate(width/2,height/2);
  rotate(TWO_PI/random(2));
  stroke(random(150,225),random(100,150),random(100,150),30);
  fill(random(50,225),random(100,225),random(100,150),10);
  rect(0,0,random(500,900),random(700,1200),random(0,100));
  noStroke();
  fill(random(50,115),random(0,150),random(150,225),20);
  rect(0,0,random(100,300),random(500,850),random(0,100));
  stroke(random(50,115),random(0,150),random(100,225),70);
  fill(random(150,225),random(0,150),random(100,150),120);
  rect(0,0,random(0,500),random(0,500),random(50,1000));
}
