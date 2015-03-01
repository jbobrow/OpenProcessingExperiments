
void setup() {
  size(800, 800);
  //noStroke();
  background(255);
    drawCircle(width/2, height/2, 400);

  
  }


void drawCircle(float x, float y, float d) {
  fill(x/2, y/2, d*2);
   strokeWeight(1/((d*d)/2));
  ellipse(x, y, d, d);
  if (d>2) {

    drawCircle(x+d/2, y, d/2);
    drawCircle(x-d/2, y, d/2);
    drawCircle(x, y+d/2, d/2);

    // drawCircle(x,y-d/2,d/2);
  }
}

