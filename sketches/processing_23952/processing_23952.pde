
class JitterBug{

 float x;

 float y;

 float diameter;

 float speed = 1.5;

 color c;

 

JitterBug(float tempX, float tempY, float temDiameter, color tempC){

 x = tempX;

 y = tempY;

 diameter = temDiameter;

 c = tempC;

}

 

void move(){

 x += random(-speed, speed);

 y += random(-speed, speed);

}

 

void display(){

 noStroke();

 fill(c);

 ellipse(x, y, diameter, diameter);

 

}

}

