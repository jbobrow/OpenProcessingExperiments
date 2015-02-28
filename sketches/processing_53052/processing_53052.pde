
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
  d2Face();
}

void dadFace() {
    for(int i=205; i<260; i=i+3) {
    if (mouseX>200) {
    if (mouseX<260) {
    if (mouseY>100) {
    if (mouseY<180) {
  PImage faceLinez = happyFam.get(i, 115, 3, 70);
  image(faceLinez, i, random(115, 350));
    }
    }
    }
    }
  }
}

void momFace() {
    for(int i=337; i<385; i=i+4) {
    if (mouseX>330) {
    if (mouseX<390) {
    if (mouseY>120) {
    if (mouseY<200) {
  PImage faceLinez = happyFam.get(i, 127, 4, 70);
  image(faceLinez, i, random(127, 350));
    }}
    }
    }
  }
}

void d1Face() {
    for(int i=265; i<307; i=i+2) {
    if (mouseX>265) {
    if (mouseX<305) {
    if (mouseY>60) {
    if (mouseY<120) {
  PImage faceLinez = happyFam.get(i, 70, 2, 40);
  image(faceLinez, i, random(70, 350));
    }
    }
    }
    }
  }
}

void sonFace() {
    for(int i=155; i<190; i=i+2) {
    if (mouseX>150) {
    if (mouseX<195) {
    if (mouseY>100) {
    if (mouseY<180) {
  PImage faceLinez = happyFam.get(i, 140, 2, 10);
  image(faceLinez, i, random(120, 350));
    }
    }
    }
    }
  }
}

void d2Face() {
  for (int i=240; i<290; i=i+2) {
    if (mouseX>280) {
    if (mouseX<320) {
    if (mouseY>240) {
    if (mouseY<290) {
  PImage faceLinez = happyFam.get(300, i, 30, 2);
  image(faceLinez, random(5, 290), i);
    }
    }
    }
    }
  }
}

    

