
void setup() {
  size(800, 400);
  smooth();
  background(255);
  f0();
}

void keyReleased() {
  background(255);  
  if (key == '0') {
    f0();
  }
  else if (key == '1') {
    f1();
  }
  else if (key == '2') {
    f2();
  }
  else if (key == '3') {
    f3();
  }
  else if (key == '4') {
    f4();
  }
  else if (key == '5') {
    f5();
  }
  else if (key == '6') {
    f6();
  }
  else if (key == '7') {
    f7();
  }
  else if (key == '8') {
    f8();
  }
  else if (key == '9') {
    f9();
  }
  else {
    f10();
  }
}

void f10() {
  for (int j=1; j<width; j++) {
    float n = 12;
    float i0 = height/2+100*sin(TWO_PI*(n*0.001*float(width-j+width/2+1)/2f)*(width-j+1)/width);
    float i1 = height/2+100*sin(TWO_PI*(n*0.001*float(width-j+width/2)/2f)*(width-j)/width);
    line(j-1, i0, j, i1);
  }
}

// version of f8
void f9() {
  for (int j=1; j<width; j++) {
    float n = 4;
    float xoff = 1;
    float i0 = height/2+100*sin(TWO_PI*(1000000f/(j-0+width/xoff))*(n/2f)*(j-1+width/xoff)/width);
    float i1 = height/2+100*sin(TWO_PI*(1000000f/(j+1+width/xoff))*(n/2f)*(j+width/xoff)/width);
    line(j-1, i0, j, i1);
  }
}
void f8() {
  for (int j=1; j<width; j++) {
    float n = 12;
    float i0 = height/2+100*sin(TWO_PI*(1000000f/(j))*(n/2f)*(j-1)/width);
    float i1 = height/2+100*sin(TWO_PI*(1000000f/(j+1))*(n/2f)*j/width);
    line(j-1, i0, j, i1);
  }
}

void f7() {
  for (int j=1; j<width; j++) {
    float n = 12;
    float i0 = height/2+100*sin(TWO_PI*(n*100000/(2f*j))*(j-1)/width);
    float i1 = height/2+100*sin(TWO_PI*(n*100000/(2f*j))*j/width);
    line(j-1, i0, j, i1);
  }
}

void f6() {
  for (int j=1; j<width; j++) {
    float n = 12;
    float i0 = height/2+100*sin(TWO_PI*((n-j-1)/2f)*(j-1)/width);
    float i1 = height/2+100*sin(TWO_PI*((n-j)/2f)*j/width);
    line(j-1, i0, j, i1);
  }
}

// version of f4
void f5() {
  for (int j=1; j<width; j++) {
    float n = 12;
    float i0 = height/2+100*sin(TWO_PI*(n*0.001*float(j+width/2-1)/2f)*(j-1)/width);
    float i1 = height/2+100*sin(TWO_PI*(n*0.001*float(j+width/2)/2f)*(j)/width);
    line(j-1, i0, j, i1);
  }
}
void f4() {
  for (int j=1; j<width; j++) {
    float n = 12;
    float i0 = height/2+100*sin(TWO_PI*(n*0.001*float(j-1)/2f)*(j-1)/width);
    float i1 = height/2+100*sin(TWO_PI*(n*0.001*float(j)/2f)*j/width);
    line(j-1, i0, j, i1);
  }
}

// version of f2()
void f3() {
  for (int j=1; j<width; j++) {
    float n = 12;
    float i0 = height/2+100*sin(TWO_PI*(n*0.1*float(j-1)/2f)*(j-1)/width);
    float i1 = height/2+100*sin(TWO_PI*(n*0.1*float(j)/2f)*j/width);
    line(j-1, i0, j, i1);
  }
}
void f2() {
  for (int j=1; j<width; j++) {
    float n = 12;
    float i0 = height/2+100*sin(TWO_PI*(n*0.01*float(j-1)/2f)*(j-1)/width);
    float i1 = height/2+100*sin(TWO_PI*(n*0.01*float(j)/2f)*j/width);
    line(j-1, i0, j, i1);
  }
}

// version of f0()
void f1() {
  for (int j=1; j<width; j++) {
    float n = 12;
    float i0 = height/2+100*sin(TWO_PI*(n*(j-1)/2f)*(j-1)/width);
    float i1 = height/2+100*sin(TWO_PI*(n*j/2f)*j/width);
    line(j-1, i0, j, i1);
  }
}
void f0() {
  for (int j=1; j<width; j++) {
    float n = 12;
    float i0 = height/2+100*sin(TWO_PI*(n*(j)/2f)*(j-1)/width);
    float i1 = height/2+100*sin(TWO_PI*(n*j/2f)*j/width);
    line(j-1, i0, j, i1);
  }
}

void draw() {
}

