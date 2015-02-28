
float a = 100;
float b = 100;
int speed = 5;
int speedy = 2;

float seca = 200;
float secb = 200;
int secspeed = 3;
int secspeedy = 9;

void setup() {

  size(600,600);

  stroke(0);

}

void draw() {
  background(200);
  a = a + speed;
  b = b + speedy;
  ellipse(a,b,200,200);
  
  if (a > 500){
    speed= -5;}
    
  if (a < 100){
     speed = 5;}
     
  if (b > 500){
    speedy= -2;}
    
  if (b < 100){
    speedy = 2;}

  seca = seca + secspeed;
  secb = secb + secspeedy;
  ellipse(seca,secb,200,200);
  
  if (seca > 500){
    secspeed= -3;}
    
  if (seca < 100){
     secspeed = 3;}
     
  if (secb > 500){
    secspeedy= -9;}
    
  if (secb < 100){
    secspeedy = 9;}
  
}



