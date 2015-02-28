
FullScreen fs; 

void setup(){
  size(400,200);
  
  // set framerate
  frameRate(15);

  fs = new FullScreen(this); 


}


void draw(){
  
 // hides cursor
  if(mousePressed == true) {
    noCursor();
  }
  
  background(0);
  
  for(int i = 0; i < 40; i++){
    fill(
      random(mouseX),
      random(mouseY),
      random(mouseX)
    );

    rect(
      i*5, i*5,
      width - i*10, height - i*10
    ); 
  }
}
