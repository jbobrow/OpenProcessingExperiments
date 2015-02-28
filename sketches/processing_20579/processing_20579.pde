
           /* Natalie Schabowicz PS1-7 */

void setup() {
  size(400,400);
  smooth();
  background(0);
}

void draw() {
  
  fill(108,255,177);
  noStroke();
  
  
  for (int x=00; x<=400; x=x+50) {
 for (int y=00; y<=400; y=y+50)

triangle(x,y,(x+50),y,(x+25),(y+50));
}
}
     
                                                
