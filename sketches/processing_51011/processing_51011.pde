
float rCourante,gCourante,bCourante;
float rCiblee,gCiblee,bCiblee;
float rVitesse,gVitesse,bVitesse;

 float k = 0.5;
 float d = 0.90;
 
void setup()  {
  size(400,400); 
  smooth();
}


void draw() {
 



 rVitesse = d * (rVitesse + k * (rCiblee - rCourante));
 rCourante = rCourante + rVitesse;
 gVitesse = d * (gVitesse + k * (gCiblee - gCourante));
 gCourante = gCourante + gVitesse;
 bVitesse = d * (bVitesse + k * (bCiblee - bCourante));
 bCourante = bCourante + bVitesse;
 
 background(rCourante,gCourante,bCourante );
 
}               

void mousePressed() {
 
  rCiblee = random(255);
  gCiblee = random(255);
  bCiblee = random(255);


}
