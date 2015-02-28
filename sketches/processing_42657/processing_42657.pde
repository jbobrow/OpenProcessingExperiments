
PImage img;

void setup (){
  
  size (320,288);
  img= loadImage ("Super-mario-screen.jpg");
   
   
}
 
void draw (){
  
 image (img, 0,0);
 noStroke ();
copy(mouseX-10, mouseY-10, 50,50 ,10, 10, 100, 100);
   
}

