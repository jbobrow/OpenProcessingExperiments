
void setup(){
  size(600,600);
  background(255,0,0);
}
void draw(){
  stroke(255);
  strokeWeight(5);
    if (mousePressed) {
      stroke(232,0,15,80); // changes lines to fading red
      background(20, 196, 33);
        } else {
          background(255,204,0);
        }
          {
  fill (220, 218, 226);          
  ellipse(56,46,50,50);
  fill(110,109,113);
  ellipse(120, 120, 100, 100);
  fill(65,63,70);
  ellipse(240, 240, 200, 200);
  fill(31,30,31);
  ellipse(480, 480, 400, 400);
  fill(12, 13, 12);
  for (int i = 0; i < width; i += 50) {
  for (int j = 0; j < height; j += 80) {
    line(i, j, i, height);
    line(i, j, width, j);}
  }
          }
fill(41,124,89);
triangle(100, 600, 100, 400, 300, 400);          

}



