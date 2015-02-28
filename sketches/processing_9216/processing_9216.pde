
void setup () {
  size (200,200);
}
void draw () {
  background(255);
  for (int y = 0; y<=200 ; y+=10){
    stroke(0);
    line(0, y, 200, y);
  }
}






/*This code works beautifully cant seem to get the following code for 
making a circle work!!!

void setup () {
  size (200,200);
}
void draw () {
  background(255);
  
  for (int y = 200; y<=0; y-=20) {
    stroke(0);
    fill(120);
    ellipse(y,y,20,30);
    ellipse(y,y,20,30);
  }
}

*/

