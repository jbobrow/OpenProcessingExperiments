
float xPos; //xPosition
float yPos; //yPosition

float c=1; //counter

float center; //center point

float cr; //red
float cg; //green
float cb; //blue
float t; //tint

boolean s; //mouseClicked switch point

void setup() {
  size(500, 500);
  background(255);

  cr=random(0, 255);
  cg=random(0, 255);
  cb=random(0, 255);
  t=random(10, 125);

  center=random(25, width);

  xPos=width+(center/2);
  yPos=height+(center/2);

  s=false;
}

void draw() {
  if (s==true) {
    if (xPos<500) {
      for (int i=0; i<50; i++) {
        xfcicrcle();
        c++;
      }
      for (int i=0; i<50; i++) {
        xscircle();
        c++;
      }
    }
    else {
      cr=random(0, 255);
      cg=random(0, 255);
      cb=random(0, 255);
      t=random(10, 125);

      center=random(25, width);

      xPos=-(center/2);
      yPos=-(center/2);
    }
  }
  else {
    if (xPos>0) {
      for (int i=0; i<50; i++) {
        yfcircle();
        c++;
      }
      for (int i=0; i<50; i++) {
        yscircle();
        c++;
      }
    }
    else {
      cr=random(0, 255);
      cg=random(0, 255);
      cb=random(0, 255);
      t=random(10, 125);

      center=random(25, width);

      xPos=width+(center/2);
      yPos=height+(center/2);
    }
  }
}

void xfcicrcle() {
  if (c==50) {
    yPos=0;
    xPos=xPos+=(center/2);
    c=0;
  }
  else {
    fill(cr, cg, cb, t);
    noStroke();
    ellipse(xPos, yPos+=(center/2), center, center);
  }
}
void xscircle() {
  if (c==50) {
    yPos=-(center/2);
    xPos=xPos+=(center/2);
    c=0;
  }
  else {
    fill(cr, cg, cb, t);
    noStroke();
    ellipse(xPos, yPos+=(center/2), center, center);
  }
}

void yfcircle() {
  if (c==50) {
    yPos=height+(center/2);
    xPos=xPos-=(center/2);
    c=0;
  }
  else {
    fill(cr, cg, cb, t);
    noStroke();
    ellipse(xPos, yPos-=(center/2), center, center);
  }
}
void yscircle() {
  if (c==50) {
    yPos=height+(center/2);
    xPos=xPos-=(center/2);
    c=0;
  }
  else {
    fill(cr, cg, cb, t);
    noStroke();
    ellipse(xPos, yPos-=(center/2), center, center);
  }
}

void mouseClicked() {
  s=!s;

  cr=random(0, 255);
  cg=random(0, 255);
  cb=random(0, 255);
  t=random(10, 125);

  center=random(25, width);

  c=0;

  if (s==false) {
    xPos=-(center/2);
    yPos=-(center/2);
  }
  else {
    xPos=width+(center/2);
    yPos=height+(center/2);
  }
}



