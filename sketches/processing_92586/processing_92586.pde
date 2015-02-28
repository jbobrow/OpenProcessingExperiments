
void setup() {
  size(400, 400);
  background(225, 200, 255);
  smooth();
  frameRate(5);
  
  
}

void draw() {
  int x = width/2;
  int d = height/2;
  noStroke();
  ellipse (x, d, d, d);
  fill (random (255));
  ellipse (155, 175, 20, 20);
  fill (255);
  
  if(dist(x,d, mouseX, mouseY) < d/2){
    fill (random (255));
  }else{
    fill (225, 200, 255, 100);
  }
    
    if (mousePressed){
      ellipse(x,d,d*2,d*2);

  } 
  
  
}


