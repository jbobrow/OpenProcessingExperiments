
void setup(){
size(600,600,P3D);
smooth();
background(255);


}




void draw(){
camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 2, 0);
pushMatrix();
translate(300, 300);
frameRate(13);
background(255);
{

  

for (int i = 0; i <= 2000; i+=1) {
pushMatrix();
rotateZ(2*i);
rotateY(2+i);
//rotateX(2+i);
box(250+random (75),75+random (1),250+random (75));
fill(00,mouseX/5);
stroke(00,90);


popMatrix();

}}popMatrix();


  


}
