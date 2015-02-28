
/* LOGO - Target
AundieMegan Soriano
2nd period
*/
 void setup(){
   size(400,400);
   background(255); // white
 }

void draw (){
  noStroke();
  ellipseMode(RADIUS);  
  fill(203,12,12); // red
  ellipse(200,200,75,75);  
  ellipseMode(CENTER);  
  fill(255);  //white
  ellipse(200,200,100,100);  
  
    ellipseMode(CENTER);  
    fill(203,12,12);
    ellipse(200,200,50,50);  
}
