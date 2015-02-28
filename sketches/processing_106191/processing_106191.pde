
//cos motion -> constant + cos(angle) * scalar. Sin motion is the same.
// Sin motion + cos motion = Circular motion
int constant = 250;
float angle = 0.05;
int scalar = 100;
float speed = 0.05;
 
void setup(){
size(500,500);
smooth();
}

void draw(){
background(0);
float x = constant + sin(angle) * scalar;
float y = constant + cos(angle) * scalar;
ellipse(x,y,50,50);
angle = angle + speed;
}


