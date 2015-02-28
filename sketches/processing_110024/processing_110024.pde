
// this runs once when the program starts
void setup(){
  size(400, 400);
  background(#e5e4e2);
}

// this runs every time the operating
// system tells java to update the screen
void draw(){
 stroke(#0000a0);
  fill(255,10);
 rect(0,0,width,height);
  for(int i=0; i<1000; i++){
    point(mouseX + random(1), mouseY + random(100));
  }
  
}


