
float x = 0; 
float z = 0;

void setup(){
size(600,600); 
fill(255); 
background(255);
noStroke(); 
} 

void draw (){ 
fill(0);
ellipse(300, 300, 20, 20);
translate(300,300); 
fill(0, 0, frameCount/2.5); 
rotate(x); 
float y = random(10,10);
ellipse(0 + x,-5,z,z); 

x = x + 0.8; 
z = z+0.7;
} 

