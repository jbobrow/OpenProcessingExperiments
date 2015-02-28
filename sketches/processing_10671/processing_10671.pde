
/* Written as exercise by Kelvin Javier Rojas
     Original concept by A. Noll Titled:
     "ninety parallel sinusoids with linearly
     increasing period"
*/
void setup(){
 size(600, 600);
 background(255);
 smooth();
}

void draw(){
  background(0);
  translate(0,40);
  for(int i = 0; i<90; i++){
   stroke(random(0,255),random(0,255),random(0,255));   
   drawSin(-30,.0035,i*5.5);
 }
}


void drawSin(float a, float linearCoEff, float c ){
  float py;
  float t = 1;
  for (int px = 0; px<width; px++){
    // calc py
    py = a*sin( radians( ((2*PI)/t )* px ) ) + c;
    // draw point
    point(px,py);
    t+=linearCoEff;  
  }
}




