
PImage img0; PImage img1; PImage img2; 

 void setup() {
   size(597,851);
   img0 = loadImage("order.jpg");
   background(img0);
   // img variable will be this image
}
  void draw(){
   //image(img0,0,0);
    stroke (0);
    if (mousePressed)
    line (mouseX, mouseY, pmouseX, pmouseY);

 }
 
 void keyPressed()
{
  if ( key == DELETE)
  {
    //clears screen if delete is pressed
    background(img0);
  }
}


