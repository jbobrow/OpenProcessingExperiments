
// Malevich dinamico
// alumno: Matteo Crinelli
 
float r;
float g;
float b; 
float a;

float diam;
float x;
float y;
float s; 
 
 
 void setup(){ 
  
size(504,700);  
background(255); 
smooth();  
noStroke();  
s = 300; 
 
 } 
 
void draw() {  
 
  r = random (2);  
  g = random(2);  
  b = random (2);  
  a = random(2);  
  diam = random(90, 160);  
  x = (100);  
  y = (110);  
  
  
   

  noStroke();  
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
   
  pushMatrix(); 
  if(s <= 700){ 
s = s + 0.3; 
} 
translate(70,s);  
rotate(PI/63);   
fill(r,20,0,a);  
rect(0,-45,17,170);  
popMatrix(); 
 
 
 
fill(#e8b009);  
quad(25,295,391,254,392,294,29,330);  
 
fill(#e8b009);  
quad(173,449,197,450,115,699,92,700); 
 
fill(#CB0A0A);  
quad(209,424,248,423,170,632,137,633); 
 
fill(#F2DADA);  
quad(261,441,316,437,258,603,202,602); 
 
fill(#CB0A0A);  
quad(316,656,447,581,451,610,328,676); 
 
fill(#e8b009);  
quad(384,658,488,606,490,623,382,676);  
 
fill(#131b8f);  
beginShape(); 
vertex(206, 132);  
vertex(202, 123);  
vertex(223, 117);  
vertex(222, 94);  
vertex(233, 94);  
vertex(236, 113);  
vertex(258, 104);  
vertex(262, 114);  
vertex(238, 124);  
vertex(324, 615);  
vertex(312, 624);  
vertex(226, 127);  
endShape(CLOSE); 
 
pushMatrix();
translate(270,105);  
rotate(PI/6.6);   
fill(#151313);  
rect(0,0,170,170);  
popMatrix(); 
 
} 
 
 
 


