
float temp = 0;
int xpos = 0;

void setup(){
frameRate(100);
size(800,800);
}

void draw(){
  background(0);
  
  for (int x = 0; x <= height; x = x +1){
    temp = int(random(900));
    cubes_from_space(x, temp);
  }
  
}

void cubes_from_space(int ypos, float xsize){
  strokeWeight(2);
  stroke(random(155),random(120),random(140));
  line(ypos, 700, 30, xsize);
}



