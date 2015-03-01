
void setup() {
  size(1000, 1000);
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100);
  frameRate(1);
}

void draw() {
  background(360, 0, 100);
  //set up x- and y-offsets to space point-circle things evenly
  for (int x=0; x< (width-50); x+=50) {
    for (int y=0; y< (height-50); y+=50) {
      //use || to cover both the x- and y-rows that will be black
      if ((x==200)||(y==200)) {
        stroke(0, 0, 0);
      } else {
        stroke(random(360), random(50, 90), 75);
      }
      strokeWeight(25);
      point(50+x, 50+y);
    }
  }
    //saving 10 files--if/else cuts off loop at 10 frames captured
    for (int frame=0; frame<10; frame+=10) {
      if (frame<10) {
        saveFrame("hirst-##.tif");
      } else {
        noLoop();
      }
    }
  }
 



