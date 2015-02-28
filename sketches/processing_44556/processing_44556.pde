
PImage myImage;

void setup(){
  myImage=loadImage("cooking.jpg");
  image(myImage,0,0);//starting position
  size(800,600,P2D);//size of document
 noStroke();
}


void draw(){
  if (keyPressed==true){//if key is pressed along with mouse drag then filters will begin
fill((255+sin(float(millis())/2700))*20);
ellipse(mouseX,mouseY,50,50);
filter(DILATE/2);filter(BLUR, 0.572); //blending and blur speed
  }
}

  void mouseReleased() {//when mouse is clicked=restart
  image(myImage,0,0);//background image will appear in restarrt
}




