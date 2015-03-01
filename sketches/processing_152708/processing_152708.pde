
float s = 0,fase=0;
float n = 0;
float r = 0;
void setup(){
  size(300,300);
  frameRate(400);
  background(255);
  
}
void draw(){
  background(255);
  translate(150,150);
    rotate(s);
    s += 0.01;
 for (float ojo= 0; ojo<=6*PI; ojo+=0.05) {
      r=6*ojo;
      fill(0);
     ellipse( cos(n) * r, + sin(n) * r,5,5);
  n = n + 0.05;
  r = r + 0.1*fase;
}
fase=fase+1;
}
