
float angulo = 0.0;
  
void setup(){
size (800,600);
// background (7,31,36);
smooth ();
}
 
void draw(){
fill(0, 8);
rect (0 ,0, width, height);


angulo = angulo + 0.9;

strokeWeight (2);
stroke(random(200,255),random(200,255),200);
//rotate (angulo);
     
pushMatrix();
fill(255);
translate(400, 300);
rotate(angulo);
line(0, 50, 100, random(100,250));
popMatrix();
  
pushMatrix();
fill(255);
translate(400, 300);
rotate(angulo);
line(0, 250, 100, random(200,250));
popMatrix();
}  

