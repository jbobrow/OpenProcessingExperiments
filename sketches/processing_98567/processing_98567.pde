
int r;
int g;
int b;
int a;
int z;

float x; 
float y; 
float yspeed = 0; 
float xspeed = 0; 
float balldiameter = 0; 


void setup(){ 
size(500,500); 
background(0);

 

noStroke(); 
smooth();
} 

void draw(){ 

mousemouvement(); 
boundary(); 
Ball(); 
r = int(random(300));
g = int(random(500));
b = int(random(500));
a = int(random(50));
z = int(random(30));
} 

void mousemouvement(){ 
if(mousePressed==true){ 
x=mouseX; 
y=mouseY; 
yspeed = mouseY-pmouseY; 
xspeed = mouseX-pmouseX; 
//ellipse(pmouseX,pmouseY,mouseX,mouseY); 
} 
} 



void boundary() { 
if (y >= height) { 
y = height; 
yspeed = -yspeed/2; 
} 

if (x >= width ) { 
x = width;
xspeed = -xspeed/2; 
} 

} 

void Ball() { 

ellipse (x,y,z,z); 
fill(r,g,b,a);
yspeed = yspeed += 0.1; 
xspeed = xspeed/0.1; 
y = y + yspeed; 
x = x + xspeed; 
} 




