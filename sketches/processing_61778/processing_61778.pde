
void setup(){
size(300,300);
smooth();
}

void draw(){
  background(150);

for (int i = 0; i < width+10; i = i+18){
  for (int j = 0; j < height+10; j = j+18){
    if(mousePressed) {
    fill(100);
  ellipse(i, j, 30,30);
}
  else{
    frameRate(20);
   noFill();
   ellipse(random (135,165), random (135, 165), 30, 30);
}
}
}
}

