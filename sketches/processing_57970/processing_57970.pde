
// Created by Jackie Haynes
// ARCH 2503 Digital Media, Department of Architecture, Cornell AAP
// CASE STUDY HOUSE #22

//Declare Image Variable
PImage img;
float c,d;
void setup () { 
//Size
size (450,450); 
background (255); 

//Image 
img = loadImage( "image.png" ); 
c=42;
d=42;
img.resize(340, 298);
image(img, 0, 0);
}

void draw () {
  
//Variables  
float x = (map(mouseX, 0, width, 10, 100));
float y = (map(mouseY, 0, height, 10, 100));  
float a = x;
float b = y;

//Fade
fill(255,50);
rect(0,0,width,height);

//Grid 1 (non-moving)
strokeWeight (0.25);
for (int i = 42; i <= 450; i += 42){
line(i, 0, i, 450);
}
for (int i = 42; i <= 450; i += 42){
line(0, i, 450, i);
}

//Grid 2 (moving)  
strokeWeight (2);
for (float i = x; i < width; i+= x){
      line (i, 0, i, height); 
} 
for (float i = y; i < width; i+= y){
    line (0, i, width, i);
}
    
//Building
strokeWeight (2.5); 
fill (x,y,105); 
rect (a,b,a*2,b*2); 
fill (x,y,155); 
rect (a*3,b,a*2,b*2); 
fill (x,y,205); 
rect (a*5,b,a*2,b*2);
 
fill (x,y,255);
rect (a*7,b,a*2,b*2); 
fill (x,y,205); 
rect (a*7,b*3,a*2,b*2);
fill (x,y,155);
rect (a*7,b*5,a*2,b*2);
fill (x,y,105);
rect (a*7,b*7,a*2,b);
  
fill (x,y,55);
strokeWeight (1.5);
rect (a*3,b*3,a*4,b*4);

strokeWeight (6);
strokeCap (PROJECT);
line (a,b,a*9,b);
strokeCap (SQUARE);
line (a,b,a,b*3);
line (a*3,b,a*3,b*3);
line (a*5,b,a*5,b*3);
line (a*9,b,a*9,b*3);
line (a*7,b,a*7,b*3);

//Image Translation
translate (c,d);
  image(img,0,0); 
} 


