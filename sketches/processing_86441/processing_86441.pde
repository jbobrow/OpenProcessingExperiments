
float  x = 50;
float y = 50;

void setup(){
 size(600,600); 
 background(255);
 rectMode(CENTER);
}

void draw(){
  int seconds = millis()/300;
  x = random(100,500);
  y = random(100,500);
  rotate(seconds+radians(30));
  fill(random(10,255),random(0,50));
  strokeWeight(random(0,1));
  rect(x,y,random(50),random(50));
}



