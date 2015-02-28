
float speed = 23.5;
int diameter = 20;
float angle = 0.0;
float[] as = new float[20];
float p; 
float y;
float[] x = new float[120];

float R = 255;
float G = 255;
float B = 0;

float incremento = +1;

float mincol = 0, maxcol = 25;
color[] colors = new color[2];

// int to keep track of the current color
int selectedColor;

// int to keep track of the time since the last color change
int timer;
boolean useLight  = false;
void setup() {



  size(600, 600, P3D);
  frameRate(30.0);

  colors[0] = color(random(255-1), random(255-1), random(255-1));
  R += incremento;
  if (255-1 > maxcol)
    incremento = -500.0;
  else if (255 < mincol)
    incremento = random(1); // red
  colors[1] = color(random(255+1), random(255-1), random(255+1));
  R += incremento;// blue

  p = width/2;
  y = height/2;
}

void draw() {
sphereDetail(3);

  if (mousePressed) {
    saveFrame("logo.tif");
  }
  smooth();


  background(R, G, B, 20); 
  R += incremento;
  if (R > maxcol)
    incremento = -.5;
  else if (R < mincol)
    incremento = random(1);
  B += incremento;
  if (B > maxcol)
    incremento = -1;
  else if (B < mincol)
    incremento = +5;
  G += incremento;
  if (G > maxcol)
    incremento = -1;
  else if (G < mincol)
    incremento = +10;


  p += random(-speed, speed);
  y += random(-speed, speed);
  p = constrain(p, 0, width);
  y = constrain(y, 0, height);

  fill(random(233), random(233), random(233), 200);
  lights();
  noStroke();
  translate(150, 150, -400);






  for (int i = 0; i < as. length; i++) {
    as[i] +=0.05;
   // float y = i * 0.14;
    //translate(random(500), mouseX, random(200));
   // fill(random(23), random(33), random(255), 100);

    noStroke();
    //translate(mouseX, mouseY, -1200);
translate(mouseX-12, mouseY-23, -1200);
 //translate(250, 250, 0);




  sphere(p-y);
  rotateZ(radians(frameCount*.200));


  rotate(angle);
  // float y = i * 0.94;
  translate(mouseX, mouseY, 0);
  sphere(100);

sphere(mouseX);
 sphere(mouseY/2);

  angle += .0009;
  }}
