
/* Creation and Computation
Chapter 1
Jessica Knox
September 20, 2011
this is the final sketch that I submitted for Assigment 2*/


boolean button = false; 

float rec1r;
float rec1g; 
float rec1b;

float rec2r;
float rec2g; 
float rec2b;  

float rec3r;
float rec3g;
float rec3b;

float rec4r; 
float rec4g;  
float rec4b;   
  
float cirCol;
  
//variables for colour of square in centre
float rec0r;
float rec0g;
float rec0b;

void setup() {
size(600,600);
smooth();
frameRate(10);

} 

void draw() {

//change the background colour depending on mouse location
if (mouseX < width/2 && mouseY < height/2) {
  background(80);
}else if (mouseX > width/2 && mouseY < height/2) {
  background(150); 
}else if (mouseX < width/2 && mouseY > height/2) {
  background(210); 
}else if (mouseX > width/2 && mouseY > height/2)
  background(255);   

if (mousePressed) {
  button = true; 
} else {
  button = false; 
}

if (button) {
  
//variables coordinates of shape locations
int centX = width/2;
int centY = height/2;

//variables for colour of each large rectangle

rec1r = 147;
rec1g = 147;
rec1b = 255;

rec2r = 233;
rec2g = 139; 
rec2b = 222;  

rec3r = 242;
rec3g = 188;
rec3b = 34;

rec4r = 33; 
rec4g = 243;  
rec4b = 208;   
  
cirCol = 190;
  
//variables for colour of square in centre
rec0r = 255;
rec0g = 0;
rec0b = 0;

stroke (255);
strokeWeight (4);

//these are the concentric diamonds on the outside

fill (rec1r, rec1g, rec1b);
quad (centX,0,width,centY,centX,height,0,centY);
  
fill (rec2r,rec2g,rec2b);
quad (centX,height/12,width-width/12,centY,centX,height-height/12,width/12,centY);

fill (rec3r,rec3g,rec3b);
quad (centX,height/6,width-width/6,centY,centX,height-height/6,width/6,centY);

fill (rec4r,rec4g,rec4b);
quad (centX,height/4,width-width/4,centY,centX,height-height/4,width/4,centY);

//this diamond had to be precisely measured to touch the circle in the centre

fill(255,0,0);
rectMode (CENTER);
rect(centX, centY, width/6,height/6);


//this is the circle in the centre
noStroke (); 
fill (190);
ellipseMode (CENTER);
ellipse (centX,centY,width/6,height/6);

//and now for those four weird shapes that appear near the centre circle
//the locations are measured to closest whole number from their precise location, then with a -1 or +1 for select points because the stroke was bleeding into the red diamond
stroke (255);
strokeWeight (4);
line (282,246,282,215);
line (246,282,215,282);
line (282,215,215,282);

line (318,246,318,215);
line (354,282,384,282);
line (318,215,384,282);

line (354,318,384,318);
line (318,353,318,384);
line (384,318,318,384);

line (282,353,282,384);
line (246,318,215,318);
line (282,384,215,318);

strokeWeight (0);

} else {
  
//  
//variables coordinates of shape locations

int centX = width/2;
int centY = height/2;

//variables for colour of each large rectangle
float rec1r = random(255);
float rec1g = random(255);
float rec1b = random(255);

float rec2r = 233;
float rec2g = 139; 
float rec2b = 222;  

float rec3r = 242;
float rec3g = 188;
float rec3b = 34;

float rec4r = 33; 
float rec4g = 243;  
float rec4b = 208;   
  
float cirCol = 190;
  
//variables for colour of square in centre
float rec0r = 255;
float rec0g = 0;
float rec0b = 0;

noStroke ();

//these are the concentric diamonds on the outside

fill (rec1r,rec1g,rec1b);
quad (centX,0,width,centY,centX,height,0,centY);
  
fill (233,139,222);
quad (centX,height/12,width-width/12,centY,centX,height-height/12,width/12,centY);

fill (242,188,34);
quad (centX,height/6,width-width/6,centY,centX,height-height/6,width/6,centY);

fill (33,243,208);
quad (centX,height/4,width-width/4,centY,centX,height-height/4,width/4,centY);

//this diamond had to be precisely measured to touch the circle in the centre

fill(255,0,0);
quad (300,229,370,300,300,370,229,300);



//this is the circle in the centre 
fill (190);
ellipseMode (CENTER);
ellipse (centX,centY,width/6,height/6);

//and now for those four weird shapes that appear near the centre circle
//the locations are measured to closest whole number from their precise location, then with a -1 or +1 for select points because the stroke was bleeding into the red diamond
stroke (255);
strokeWeight (4);
line (282,246,282,215);
line (246,282,215,282);
line (282,215,215,282);

line (318,246,318,215);
line (354,282,384,282);
line (318,215,384,282);

line (354,318,384,318);
line (318,353,318,384);
line (384,318,318,384);

line (282,353,282,384);
line (246,318,215,318);
line (282,384,215,318);

strokeWeight (0);


}

if (mousePressed){
button = !button;
}

}



