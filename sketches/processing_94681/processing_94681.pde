
int y1 = 250;
int y2 = 280;
int s = 225;
int s2  = 225;
int s3 = 225;
int s4 = 225;
int s5 = 225;
int s6 = 225;
int counter = 225 ;
int x = width/2;
int y = 50;
int a = 0;

void setup() {
  size(800, 800);
  background (0);
  colorMode(HSB, 300);
}
void draw() {
  frameRate(60);
  linien();
}

void linien() {
  counter++;
  if (counter >= 1) {
    stroke(counter-225, 400, 400);
    line(counter, y1, counter, y2);

    if (counter >= 350+175) {
      background(0);
      counter = 225;
    }
  }

  //--------------------------------------------------------
  s++;
  if (s >= 1) {
    stroke(s-225, 400, 400);
    line(s, y1+50, s, y2+50);

    if (s >= 250+225) {
      //ellipse (30,30,30,30);
      s=250+225;
    }
  }
  if (counter == 349+175) {
    s=225;
  }
  //---------------------------------------------------
  s2++;
  if (s2 >= 1) {
    stroke(s2-225, 400, 400);
    line(s2, y1+100, s2, y2+100);
    
    if (s2 >= 200+225) {
      //ellipse (30,30,30,30);
      s2=225;
    }
  }
  if (counter == 349+175) {
    s2=225;
  }  
  //----------------------------------------
  s3++;
  if (s3 >= 1) {
    stroke(s3-225, 400, 400);
    line(s3, y1+150, s3, y2+150);

    if (s3 >= 150+225) {
      //ellipse (30,30,30,30);
      s3=225;
    }
  }
  if (counter == 349+175) {
    s3=225;
  }
  //----------------------------------------
  s4++;
  if (s4 >= 1) {
    stroke(s4-225, 400, 400);
    line(s4, y1+200, s4, y2+200);

    if (s4 >= 100+225) {
      //ellipse (30,30,30,30);
      s4=225;
    }
  }
  if (counter == 349+175) {
    s4=225;
  }
  //----------------------------------------
  s5++;
  if (s5 >= 1) {
    stroke(s5-225, 400, 400);
    line(s5, y1+250, s5, y2+250);

    if (s5 >= 50+225) {
      //ellipse (30,30,30,30);
      s5=225;
    }
  }
  if (counter == 349+175) {
    s5=225;
  }
 
}

