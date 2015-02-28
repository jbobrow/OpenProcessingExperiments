
int cx;
int cy;
float ang;  // -> se representan en radianes ejemplo: 360° = 2*PI o TWO_PI;  180° = PI;  90° = PI/2;

int r,g,b;

//...................................

void setup (){
  
  size(500,500);
  background(30,60,90);
  
  cx=width/2;
  cy=height/2;
  
  ang = 0;
  
}
  
//.................................... > El seno del angulo determina la posici[on en X y el coseno en Y

  void draw(){
    
  noStroke();
  fill(180,230,0,125);
  rect(0,0,width,height);
  
  float posY = 50*sin(cx*0.1);
  
  r=int(random(0,255));
  g=int(random(0,255));
  b=int(random(0,255));
    
  noStroke();
  fill(r,g,b);
  ellipse(cx,posY+cy,25,25);
  
  stroke(0,125);
  line(cx,posY+cy,400*sin(ang)+cx,400*cos(ang)+cy);
  
  ang=ang+TWO_PI/72;
  
  cx+=5;  // equivale a escribir cx= cx+5
  cx=cx%width;
  
  
  
  
  }

