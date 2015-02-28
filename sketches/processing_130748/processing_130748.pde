
float temp = 0;
int ypos = 0;

void setup(){
frameRate(1500);
size(800,800);
}

void draw(){
  background(#262F48);
  
  for (int x = 0; x <= width; x = x +2){
    temp = int(random(800));
    cubes_from_space(x, temp);
  }
  
}

void cubes_from_space(int xpos, float ysize){
  strokeWeight(1);
  stroke(255);
  line(xpos, 700, 300, ysize);
}


