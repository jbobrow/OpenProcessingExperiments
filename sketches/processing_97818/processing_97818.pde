
//Daniela Bernaski Meira
// Fachada


void setup() {
  size(200, 200);
  background(82, 170, 245);
}

float x=0;
int y=140;
int d=55;
int v=120;

void draw() {

  noStroke();
  fill(11, 80, 31);
  rect(0, 170, 140, 30);
  triangle(140, 170, 180, 200, 140, 200);

  stroke(0);
  fill(255);
  rect(50, 100, 40, 70);
  quad(90, 110, 200, 110, 180, 170, 90, 170);



  fill(255);
  rect(0, 150, 50, 5);

  for (x=0; x<45; x=x+16.5) {
    for (y=140; y<151; y= y+14) {
      fill(167, 229, 194);
      rect(x, y, 17, 10);
    }
  }


  for (d=55; d<86; d=d+12) {
    for (v=120; v<131; v=v+15) {
      rect(d, v, 8, 8);
    }
  }


  if (mouseX<140 && mouseY>170 && mouseY<200)
    fill(250, 255, 21);
  else
    fill(167, 229, 194);

  quad(168, 170, 188, 110, 192, 110, 172, 170);
  quad(160, 170, 180, 110, 184, 110, 164, 170);

  
}
