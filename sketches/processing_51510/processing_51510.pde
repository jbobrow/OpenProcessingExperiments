

float m = 3; //mass
float b = .4; //fluid resistance constant
float g = 9.8; //acceleration due to gravity
float a = 0; //initial acceleration value
float v = 100; // initial y velocity (downwards is positive)
float y = 0; //initial y-position
float k = 1.5; //spring constant

int oldY = 0;
float dt = 0.05; //time-step - DO NOT CHANGE!
void setup(){
  
size(400,400);
background(0);
smooth();

}

void draw(){
 
 int vy = mouseY - oldY;
  if(mousePressed){
    y = mouseY;
    v = vy;
  }
background(0);
a = (g - (b/m)*v-(k/m)*(y-200));
v = v + a*dt;
y = y + v*dt;
fill(200,110,59);
ellipse(200,y,40,40);
oldY = mouseY;  
}
                
