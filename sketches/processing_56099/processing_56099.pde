
//Shannon Gibbs, YSDN, 2012


                                                                         
void setup() {
  size (500, 300);
  background (255);
  smooth();
  stroke(0);
  frameRate (5);
  
}
 
void draw() {
  fill (0,255,0,50);
  
 
 ellipse(random(500), random(600), 150, 150);
 
 fill (255,0,0,50);
 ellipse(random(500), random(600), 50, 50);
 
 fill (0,0,255,50);
 ellipse(random(500), random(600), 100, 100);     
  
  }
 




