
float x;
float y;

void setup(){
  size(600,400);
  frameRate (30);
  background(0);
}

void draw(){
  x = random (800);
  y = random (800);

  
  noStroke();
  fill(random(255),random(255),random(255),random(255));
rect(x,y,2,2,2);
}

//event
void mousePressed(){
   background(255);
 
}

void keyPressed(){
   background(0);
  
}


