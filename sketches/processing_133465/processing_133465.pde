
void setup(){  
  size(400, 400);
  frameRate(10);
}

void draw(){
  int position1 = (int)random(50, 350);
  int position2 = (int)random(50, 350);
  int size1     = (int)random(20, 100);
  int size2     = (int)random(20, 100);
  int x = 0;
  
  background((int)random(200, 255), (int)random(200,255), (int)random(200,255));
  
  while(x < 50) {
    noStroke();
    fill((int)random(255), (int)random(255), (int)random(255));
    ellipse(position1, position2, 50, 50);
    x++;
  }
  
  for(int i = 0; i < 10; i++){
     rect((int)random(50, 300), (int)random(50, 300), 50, 50);
  }  
}
