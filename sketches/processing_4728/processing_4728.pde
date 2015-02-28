
//Yoni Niv simple stuff with basic shapes, colors and such + smoke
void setup () {
size (300, 300); 

}
int value = 0;

float a = 0.5;
float b = 0.75;
float c = a+b; 

void draw (){ 
background (50, 70, 90); 
smooth (); 
rectMode (CENTER); 
fill (120, 120, 90, 200); 
rect (150, 240, 100, 140); 
stroke (10); //What the fuck? what does it do? 
fill (127, 70, 70, 230); 
triangle (80, 180, 150, 130, 220,180); 
fill (220); 
rect (170, 210, 30, 30); 
 
fill (255); 
noStroke (); 
ellipse (30, 14, 3,3); 
ellipse (55, 60, 2, 2); 
ellipse (150, 52, 2, 2);
ellipse (230, 16, 3,3); 
ellipse (275, 56, 2, 2); 
ellipse (190, 48, 2, 2);
stroke (5); 
fill (120, 120, 90); 
quad (165, 150, 165, 110, 200, 110, 200, 175); 
{
fill (value); 
rect (170, 210, 30, 30); 
fill (0); 
line (155, 210, 185, 210); 
line (170, 195, 170, 225);
}
}
void mouseClicked() {
  if (value==0) {
    value = 255; 
  } else { 
    value = 0; 
  }
}

//void loop(){
  





