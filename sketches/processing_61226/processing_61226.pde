
void setup(){
size(300,300);
smooth();
}

void draw(){
  background(255);
  
  
for(int i = 50; i < 260; i = i + 25){
for(int j = 50; j < 260; j = j +25){
  
  fill(255);
  stroke(0);
  
 ellipse(i, j, 7, 7);
}
}
}
