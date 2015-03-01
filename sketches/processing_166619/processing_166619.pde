
ArrayList particles; 

void setup() { 
size(500,500); 
particles = new ArrayList(); 
smooth(); 
} 

void draw() { 

particles.add(new Particle()); 

background(mouseY,mouseX); 

for (int i = 0; i < particles.size(); i++ ) { 
Particle p = (Particle) particles.get(i); 
p.pao(); 
p.zhongli(); 
p.display(); 
} 

if (particles.size() > 100) { 
particles.remove(0); 
} 
} 
class Particle { 

float x; 
float y; 
float xspeed; 
float yspeed; 

Particle() { 
x = mouseX; 
y = mouseY; 
xspeed = random(-2,20); 
yspeed = random(-1,10); 
} 

void pao() { 
x = x + xspeed; 
y = y + yspeed; 
} 

void zhongli() { 
yspeed += 0.1; 
} 

void display() { 
stroke(0); 
fill(mouseX,mouseY,255); 
ellipse(x,y,20,20); 
} 
} 



