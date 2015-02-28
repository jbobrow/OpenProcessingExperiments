
//cos motion -> constant + cos(angle) * scalar
int constant = 250;
float angle = 0.05;
int scalar = 100;
float speed = 0.05;
 
void setup(){
size(500,500);
smooth();
}

void draw(){
float x = constant + cos(angle) * scalar;
float y = 50;
ellipse(x,y,50,50);
angle = angle + speed;
}


