
int x, y;
float segundos;
float minutos;
float horas;


void setup() {
   
  size(960, 540);
  stroke(255);
  int radius = min(width, height) / 2;
  segundos = radius * 0.72;
  minutos = radius * 0.60;
  horas = radius * 0.50;

  x = width / 2;
  y = height / 2;
}

void draw() {
  background(0);
 
 smooth();
 
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

 //agujas
strokeWeight (20);
stroke(255, 150, 0, 220);
 noFill();
  ellipse(x, y, 380, 380);
  stroke(0);
  strokeWeight(40);
  line(x, y, x + cos(s) * segundos, y + sin(s) * segundos);

 
 strokeWeight (20);
stroke(255, 150, 0, 175);
 noFill();
  ellipse(x, y, 312, 312);
 stroke(0);
  strokeWeight(35);
  line(x, y, x + cos(m) * minutos, y + sin(m) * minutos);
  
 
  strokeWeight (30);
stroke(255, 150, 0, 100);
 noFill();
  ellipse(x, y, 215, 215);
 stroke(255, 200);
  strokeWeight(20);
  stroke(0);
  strokeWeight(20);
  line(x, y, x + cos(h) * horas, y + sin(h) * horas);
  
   
  
}

