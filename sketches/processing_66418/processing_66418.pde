
int x;
int y;
float distance;

void setup(){
  size (800, 800);
  background (0);
  noStroke();
  

}

void draw(){
  if (mousePressed){
    fill (random(50), random(150), random(230), 80);
  }
  else{
    fill(random(230), random(150), random(50), 80);
  }
  
  
  for(int y = 0; y <= height; y += 100){
    ellipse(x++, y, 100, 100);
    frameRate(3);
  }
  
  for(int y = 0; y <= height; y += 100){
    ellipse(y, x++, 100, 100);
    frameRate(3);
  }

}
 



