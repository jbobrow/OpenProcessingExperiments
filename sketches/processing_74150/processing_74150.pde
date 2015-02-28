
void setup () {
  size (400, 400, P2D);
  background (255);
  smooth (8);  
  noStroke ();
}


void draw () {
  
 



fill (0);
rect(0, mouseY -10, 565, 5);

if(mousePressed){
fill (255);  
 } else {
   fill (0);
 }
 
rect(150, 0, 100, 400);


}
