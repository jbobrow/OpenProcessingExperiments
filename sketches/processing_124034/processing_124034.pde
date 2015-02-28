
float r = 0;
float g = 0;
float b = 0;

void setup(){
  size (500, 500);
}

void draw(){
  if (r < 255){
    r = random(0, 255);
  }
  if (g < 255){
    g = random(0, 255);
  }
  if (b < 255){
    b = random(0, 255);
  }
  background(r, g, b);
}

void mousePressed(){
  noLoop();
  int a = int(r);
  int c = int(g);
  int d = int(b);
  println("r:" + a + ", g:" + c + ", b:" + d);
  
}

void keyPressed(){
  loop();
}




