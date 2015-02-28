
void setup() {
size(400, 400);
}
void draw() {
background(242); 
fill(#CFFFFF);
translate(width/2,height/2);
for (float i=0; i<360; i+=30){
pushMatrix();
rotate(radians(i));
line(0,0,150,0);
for (float a=0; a<360; a+=20){
pushMatrix();  
translate(150, 0);
popMatrix();                  
}
popMatrix();
}
strokeWeight(2);
ellipse(0, 0, 200, 200);
strokeWeight(1);
float radSec = 360 / 60 * second();
pushMatrix();
rotate(radians(radSec));
line(0, 0, 0, -95);
popMatrix();
strokeWeight(2);
float radMin = 360 / 60 * minute();
pushMatrix();
rotate(radians(radMin));
line(0, 0, 0, -90);
popMatrix();  
strokeWeight(4);
float radHour = 360 / 12 * hour();
pushMatrix();
rotate(radians(radHour));
line(0, 0, 0, -50);
popMatrix();
}
