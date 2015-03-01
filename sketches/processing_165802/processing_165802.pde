
float angle = 0.0;
float speed = 0.05;
float radius = 90.0;
float sx = 6.0;
float sy = 2.5;

void setup (){
  size (300, 300);
  noStroke ();
  smooth ();
  
}

void draw (){
  fill (250, 5, 5, 4);
  rect (0, 0, width, height);
  angle += speed * 2;
  float sinval = sin(angle);
  float cosval = cos(angle);
  float x = 150 + (cosval * radius);
  float y = 150 + (sinval * radius);
  fill (240, 142, 22, 40);
  ellipse (x, y, 60, 60);
  ellipse (x/2, y/2, 30, 30);
  float x2 = x + cos(angle * sx) * radius/2;
  float y2 = y + sin (angle * sy) * radius/2;
  fill (249, 250, 13);
  ellipse (x2, y2, 100, 100);
  ellipse (x2/2, y2/2, 50, 50);
  
}




