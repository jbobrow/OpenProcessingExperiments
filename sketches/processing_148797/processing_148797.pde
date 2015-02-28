
float raggio1 = 250;
float raggio2 = 180;
float raggio3 = 110;
float passoRad1 = PI/88;
float passoRad2 = PI/61;
float passoRad3 = PI/40;
void setup(){
background(0);
size(600,600);
stroke(255,0,0,50);
frameRate(60);
smooth();
 }

void draw(){
float c0x= 300;
float c0y= 300;
  float rad1 = frameCount*passoRad1;
  float  c1x   = c0x + cos(rad1)*raggio1;
  float  c1y  = c0y + sin(rad1)*raggio1;
  float rad2 = frameCount*passoRad2;
  float  c2x  = c1x + cos(rad2)*raggio2;
  float  c2y   = c1y + sin(rad2)*raggio2;
  float rad3 = frameCount*passoRad3;
  float  c3x  = c2x + cos(rad3)*raggio3;
  float  c3y   = c2y + sin(rad3)*raggio3;
float rosso = c1x/4;
float verde = c1y/4;
float blu = 255-c2x/2;
stroke(rosso, verde, blu, 50);
  noFill();
  ellipse(300,300,c3x,c3y);
  if(mousePressed){
    background(0);
  }
}

