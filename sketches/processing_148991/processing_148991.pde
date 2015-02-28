
float raggio1 = 100;
float raggio2 = 200;
float raggio3 = 115;
float passoRad1 = PI/88;
float passoRad2 = PI/61;
float passoRad3 = PI/40;
void setup(){
background(0);
size(600,600);
stroke(255,255,255);
frameRate(60);
smooth();
 }
 
void draw(){
float c5x= 300;
float c5y= 400;
float c6x= 300;
float c6y= 300;
  float rad1 = frameCount*passoRad1;
  float  c1x   = c5x + cos(rad1)*raggio1;
  float  c1y  = c5y + sin(rad1)*raggio1;
  float rad2 = frameCount*passoRad2;
  float  c2x  = c6x + cos(rad2)*raggio2;
  float  c2y   = c6y + sin(rad2)*raggio2;
  float rad3 = frameCount*passoRad3;
  stroke(#C6991A);
  line(c2x,c2y,c1x,c2y);
  stroke(255,0,0,50);
  line(c1x,c1y,c2x,c2y);
  
  
}
  





