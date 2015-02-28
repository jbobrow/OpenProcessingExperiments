
float x, y;
int i = 25;

void setup() {
  size(900, 300);
  background(0);
  frameRate(2);
  x = width/2;
  y = height/2;
}
void draw() {
  fill(0, 5);
  rect(0, 0, width, height);
  stroke(155);

  for (int y1 = 0; y1 <300; y1+=25) {
    for (int x1=0; x1<900; x1+=50) {
      point(x1, y1);
    }
  }
  for (int y2 = 12; y2 <300; y2+=25) {
    for (int x1=25; x1<895; x1+=50) {
      point(x1, y2);
    }
  }

  x = (int)(random(1, 36));
  y = (int)(random(2, 12));

  noStroke();
  fill(100);
  quad(i+(x*i), y*24, (x*i), 12+(y*24), (x*i), 12+(y*12), i+(x*i), (y*12));
  fill(125);
  quad(-i+(x*i), y*24, (x*i), 12+(y*24), (x*i), 12+(y*12), -i+(x*i), (y*12));
  fill(75);
  quad(-i+(x*i), y*12, (x*i), 12+(y*12), i+(x*i), (y*12), (x*i), (y*12)-12.5);
}



