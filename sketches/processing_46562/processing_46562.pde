
//Rayniel Estrella | HW #8 - Second Version
//Nick Lally | Math, Programming, and Art

float x,y, angle;

void setup(){
  background(255);
  size (600,600);
  colorMode(HSB,360,100,100,100);
  noStroke();
}

void draw(){
  fill(random(360),100,100,100);
for(int x = 0; x < width; x+=30){
  for(int y = 0; y < height; y+=30){
    float ellSize = sin(y*x+angle)*50;
    ellipse(mouseX,mouseY,ellSize,ellSize);
    rect(mouseX,mouseY,ellSize,ellSize);
  }
}

/*for(int x = 0; x < width; x+=5){
  for(int y = 0; y < height; y+=5){
    float ellSize = sin(y*x+angle)*10;
    fill(random(255));
    ellipse(x,y,ellSize,ellSize);
  }
}*/

for(int x = 0; x < width; x+=8){
  for(int y = 0; y < height; y+=8){
    float ellSize = sin(y*x+angle)*10;
    fill(0);
    ellipse(x,y,ellSize,ellSize);
  }
}
angle+=.1;
}

