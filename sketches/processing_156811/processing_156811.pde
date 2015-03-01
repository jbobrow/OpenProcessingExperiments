
int x = 0;
PImage f;

void setup(){
  size(800, 600);
  background(0);
  noStroke();
}



void draw(){
  if(x < 800) {
    for(int i = 0; i < 60; i++){
      fill(random(255));
      rect(x, i * 10, 10, 10);
    }
  }else{
    f = loadImage("frame.jpg");
    image(f, -10, 0);
  }
    
  x += 10;
  if(x >= 800){
    for(int i = 0; i < 60; i++){
      fill(random(255));
      rect(790, i * 10, 10, 10);
    }
    save("frame.jpg");
  }
}


