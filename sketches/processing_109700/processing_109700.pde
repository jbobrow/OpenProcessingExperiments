
float margin_x, margin_y, step, sz;
color s1, s2, m1, m2, h1, h2;

void setup() {
  size(800, 200);
  margin_x = width/15;
  margin_y = height/4;
  step = (width - 2*margin_x)/60;
  sz = 10;
  strokeWeight(3);
  h1 =#A4BAA2 ;
  h2 =#DFE0AF ;
  m1 =#569492 ;
  m2 =#DFE0AF ;
  s1 =#41505E ;
  s2 =#DFE0AF ;
}

void draw() {
  background(#383245);
  int secondes = second();
  int minutes = minute();
  int heure = hour();
  
  text(hour()+" : "+minute()+" : "+second(), width - 2.5* margin_x, margin_y);

  for (int i = 0; i<24; i++) {
    stroke(h1);
    if (i < heure) {
      fill(h1);
    }
    else {
      fill(h2);
    }
    ellipse(margin_x + i*step, margin_y, sz, sz);
  }

  for (int i = 0; i<60; i++) {
    stroke(m1);
    if (i < minutes) {
      fill(m1);
    }
    else {
      fill(m2);
    }
    ellipse(margin_x + i*step, 2*margin_y, sz, sz);
  }   

  for (int i = 0; i<60; i++) {
    stroke(s1);
    if (i < secondes) {
      fill(s1);
    }
    else {
      fill(s2);
    }
    ellipse(margin_x + i*step, 3*margin_y, sz, sz);
  }
}

void mouseClicked() {
  save(random(1234)+".png");

}



