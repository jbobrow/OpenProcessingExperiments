
float x_sec, x_min, x_heu;
float y_sec, y_min, y_heu;
float incr_60 = -TWO_PI/60;
float incr_24 = -TWO_PI/12;
color col = #2F3440;
float x = 0;
float y = -1;
float x2 = 0;
float y2 = -1;
float x3 = 0;
float y3 = -1;
float size_sec_x, size_sec_y;
float size_heu_x, size_heu_y;
color s1,s2,m1,m2,h1,h2;

void setup() {
  size(600, 500);
  background(80);
  size_sec_x = width/3/10;
  size_sec_y = height/6;
  size_heu_x = width/3/4;
  size_heu_y = height/6;
  s1 =#9754FF ;
  s2 =#261540 ;
  m1 =#713FBF ;
  m2 =#261540 ;
  h1 =#4C2A7F ;
  h2 =#261540 ;
  stroke(0);
  strokeWeight(3);

}

void draw() {
  //background(#2F3440);
  //translate(width/2, height/2); 
  int secondes = second();
  int minutes = minute();
  int heure = hour();

  translate(width-(width/3), 0);
  for (int i = 0; i<60; i++) {
    if (i < secondes) {
      fill(s1);
      //stroke(s1);
    }
    else {
      fill(s2);
    }
    if (i % 10 == 0) {
      x=0;
      y++;
    }
    if ( y==6) {
      y = 0;
      x = 0;
    }
    rect(x*size_sec_x, y*size_sec_y, size_sec_x, size_sec_y);
    x++;
  }
  resetMatrix();

  translate(width/3, 0);
  for (int i = 0; i<60; i++) {
    if (i < minutes) {
      fill(m1);
      //stroke(m1);
    }
    else {
      fill(m2);
    }
    if (i % 10 == 0) {
      x2=0;
      y2++;
    }
    if ( y2==6) {
      y2 = 0;
      x2 = 0;
    }
    rect(x2*size_sec_x, y2*size_sec_y, size_sec_x, size_sec_y);
    x2++;
  }
  resetMatrix();

  //translate(0, 0);
  for (int i = 0; i<24; i++) {
    if (i < heure) {
      fill(h1);
      //stroke(h1);
    }
    else {
      fill(h2);
    }
    if (i % 4 == 0) {
      x3=0;
      y3++;
    }
    if ( y3==6) {
      y3 = 0;
      x3 = 0;
    }
    rect(x3*size_heu_x, y3*size_heu_y, size_heu_x, size_heu_y);
    x3++;
  }
}



