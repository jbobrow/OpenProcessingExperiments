
void setup(){
size(720, 480); 
smooth(); 
strokeWeight(2); 
background(160,168,126); 
ellipseMode(RADIUS);}

void draw(){
fill(mouseX,mouseY,0);
ellipse(mouseX,mouseY,50,50);

// Neck 
fill(255);
stroke(255); 
triangle(276,257,266,162,286,162);

//arms
line(276,257,370,300);
line(276,257,350,250);
ellipse(370,300,5,5);
ellipse(350,250,5,5);

// Body 
noStroke(); 
fill(102);  
fill(255);
rect(270,257,10,100);
rect(255,257,10,100);
fill(200);
ellipse(240,274,60,60);
fill(0);
ellipse(268, 366, 15, 15); 
//rect(219, 257, 90, 120); 
//fill(102); 
//rect(219, 274, 90, 6);

//hat
fill(1);
arc(280,120,20,20,3.14,5.97);

// Head 
fill(255); 
ellipse(276, 155, 45, 45);
fill(0); 
ellipse(288, 150, 14, 14); 
fill(0); 
ellipse(288, 150, 3, 3); 
fill(153); 
ellipse(263, 148, 5, 5); 
ellipse(296, 130, 4, 4); 
ellipse(305, 162, 3, 3);}



