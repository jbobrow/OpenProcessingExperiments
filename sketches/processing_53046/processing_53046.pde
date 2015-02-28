
PImage happyFam;

void setup() {
  size (520, 350);
  happyFam = loadImage("HappyFamily.jpeg");
  image(happyFam, 0, 0);
}

void draw() {
  dadFace();
  momFace();
  d1Face();
  sonFace();
}

void dadFace() {
    for(int i=205; i<260; i=i+4) {
    if (mouseX>200) {
    if (mouseX<260) {
  PImage faceLinez = happyFam.get(i, 115, 3, 70);
  image(faceLinez, i, random(115, 350));
    }
    }
  }
}

void momFace() {
    for(int i=337; i<385; i=i+6) {
    if (mouseX>330) {
    if (mouseX<390) {
  PImage faceLinez = happyFam.get(i, 127, 4, 70);
  image(faceLinez, i, random(127, 350));
    }
    }
  }
}

void d1Face() {
    for(int i=265; i<307; i=i+2) {
    if (mouseX>265) {
    if (mouseX<305) {
  PImage faceLinez = happyFam.get(i, 70, 2, 40);
  image(faceLinez, i, random(70, 350));
    }
    }
  }
}

void sonFace() {
    for(int i=155; i<190; i=i+2) {
    if (mouseX>150) {
    if (mouseX<195) {
  PImage faceLinez = happyFam.get(i, 140, 2, 10);
  image(faceLinez, i, (i+75)/2, 2, random(50, 80));
    }
    }
  }
}

    

