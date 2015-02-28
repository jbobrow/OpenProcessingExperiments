
void setup(){
size(400,400);
}

void draw(){
  
for (int i = 0; i < width; i = i+10){
  for (int j = 0; j < height; j = j+10){
  rect(i, j, 20, 20);
  ellipse(i, j, 10, 10);
  
  float d1 = random (200);
  float d2 = random (200);
  fill(d1,d2);
  ellipse(i, j, 20, 20);
}
}
}
