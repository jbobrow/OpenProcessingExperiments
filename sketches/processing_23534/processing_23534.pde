
void setup(){
size(500,200);
background(0);
frameRate(30);
}

void draw(){
for(int x = 0; x < width; x+=2){
  for(int y = 0; y < height; y +=2){
    noStroke();
    fill (random(255));
    rect(x,y,5,5);
  }
}
}

