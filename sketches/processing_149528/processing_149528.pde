
float R=125; 


float centerR=125; 


float a=PI/2; 


float a1=PI; 


float a2=3*PI/2; 


float pathR=125; 


float pathG=125; 


float G=125; 


float centerG=125; 


float pathB=125; 


float B=125; 


float centerB=125; 

void setup() {
  
size(800, 800);
}

void draw() {
beginShape();
//face
noStroke();
fill(0, 26, 51);
ellipse(400, 400, 500, 400);
//ears
ellipse(250, 200, 100, 100);
ellipse(550, 200, 100, 100);
fill (255);
ellipse(400, 400, 150, 130);
fill (pathR,pathG,pathB);
pathR=centerR+R*sin(a); 
a=a+.03; 
pathG=centerG+G*sin(a1); 
a1=a1+.03; 
pathB=centerB+B*sin(a2); 
a2=a2+.03; 
ellipse(400, 400, 50, 50); 
fill(0, 26, 51);
ellipse(300, 600, 50, 100);
ellipse(500, 600, 50, 100);
}



