
// TOPOGRAFIA ALGORITMICA
// ej2sem2
// MARTIN ZUMAYA
int vx = 1, vy = 1, cx, cy, i= 1;
float t = 0, r = 500, s= 0, k=1;
// _ _ _ _ _ _ _ _ _ _ _ _ _ _
// _ _ _ _ _SETUP _ _ _ _ _ _ _ _ _
void setup() {
  size(700, 700);
  smooth();
  frameRate(25);
  // colorMode(HSB,100); 
  background(59, 109, 124);
  cx = width/2;
  cy = height/2;
}
// _ _ _ _ _ _ _ _ _ _ _ _ _ _
// _ _ _ _ _DRAW _ _ _ _ _ _ _ _ _
void draw() {

  fill(59, 109, 124, 5);
  rect(0, 0, width, height);

  translate(width/2, height/2);
  //  vx = mouseX - pmouseX;
  //  vy = mouseY - pmouseY;

  for ( int i = 100; i < r; i +=10) {
    stroke(255, 255-100*sin(s));    
    fill(255, 40);
    point(i*cos(radians(s)), i*sin(radians(s)));
    point(-i*cos(radians(s)), -i*sin(radians(s)));
    point(-i*cos(radians(s)), i*sin(radians(s)));
    point(i*cos(radians(s)), -i*sin(radians(s)));
  }

  float x = r/2*cos(radians(vx*t));
  float y = r/2*sin(radians(vy*t));

  stroke(255);
  //  curve(-300, 0, x, 0, x, y/2, 300, 0);
  curve(0, -r, 0, y, x, 0, 0, r);
  //  curve(0, -r, 0, -y, -x, 0, 0, r);
  //  curve(0, -r, 0, -y, x, 0, 0, r);
  curve(0, -r, 0, y, -x, 0, 0, r);  

  //  curve(-100,0,0,-y,-x,0,100,0);

  //  line(x-150,y,-x+150,y);


  //  if( radians(t) <= 2*PI){
  //   save("capturas/img"+frameCount+".png"); 
  //  }

  t += 4;    
  s += 2;

  if (mousePressed == true) {
//    save("capturas/img"+frameCount+".png");
    background(59, 109, 124);
    vy += i*2;
  }
  if( vy >= 10 || vy <= -10){
   i *= -1; 
  }
}
// _ _ _ _ _ _ _ _ _ _ _ _ _ _
// _ _ _ _ _INTERACCION _ _ _ _ _ _ _ _ _


