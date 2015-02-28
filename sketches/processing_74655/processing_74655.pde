
void setup(){
  size(400, 400);
  background(250, 221, 114);
}

void draw(){
    for(int y = 0; y <= height; y = y + 20){
    for(int x = 0; x <= width; x = x + 20){
    rect(x, y, 20, 20, 10);
  }
    }
   for(int y = 0; y <= height; y = y + 20){
    for(int x = 0; x <= width; x = x + 20){
      stroke(87, 124, 64);
      noFill();
      rect(x, y, 600, 60, 10); 
  }
   }
 if(mousePressed == true){
  fill(109, 165, 15);
 }
else{
 fill(229, 217, 107); 
}
}


