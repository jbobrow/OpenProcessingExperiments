
Kelsey kelsey;
int pressed = 0;

void setup() {
 size (500,500); //the size of my sketch in pixels
 smooth (); //turns on anti-aliasing for smoothing
 kelsey = new Kelsey();
}
   
void draw() {
  kelsey.display();
}

void mousePressed(){
 if (mouseX>272 && mouseX<308 && mouseY<258 && mouseY>222){
 pressed = 1;}
  else if(mouseX>170 && mouseX<230 && mouseY<230 && mouseY>170){
 pressed = 2;}
  
}



  
 

