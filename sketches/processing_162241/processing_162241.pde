
size (300, 300);
background (0);
noStroke ();
smooth ();
colorMode (RGB);
float radius = 38;
for(int i = 0; i < 1000; i ++) { 
  for(int deg = 0; deg < 360; deg +=12){
  float angle = radians (deg);
  float x = 150 + (cos(angle) * radius);
  float y = 150 + (sin(angle)* radius);
fill (9, 66, 103, i);
ellipse (x, y, 15, 15 );
 i ++;
 radius = radius + 0.50;
 
 
  }
}



