
float r; 
float g; 
float b; 
float random;
float diam; 
float x; 
float y; 
float flamerate;
float xPos;


void setup() { 
size(255,255); 
background(255); 
//smooth(); 
xPos=0;
} 

void draw() { 

xPos+=1;
r = mouseX+random(50); 
g = mouseY+random(50); 
b = xPos;   
x = mouseX+random(30); 
y = mouseY+random(30);


noStroke(); 
fill(r,g,b,255); 
ellipse(x,y,5,5); 
} 



