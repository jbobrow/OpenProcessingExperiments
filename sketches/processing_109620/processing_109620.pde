
float x_sec, x_min, x_heu;
float y_sec, y_min, y_heu;
float incr_60 = -TWO_PI/60;
float incr_24 = -TWO_PI/12;
color col = #2F3440;

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  background(#2F3440);
  translate(width/2, height/2); 
  int secondes = second();
  int minutes = minute();
  int heure = abs(hour()-12);

  for (int i = 0; i<60; i++) {
    strokeWeight(15);
    if (i == secondes) {
      //fill(0);
      stroke(col);
    }
    else {
      //fill(255);
      stroke(#F8CA4D);
    }
    x_sec = sin(PI+i*incr_60)*200;
    y_sec = cos(PI+i*incr_60)*200;
    point(x_sec, y_sec);
  }

  for (int i = 0; i<60; i++) {
    strokeWeight(10);
    if (i == minutes) {
      //fill(0);
      stroke(col);
    }
    else {
      //fill(255);
      stroke(#EA6045);
    }
    x_min = sin(PI+i*incr_60)*170;
    y_min = cos(PI+i*incr_60)*170;
    point(x_min, y_min);
  }   

  for (int i = 0; i<12; i++) {
    strokeWeight(35);
    if (i == heure) {
      //fill(0);
      stroke(col);
    }
    else {
      //fill(255);
      stroke(#3F5666);
    }
    x_heu = sin(PI+i*incr_24)*100;
    y_heu = cos(PI+i*incr_24)*100;
    point(x_heu, y_heu);
  }
}



