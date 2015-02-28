
//Danielle Gorodenzik
//March 5 2013
//Going Through Dimensions


int spacing = 5;
void setup (){
  size (450,450);
  smooth();
}
void draw (){
  background (0);
 
   
   for (int x = 5; x<width; x+=10) {
     stroke(noise(frameCount*.1)*255, noise(frameCount*.12)*255, noise(frameCount*.2)*255);
     strokeWeight(1);
     line(mouseX, mouseY, x, 0);
     line(mouseX, mouseY, x, 450);
     line(mouseX, mouseY, 0, x);
     line(mouseX, mouseY, 450,x);
     
     
     
     
     
     
     
   }
}
