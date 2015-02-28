
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: LEE Daeun 
 // ID: 201420095
 
float x = 0; 
float z = 0;

void setup(){
size(600,600); 
background(0); 
fill(255); 
noStroke(); 
} 

void draw (){ 


translate(300,300); 
fill(random(200),random(200),random(200)); 
rotate(x); 
float y = random(10,10);
ellipse(90 + x,50,z,z); 


x = x + 1; 
z = z+0.7;

} 

