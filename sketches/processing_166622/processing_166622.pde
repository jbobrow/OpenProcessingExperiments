
int y = 0; 
PShape A;

void setup() { 
size(500,500); 
background(255); 
A = loadShape("Niu.svg");

frameRate(5); 
} 

void draw() { 
shape(A,CENTER,CENTER);

stroke(0); 

line(0,y,width,y); 

y += 30; 


if (y > height) { 
y = 0; 
} 
} 



