
//Assignment 8
//Max Perim, Andrew ID: mperim copyright 2012


boolean a = false;

void setup() {
  size (400, 400);
  background (255);
  smooth();
}


void draw() {
  color c = color (#F7BBF4);
 int i=100;
  while (i<400) {
    if   (a) {
      for (int h=100; h<400; h+=200) {
        face(h, i, round(random(0, 255)));
      }
      if (!a) {
        for (int h=100; h<400; h+=200) {
          face(h, i, c);
        }
      }
    }
    i+=100;
  }
}

void keyPressed() {
  if (key=='a') {
    a=true;
  }

  if (key=='s') {
    a=false;
  }
}
void face(float x, float y, float z) { 
  //head
  noStroke();
  fill(z*10, z/2, z+40);
  ellipse (x, y, 200, 200);
  //bags under eyes
  fill(105, 163, 183, 100);
  ellipse(x+45, y-40, 60, 30);
  ellipse(x-45, y-40, 60, 30);
  //eyes
  fill(255, 255, 255);
  ellipse (x+50, y-50, 60, 30);
  ellipse (x-50, y-50, 60, 30);
  //pupils
  fill (0);
  ellipse (x+45, y-45, 20, 20);
  ellipse (x-45, y-45, 20, 20);
  //blush
  fill(255, 178, 178, 100);
  ellipse (x+75, y-10, 25, 25);
  ellipse (x-75, y-10, 25, 25);
  //mouth
  fill(0);
  arc (x, y, 150, 150, radians(0), radians(180));
  //teeth
  fill(255);
  for (float i=0;i<130; i+=20) {
    arc ((x-60)+i, y, 20, 20, radians(0), radians(180));
  }
}


