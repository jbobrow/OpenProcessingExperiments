
int a = 50;
int c = 50;
float d = HALF_PI;
float e = PI;

size(625, 650);
background(0);


/*void draw () { */
while (a <= 600 ) {
  int b = 50;
  while (b <= 600 ) {
    noFill();
    stroke(random(0, 225), 100, 200);
    arc(a, b, c, c, d, e);
    b = b+ 50;
  }
  a = a + 50; //100

    if ( a >= 100 && a <= 149) {
    d = PI;
    e = PI + HALF_PI;
  }
  if (a >= 150 ) { 
    d = HALF_PI;
    e = PI;
  }
  if (a >=200 && a <=240 ) {
    d = PI;
    e = PI+ HALF_PI;
  }
  if (a >=300 && a <=349) {
    d = PI;
    e = PI+ HALF_PI;
  }
  if (a>=400 && a <= 449) {
    d= PI;
    e = PI + HALF_PI;
  }
  if (a >=500 && a <=549 ) {
    d = PI;
    e = PI+ HALF_PI;
  }
  if (a >=600 ) {
    d = PI;
    e = PI+ HALF_PI;
}
}



