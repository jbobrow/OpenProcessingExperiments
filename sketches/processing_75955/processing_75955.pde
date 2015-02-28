
Stripe[] stripes  =  new Stripe[10]; 
Stripe2[] stripes2  =  new Stripe2[10]; 

void setup() { 
size(400,400); 
// Initialize all " stripes " 
for (int i  =  0; i  <  stripes.length; i++) { 
stripes[i]  =  new Stripe(); 
stripes2[i]  =  new Stripe2(); 

} 

} 



void draw() { 
background(0); 
// Move and display all " stripes " 
for (int i  =  0; i  <  stripes.length; i++) { 
// Check if mouse is over the Stripe 
stripes[i].rollover(mouseX,mouseY); 
stripes[i].move(); 
stripes[i].display(); 

} 

for (int i  =  0; i  <  stripes.length; i++) { 
  stripes2[i].rollover(mouseX,mouseY); 
stripes2[i].move(); 
stripes2[i].display(); 
} 
  
  
} 



class Stripe { 
float x; // horizontal location of stripe 
float speed; // speed of stripe 
float w; // width of stripe 
boolean mouse; // state of stripe (mouse is over or not?) 
Stripe() { 
x  =  0; // All stripes start at 0 
speed  =  random(0.5,2); // All stripes have a random positive speed 
w  =  random(20,50); 
mouse  =  false; 
} 
// Draw stripe 
void display() { 
if (mouse) { 
fill(random(100,200),random(100,200),random(100,200),150); 
}   else { 
fill(255,30); 
} 
noStroke(); 
rect(x,0,w,height); 
} 
// Move stripe 
void move() { 
x+= speed; 
if (x  >  width +  20) x  =-20; 
} 

// Check if point is inside of Stripe 
void rollover(int mx, int my) { 
// Left edge is x, Right edge is x +  w 
if (mx>x && mx<x+w) { 
mouse  =  true; 
} else { 
mouse   = false; 
} 
} 
} 

class Stripe2 { 
float y; // horizontal location of stripe 
float speed; // speed of stripe 
float h; // width of stripe 
boolean mouse; // state of stripe (mouse is over or not?) 
Stripe2() { 
y  =  0; // All stripes start at 0 
speed  =  random(0.5,2); // All stripes have a random positive speed 
h  =  random(20,50); 
mouse  =  false; 
} 
// Draw stripe 
void display() { 
if (mouse) { 
fill(random(100,200),random(100,200),random(100,200),150); 
}   else { 
fill(255,30); 
} 
noStroke(); 
rect(0,y,width,h); 
} 
// Move stripe 
void move() { 
y+= speed; 
if (y  >  height +  20) y  =-20; 
} 

// Check if point is inside of Stripe 
void rollover(int mx, int my) { 
// Left edge is x, Right edge is x +  w 
if (my>y && my<y+h) { 
mouse  =  true; 
} else { 
mouse   = false; 
} 
} 
} 

