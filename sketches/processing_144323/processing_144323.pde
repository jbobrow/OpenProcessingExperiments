
void setup() {
size(500,500);
}
void draw() {
  int m = millis();
   background((127.5*sin(PI*m/1000)+127.5),(127.5*sin(((PI*m/1000)-(2*PI/3)))+127.5),(127.5*sin(((PI*m/1000)-(PI*4/3)))+127.5));
noStroke();
fill(255,0,0,(127.5*sin(PI*m/1000)+127.5));
ellipse(125,125,(125*sin(PI*m/1000)+125),(125*sin(PI*m/1000)+125));

noStroke();
fill(0,255,0,(127.5*sin(((PI*m/1000)-(2*PI/3)))+127.5));
ellipse(250,250,(125*sin(((PI*m/1000)-(2*PI/3)))+125),(125*sin(((PI*m/1000)-(2*PI/3)))+125));

noStroke();
fill(0,0,255,(127.5*sin(((PI*m/1000)-(PI*4/3)))+127.5));
ellipse(375,375,(125*sin(((PI*m/1000)-(PI*4/3)))+125),(125*sin(((PI*m/1000)-(PI*4/3)))+125));
}
