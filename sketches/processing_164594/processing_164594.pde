
PImage myImage;
PImage Image2;
PFont myFont;
 
void setup() {
  myImage=loadImage("mirror.jpg");
  Image2=loadImage("silhouette.png");
  myFont=loadFont("Arial-Black-150.vlw");
   
  size(800,800);
}
void draw(){
  image(myImage, 0, 0);
  textFont(myFont);
  fill(0);
  textSize(40);
  text("INTROSPECTION", 240, 50);

   
  if (mousePressed == true) {
    image(Image2,270,200);

}
 
}


