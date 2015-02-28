
int bDay = 365*1993 + 1993/4 - 1993/11 - 1993/400 + 14 + (153*8+8)/5;
int now = 365*year() + year()/4 - year()/11 - year()/400 + day() + (153*month()+8)/5;
int daysBetween = now - bDay;

void setup() {
  size(1100, 1100);
  background(0);
}

void draw() {
  int x = 550;
  int y = 550;  //origin coordinates
  int m = minute();
  setup();
  stroke(255);
  century(x, y);
}

void century(int x, int y) {
  translate(x, y);
  fill(255);
  ellipse(0, 0, 340, 340);
  rotate(daysBetween*PI/730.5);
  fill(0);
  for (int i = 0; i < 6; i ++) { //make hours()
    pushMatrix();
    rotate(i*PI/3);
    days();
    popMatrix();
  }
  arc(0, 0, 340, 340, PI/2, 3*PI/2);
}  

void days() {
  translate(350, 0);
  fill(255);
  ellipse(0, 0, 110, 110);
  rotate(daysBetween*PI/730);
  fill(0);
  for (int i = 0; i < 6; i ++) { //make hours()
    pushMatrix();
    rotate(i*PI/3);
    hours();
    popMatrix();
  }
  arc(0, 0, 110, 110, PI/2, 3*PI/2);
}  

void hours() {
  translate(120, 0);
  fill(255);
  ellipse(0, 0, 36, 36);
  rotate(hour()*PI/3);
  fill(0);
  for (int i = 0; i < 6; i ++) {
    pushMatrix();
    rotate(i*PI/3);
    minutes();
    popMatrix();
  }
  fill(0);
  arc(0, 0, 36, 36, PI/2, 3*PI/2);
}

void minutes() {
  translate(40, 0);
  fill(255);
  ellipse(0, 0, 15, 15);
  rotate(millis()*PI/30000);
  for (int i = 0; i < 6; i++) {
    pushMatrix();
    rotate(i*PI/3);
    seconds();
    popMatrix();
  }
  fill(0);
  arc(0, 0, 15, 15, PI/2, 3*PI/2);
}

void seconds() {
  int s = second();
  translate(14, 0);
  fill(255);
  ellipse(0, 0, 9, 9);
  rotate(millis()*PI/1000);
  fill(0);
  arc(0, 0, 9, 9, PI/2, 3*PI/2);
}



