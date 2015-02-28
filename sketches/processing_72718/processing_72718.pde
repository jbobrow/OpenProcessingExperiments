
void setup(){
  size(600,600);
  background(random(0,255));
}

float mx = 300;
float my = 300;

void draw(){
  smooth(); 
 
  float randomness = map(mouseX, 0,width, 0,1);
  randomness = constrain(randomness, 0,1); 
  
  float A = 0.7;
  float B = 1.0-A;
  mx = A*mx + B*mouseX;
  my = A*my + B*mouseY;
  
  float r = round(random(0,mouseX));
  float g = round(random(0,mouseX));
  float b = round(random(0,mouseX));
  
  fill(r,50+g,100+b);
 // fill(100*randomness,*randomness,200*randomness);
  ellipse(mx+randomness*random(-100,100),my+randomness*random(-100,100),20/randomness,20/randomness);
  

  
}
