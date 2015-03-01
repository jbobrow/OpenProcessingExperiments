
PImage blume2;
PImage blume3;
void setup() {
  size(500,333);
  blume2=loadImage("blume2.png");
  blume3=loadImage("blume3.jpg");
}
void draw() {
  
 
 
  image(blume3,0,0);

  if (mousePressed){

 

  image(blume2,203,122);
  println(mouseX,mouseY);
 

}

}


