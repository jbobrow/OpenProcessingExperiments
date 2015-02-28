
void setup(){
size(400,400);
background(0);
stroke(255);

}

void draw(){
for (int x = 0; x < width; x = x+1) {
  for (int y = 0; y < height; y = y+1) {
     stroke(sin(x/random(100))*100,y,100);
    point(x, y);
  }
}

}
