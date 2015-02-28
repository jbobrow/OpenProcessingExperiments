
float radius;
float centerX, centerY;

void setup() {
  size(800,800);
  centerX=width/2;
  centerY=height/2;
  radius=min((3./4)*centerX, (3./4)*centerY);
  for (int i = 0; i < 360; i += 10) {
    ellipse(coordX(i), coordY(i), 10, 10);
    stroke(0,0,255);
  line(coordX(0), coordY(0),coordX(i), coordY(i));
stroke(0,255,0);  
  line(coordX(90), coordY(90),coordX(i), coordY(i)); 
  stroke(255,0,0);
  line(coordX(180), coordY(180),coordX(i), coordY(i)); 
  stroke(0);
  line(coordX(270), coordY(270),coordX(i), coordY(i)); 
}
  //ellipse(centerX, centerY, 10, 10);
}
float coordX(float angle) {
  return radius * cos(angle * PI / 180) + centerX;
}
float coordY(float angle) {
  return radius *sin(angle * PI / 180) + centerY;
}
