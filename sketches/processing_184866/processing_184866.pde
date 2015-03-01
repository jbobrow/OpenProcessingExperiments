
int sec;
int min;
int h;

int hoehe= 400;
int breite = 400;

void setup() {
  size(600, 600);
}

void draw() {
  smooth();
  background(150);
  sec = second();
  min = minute();
  h = hour()%12;

  translate(width/2, height/2);

  //Rechteck außen
  strokeWeight(5);
  stroke(0);
  noFill();
  rectMode(CENTER);
  rect(0, 0, breite, hoehe);

  //schwarzer Kreis in der Mitte
  fill(0);
  ellipse(0, 0, 20, 20);

  //Skala
  fill(0);
  line(0, -hoehe/2, 0, -hoehe/2 + 15);
  line(breite/2, 0, breite/2 -15, 0);
  line(0, hoehe/2, 0, hoehe/2 - 15);
  line(-breite/2, 0, -breite/2 + 15, 0);
  
   
   //Orientierung
   noFill();
  rect(0,0,370,370);
  rect(0,0,200,200);
  strokeWeight(1);
  line(-200,0, 200, 0);
  line(0,-200, 0,200);
  
  
  
  //Sekunden
  strokeWeight(2);
  stroke(50);
  if (sec <8) {
    line(0, 0, 370/15 * sec, -370/2);
  } else if (sec >=8 && sec <15) {
    line(0, 0, 370/2, -370/2 + 37/3 + 370/15 * (sec-8));
  } else if (sec >= 15 && sec <23) {
    line(0,0,370/2, 370/15 * (sec -15));
  } else if (sec >= 23 && sec < 30) {
    line(0,0,370/2 - 37/3 - 370/15 * (sec -23), 370/2);
   // line(0,0,370/2 + 37/3 + 370/15 * (sec - 23), 320/2);
  } else if (sec >= 30 && sec < 38) {
    line(0,0,-370/15 * (sec -30), 370/2);
  } else if (sec >= 38 && sec < 45) {
    line(0,0,-370/2, 370/2 - 37/3 - 370/15 * (sec - 38));
  } else if (sec >= 45 && sec < 53) {
    line(0,0,-370/2, -370/15 * (sec -45));
  } else if (sec >= 53 && sec < 60) {
    line(0,0,-370/2 + 37/3 + 370/15 * (sec - 53), -370/2);
  }
  
  //Minuten
  strokeWeight(5);
  stroke(50);
    if (min <8) {
    line(0, 0, 370/15 * min, -370/2);
  } else if (min >=8 && min <15) {
    line(0, 0, 370/2, -370/2 + 37/3 + 370/15 * (min-8));
  } else if (min >= 15 && min <23) {
    line(0,0,370/2, 370/15 * (min -15));
  } else if (min >= 23 && min < 30) {
    line(0,0,370/2 - 37/3 - 370/15 * (min -23), 370/2);
  } else if (min >= 30 && min < 38) {
    line(0,0,-370/15 * (min -30), 370/2);
  } else if (min >= 38 && min < 45) {
    line(0,0,-370/2, 370/2 - 37/3 - 370/15 * (min - 38));
  } else if (min >= 45 && min < 53) {
    line(0,0,-370/2, -370/15 * (min -45));
  } else if (min >= 53 && min < 60) {
    line(0,0,-370/2 + 37/3 + 370/15 * (min - 53), -370/2);
  }
  
  //Stunden
  strokeWeight(8);
  stroke(50);
  if (h >= 0 && h < 2) {
    line(0,0, 200/3 * h, -100);
  } else if (h >= 2 && h < 3) {
    line(0,0,100,-100 + 200/6 + 200/3 * (h - 2));
  } else if (h >= 3 && h < 5) {
    line(0,0, 100, 200/3 * (h - 3));
  } else if (h >= 5 && h < 6) {
    line(0,0, 100 - 200/6 - 200/3 * (h-5), 100);
  } else if (h>= 6 && h < 8) {
    line(0,0,-200/3 * (h - 6), 100);
  } else if (h>= 8 && h < 9) {
    line(0,0, -100, 100 - 200/6 - 200/3 * (h - 8));
  } else if (h>= 9 && h < 11) {
    line(0,0, -100, -200/3 * (h - 9));
  } else if (h >= 11 && h <= 12) {
    line(0,0, -100 + 200/6 + 200/3 * (h - 11), -100);
  }
  
  
  //Punkt mitte
  fill(50);
  ellipse(0,0,5,5);
}



