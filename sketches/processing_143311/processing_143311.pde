
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Sunhyun
// ID: 201420067

float angle; 

void setup() 
{ 
size(600,600); 
} 

void draw() 
{ 
background(0); 
angle += 0.007;   
strokeWeight(25); 
stroke(0); 
fill(255); 

translate(width/4,height/4);

for (int i=0; i<100; i++){ 
  
rotate(angle); 
scale(0.89);
rectMode(CENTER); 
ellipse(10,30,950,950);

translate(width/4,height/4);

rotate(angle); 
scale(0.90);
rectMode(CENTER); 
rect(0,0,850,850);
}  
}
