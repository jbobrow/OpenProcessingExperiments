
//Danny Nguyen, ARCH1391, Module 2:Metaphor: "Sydney is like a swarm of bees" 
//Images used in this code, were extensively edited by Danny Nguyen. 
//Original Images used are <http://www.le.ac.uk/engassoc/images/transition.jpg>

PImage a; 
PImage b; 
PImage c; 
PImage d; 
PImage e; 
PImage f; 
PImage g; 
float x, y;  
float size = 20;  
 
void setup() { 
size(400, 600, P3D); 
a = loadImage("walk_01.png");  
b = loadImage("walk_02.png"); 
c = loadImage("walk_03.png"); 
d = loadImage("walk_04.png"); 
e = loadImage("back.png");     
f = loadImage("cloud_01.png"); 
g = loadImage("cloud_02.png"); 
 
  noStroke();  
  frameRate(15); 
} 
 
void draw() { 
background(255); 
image(e, 0, 0); 
 
  x = x + 8;  
    
  if (x > width + size) {  
    x = -size;  
  }   
   
translate(x, height/95-size/2);  
fill(255);  
image(f, 0, 120); 
 
translate(x, height/95-size/2);  
fill(255);  
image(g, 0, 200);   
   
translate(x, height/95-size/2);  
fill(255);  
image(a, 0, 400); 
 
translate(x, height/95-size/1);  
fill(255);  
image(b, 10, 400); 
 
translate(x, height/95-size/2);  
fill(255);  
image(c, 0, 380); 
 
translate(x, height/95-size/2);  
fill(255);  
image(d, 40, 440); 
 
translate(x, height/95-size/2);  
fill(255);  
image(a, 0, 390); 
 
translate(x, height/95-size/2);  
fill(255);  
image(c, 0, 370); 
 
translate(x, height/95-size/2);  
fill(255);  
image(d, 40, 440); 
} 


