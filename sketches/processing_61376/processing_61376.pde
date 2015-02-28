
void setup(){
size(400,400);
noCursor();
}

void draw(){
  noStroke();
  fill(0, 20);
  rect(0,0,width, height);
  
 float d1 = random (255);
  float d2 = random (255);
  fill(200,20);
for (int i = 0; i < width; i = i+10){
  for (int j = 0; j < height; j = j+10){
  rect(i, j, mouseX, mouseY);
}
}
}
