
PImage photo;
PFont f; 


void setup() {
  size (600,600);
  background (0);
  
  //printArray (PFont.list());
  f= createFont ("Frutiger-Light", 24);
  textFont (f);
  textAlign (CENTER);
  
  
  
  photo = loadImage ("food.jpg");
  
 
}
    


void draw () {

  image (photo, 10,5);
   
  fill (#FF9E00); 
  text ("What is your favorite?", 300,400);
  
  noStroke ();
  fill(#20D6F5);
  ellipse (mouseX, mouseY, 25, 25);

}
  


 




