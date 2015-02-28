
float temp = 0;
int ypos = 0;

void setup(){
  frameRate(10);
size(800,800);
}

void draw(){
  background(255);
  
  for (int x = 0; x <= width; x = x+20){
    temp = int(random(1000));
  cubes_from_space(x, temp);
  }
  temp++;
}

void cubes_from_space(int xpos, float ysize){
  fill(random(10),random(240),random(230),random(180));
  strokeWeight(8);
  stroke(255);
  rect(xpos,800,105,-ysize);
  
  
}





