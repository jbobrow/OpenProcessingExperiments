
void setup() {  //setup function called initially, only once
  size(400, 400);
  frameRate(30);
  textAlign(LEFT,CENTER);
  textSize(32);
}

void draw() {  //draw function loops 
  background(0);  //set background black
  
  // frameCount
  text("frameCount: " + frameCount , 30 , height*0.16666 );
  
  // int(frameCount / width)
  text("frameCount / width: " + int(frameCount / width) , 30 , height*0.3333 );
  
  int modulo = frameCount % width;
  
  // frameCount % width
  text("frameCount % width: " + modulo , 30 , height*0.5 );
  
  ellipse(modulo, height*0.75, 50,50);
  
}
