


void setup(){
  size (255,255);
}

void draw(){
  background(255);
 for(int i = 0; i<width; i+=10){
   float distance = abs(mouseX - i);
   fill(distance);
   noStroke();
   rect(i,0,10,height);
 }
}

