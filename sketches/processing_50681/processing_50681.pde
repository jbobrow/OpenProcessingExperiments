
float aa, bb;
float ac;
float h;
float offset_hair;
int offset = 10;


void setup () {
  size (500, 500);
  aa= width * 0.33;
  ac= width * 0.66;
  bb= width/2;
  smooth();
  strokeWeight (5);
  strokeJoin (ROUND);
  h= width/2;
}

void draw () {
  background(247, 197, 210); // pink skin

  /*if (mouseX> h){
   h+=0.5;
   offset = -10;
   }
   if (mouseX<h){   // FAILED ATTEMPT
   h-=0.5;
   offset= 10;
   }
   
   */  offset_hair = int(mouseX);

  float ml = map(mouseX, 0, width, -550, 550);
  for (int i = -90; i <500; i+=10) { // loop
    stroke(80, 20, 20); // brown color
    //line(i, 0, i, 175); // slanted hair
    line(i, 0, i+ml, 170);
    //line(i+offset_hair, 0, 0, 175);
  }
  float mx = map(mouseX, 0, width, 20, 80);
  fill(0);
  noStroke();

  ellipse (aa, bb, mx, mx); // left eye
  ellipse(ac, bb, mx, mx);//  right eye

  //float thick = map(mouseX, 0, width, 0, 20);
  //strokeWeight(thick);
  //fill(0);
  stroke(0);
  //strokeWeight(10);
  float z = map(mouseX, 0, width, 100, 10);
  triangle(aa, height - 100, ac, height - 100, (aa+ac)/2, height - z );
}


