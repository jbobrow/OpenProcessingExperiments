
//green,green,grass of home 20131028
/*reference:draw_lines.pdf by Nik,
http://processing.org/reference/mouseReleased_.html
*/
//by jui-chi lin

int value = 0;
void setup() {
  size(500, 500);
  //noLoop();
  frameRate(45);
  background(255);
}
void draw() {
  if (mousePressed) {
    background(value);
    stroke(250, random(189, 232), random(30, 93));
    strokeWeight(random(2, 10));
    line(width/2, height/4, width/4, height/2);
    line(width/4, height/2, width/4+50, height/2);
    line(width/4+50, height/2, width/4+50, height/2+120);
    line(width/4+50, height/2+120, width/4*3-50, height/2+120);
    line(width/4*3-50, height/2, width/4*3-50, height/2+120);
    line(width/4+width/2, height/2, width/4*3-50, height/2);
    line(width/2, height/4, width/4+width/2, height/2);
  }  else {
    stroke(255);
    strokeWeight(random(2, 10));
    line(width/2, height/4, width/4, height/2);
    line(width/4, height/2, width/4+50, height/2);
    line(width/4+50, height/2, width/4+50, height/2+120);
    line(width/4+50, height/2+120, width/4*3-50, height/2+120);
    line(width/4*3-50, height/2, width/4*3-50, height/2+120);
    line(width/4+width/2, height/2, width/4*3-50, height/2);
    line(width/2, height/4, width/4+width/2, height/2);
  }
  float nlevel=0.1;
  float A=-999;
  float B=-999;
  float xnoise= random(0, 900);
  float x;

  for (int i=0;i<=height;i+=500) {
    x=-200+noise(xnoise)*950;
    if (B>-999) {
      stroke(112, 146, 67, random(150, 255));
      //first line grass

      strokeWeight(random(2));
      line(x, 500-noise(B/5, B/6)/5, A, random(200, 400)-random(400, i)/5);
      stroke(167, 194, 116, random(150, 255));
      line(x, 500-noise(B/5, B/6)/5, A, random(150, 400)-random(400, i)/5);
    } 
    A=x;
    B=i;
    xnoise += nlevel;
  }
}
  void mouseReleased() {
    if (value == 0) {
      value = 255;
    } 
    else {
      value = 0;
    }
  }



