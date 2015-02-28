
/*
Grass growing further and closer, 
with the opacity depends on the distance. 
Stella Wang, Tainan, 2013/10/30
*/
 
void setup() {
  size(900, 320);
  //noLoop();
  strokeWeight(.5);
  stroke(0, 30);
  //background(20, 50, 70);
  background(250);

}
 
void draw() {
  
  float xstep;
  float ystep;
  float border = random(width);
  float y = random(120, height);
  float lastx = border;
  float lasty = y;
//  float a = random(40, 100);
  float b = random(50, 180);
  stroke(20, b, 180-b, y*1.5-270);
  for (float x=border; y<=height + 80;
     x += xstep, y += ystep) {
      xstep = noise(30)*5 + random(3);
      ystep = noise(100)*90 + random(29);
    line(x, y, lastx, lasty);
    lastx = x;
    lasty = y;
  }
}

/*
void mousePressed(){
  saveFrame("canvas  ###.png");
}

*/


