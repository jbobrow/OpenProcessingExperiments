
float angle = 0;   
float aVelocity = 0.05;
float aAcceleration = 0.01;
int x_position = 170;
int x_speed=5;
int y_position = 280;
int y_speed=5;

void setup() {
size(900,400);
background(#C4C5B5);
smooth();
  
}
 
void draw() {
float amplitude =30;
float x = amplitude * sin(angle);
float y = amplitude * cos(angle);
angle += aVelocity;
  
pushMatrix();  
translate(random(900),random(1));
rotate(angle);
fill(0,54,99);
ellipse(20,0,0.5,0.5);
ellipse(-20,0,0.5,0.5);
ellipse(5,0,20,8);
ellipse(-5,0,20,8);
popMatrix();

pushMatrix();  
translate(random(1),random(400));
rotate(angle);
ellipse(50,0,0.5,0.5);
ellipse(-50,0,0.5,0.5);
ellipse(30,0,20,8);
ellipse(-30,0,20,8);
popMatrix();

pushMatrix();  
translate(random(899,900),random(400));
rotate(angle);
ellipse(50,0,0.5,0.5);
ellipse(-50,0,0.5,0.5);
ellipse(30,0,20,8);
ellipse(-30,0,20,8);
popMatrix();

pushMatrix();
translate(random(900),random(399,400));
rotate(angle);
ellipse(20,0,0.5,0.5);
ellipse(-20,0,0.5,0.5);
ellipse(5,0,20,8);
ellipse(-5,0,20,8);
popMatrix();

//pushMatrix();  
//translate(110,70);
//rotate(angle);
//fill(#003663);
//ellipse(30,0,0.5,0.5);
//ellipse(-30,0,0.5,0.5);
//fill(#003663);
//ellipse(20,0,12,6);
//ellipse(-20,0,12,6);
//popMatrix();

pushMatrix();  

//translate(170,280);
x_position=x_position+x_speed;
y_position=y_position+y_speed;

translate(x_position,y_position);
if(x_position>850){
  x_speed=-5;
}
if(x_position<=0){
  x_speed=5;
}  
if(y_position>400){
  y_speed=-5;
}
if(y_position<=180){
  y_speed=5;
}  
rotate(angle);
ellipse(x,0,y-3,2);
popMatrix();
//line (170,140,170,280);

//pushMatrix();  
//translate(193,210);
//ellipse(0,y,8,8);
//popMatrix();

pushMatrix();  
translate(width/2,90);
rotate(-angle);
ellipse(y-10,0,y-10,3);
popMatrix();
aVelocity += aAcceleration;
angle += aVelocity;

}


