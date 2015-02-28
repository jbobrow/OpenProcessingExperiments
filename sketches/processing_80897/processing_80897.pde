
float angle=0.0;
float angle2 = 10;
float offset = 30;
float scalar =30;
float incremento = 5;
float noiseval;
float xpos;
float an = 0.5;
float s =30;
float of = 60;
float inc = 0.5;
float seval;
float xpos1;
float gle = 0.0;
float x1=0;
float y1=0;
float x2=30;
float y2=40;
float x3=20;
float y3=30;
HLine h1;
HLine h2;

void setup () {
  size(1240, 820);
  background(0);
  frameRate(12);
  smooth();
  h1 = new HLine(30, 0, 5.0, 255, 255, 255, 50); 
  h2 = new HLine(40, 20, 5.2, 255, 255, 255, 50);
}

void draw() {
  angle += 0.1;
  noiseval+=0.5;
  xpos++;
  s+=0.09;
  an += inc;

  h1.update(); 
  h2.update(); 

  float valorSeno = sin(angle);
  float valorCoseno = cos(angle);
  int time=millis();

  for (int i=0; i <=250; i+=8) {     
    float r =map(valorSeno, -1, 1, 200, 255);   
    float g =map(valorSeno, -1, 1, 200, 255);
    float b =map(valorCoseno, -1, 1, i, 100);
    float o=map(valorCoseno, -1, 1, 90, 100);

    float x = offset + cos(angle2) *scalar;
    float y = offset + sin(angle2) * scalar;
    float y2 = offset + sin(angle2) *scalar;

    fill(r, g, b, o);
    noStroke();
    ellipse (-x+310, -y2+310, 30, 30);

    scalar+=0.05;
    scalar++;
    angle2 += incremento;

    seval += 0.1;
    xpos=xpos+30;
    float n=random(-30, 30);

    fill(0, g, b, 40);
    stroke(0, g, b, 10);
    gle += 0.1;

    triangle(x1+n+xpos, y1+820+seval, x2-n+xpos, y1+920+seval, x3*n+xpos, y3+random(-100, height/2));
  }
}


class HLine { 
  float xpos, ypos, speed; 
  float r,g,b,o;
  HLine (float x,float y, float s,float r, float g, float b, float o) {  
   xpos= x;
    ypos = y; 
    speed = s; 
    
  } 
  void update() { 
    ypos += speed; 
    if (ypos > height) { 
      ypos = 0.1; 
    } 

    stroke(0,30);
    line(0, ypos, width, ypos); }
}
