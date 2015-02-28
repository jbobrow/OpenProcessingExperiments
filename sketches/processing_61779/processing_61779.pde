
void setup(){
size(300,300);
smooth();
}

void draw(){
  background(200);

for (int i = 0; i < width+10; i = i+18){
  for (int j = 0; j < height+10; j = j+18){
    if(mousePressed) {
    noFill();
  ellipse(i, j, 30,30);
}
  else{
   noFill();
   ellipse(random (300), random (300), 30, 30);
}
}
}
}

