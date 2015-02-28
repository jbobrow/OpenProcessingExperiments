
float angle=0;
float x;
 
void setup (){
  size(300,300);
  background(0,90);
  smooth();
}

void draw(){
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      stroke(i, j, 0);
      point(i, j);
      x+=1.0;
      angle = angle + 0.3;
      frameRate(7.0);
      translate(150,150);
      rotate(angle);
      fill(131,250,255,25);
      arc(50, 55, 50, 50, 0, PI/2);
      rotate(angle+4.0);
      frameRate(9.0);
      fill(220, 20);
      arc(50 * i, 55 + i, 50, 50, 0, PI/2);
      arc(50 * i, 55, 60, 60 * i, PI/2, PI);
      arc(50, 55 * i, 70, 70, PI, TWO_PI-PI/2);
      arc(50, 55, 80 * i, 8, TWO_PI-PI/2, TWO_PI);
      stroke(30);
      rotate(angle+2.0);
    }
  }
}

