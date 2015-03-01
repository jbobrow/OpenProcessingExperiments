
void setup(){
  size(200, 200);
  background(0, 0, 0);
  fill(0, 0, 0);
  textFont(createFont("SanSerif", 18));
  textAlign(CENTER);
}

void draw(){
  for (int i = 0; i < height; i+=5){
    for (int j = 0; j < width; j+=5){
      stroke(random(150, 255), random(150, 255), random(150, 255));
      line(0, 0, i, j);
      line(width, height, i, j);
      line(0, height, i, j);
      line(width, 0, i, j);
    }
  }
  text("Hello World!", width/2, height/2);
}


