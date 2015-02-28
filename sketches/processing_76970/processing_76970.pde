
float angle = 10;
float offset = 30;
float off = 80;
float scalar =30;
float incremento = 5;
float noiseval;
float xpos;
float an = 0.5;
float of = 60;
float s =30;
float inc = 0.5;


void setup() {
  size (400, 400);
  noiseval=1;
  xpos = 20; 

}
void draw () {

stroke(255,0,0);
fill (0);
 
noiseval+=0.5;
xpos++;

ellipse(xpos, sin(noiseval)*400+400, noise(noiseval)*5, noise(noiseval)*5);


  float x1 = of + cos(an) *s;
  float y1 = of + sin(an) * s;
  
 ellipse (x1+130, y1+130, 20,20);
 
 
 s+=0.09;
 an += inc;
 
 fill (0);
 float x = offset + cos(angle) *scalar;
 float y = offset + sin(angle) * scalar;
 float y2 = offset + sin(angle) *scalar;
 
  
 stroke(100,50,50);


 ellipse (x+160, y2+160, 20,20);
 ellipse (-x+210, -y2+210, 20,20);
 
 
 scalar+=0.05;
 scalar++;
 angle += incremento;
}
