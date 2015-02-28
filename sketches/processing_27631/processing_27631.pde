
PShape img;
PShape img2;
PShape img3;
//PShape one;

void setup() {
  size(640, 480);
  smooth();
  img = loadShape("Clock.svg");
  img2 = loadShape("Clock2.svg");
  img3 = loadShape("Clock3.svg");
  //one = img.getChild("1");
}

void draw() {
  int s = second();
  background (167, 220, 235);
  //shape(one, 0, 0);
  //cracks-hour
  int h = hour();
  if (h > 12){
    h = h - 12;
  }
  for(int i = 11; i >= h; i--) {
    PShape three = img3.getChild(i);
    shape(three, 0, 0);
  }
  //cracks-minute
  int m = minute();
  for (int i = 59; i > m; i--)
  {
    PShape two = img2.getChild(i);
    shape(two, 0, 0);
  }
  //Cracks-second
  for (int i = 59; i > s; i--) {
    PShape one = img.getChild(i);
    shape(one, 0, 0);
  }

}


