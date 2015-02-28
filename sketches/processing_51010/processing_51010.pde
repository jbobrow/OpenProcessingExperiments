
float courante,ciblee,vitesse;
 float k = 0.1;
 float d = 0.9;
 
void setup()  {
  size(200,200); 
  
}


void draw() {
 
if ( random(10) < 1 ) {
  ciblee = random(256);
}


 vitesse = d * (vitesse + k * (ciblee - courante));
 courante = courante + vitesse;
 
 background(constrain(courante,0,255));
 

}                                               
