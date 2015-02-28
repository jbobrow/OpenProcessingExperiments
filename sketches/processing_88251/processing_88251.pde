
float a = 0.0;
float inc = TWO_PI/50;
float prev_x = 0, prev_y = 300, x, y;


size(800, 600);
background(0);

stroke(255);
for(int i=0; i<800; i=i+4) {
  x = i;
  y = 300 + sin(a) * 80.0 + random(4);
  line(prev_x, prev_y, x, y);
  prev_x = x;
  prev_y = y;
  a = a + inc;
}

color red = color(255,0,0);
stroke(red);
prev_x = 0;
prev_y = 300;
for(int i=0; i<800; i=i+4) {
  x = i;
  y = 300 + cos(a) * 80.0 + random(random(2));
  line(prev_x, prev_y, x, y);
  prev_x = x;
  prev_y = y;
  a = a + inc;
}

stroke(150);
fill(255);
ellipse(200,100 , 75, 75);
fill(0);
ellipse(200,100, 25, 25);

stroke(150);
fill(255);
ellipse(600,100 , 75, 75);
fill(0);
ellipse(600,100, 25, 25);



