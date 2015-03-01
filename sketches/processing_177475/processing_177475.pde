
// Wirrwar
// 03.12.2014

/*  Schreibe ein Programm, das Linien zeichnet, die an der aktuellen Mausposition beginnen und an einem zufaelligen Punkt enden. Ihre Farbe sollen GrÃ�Â¼n- und BlautÃ�Â¶ne sein. Der Anteil der roten Farbe ist dementsprechend Null.
Aendere dein Programm nun so, dass auch der Startpunkt der Linie zufaellig ist.
*/

float z=400; 
float x=400; 
float y=400; 
boolean paused = false; 
void setup(){ 
  size (800,800); 
  background (255); 
  smooth(); 
  }
void draw() {  
      stroke ((0),random(255),random(255),random(255));//fill with random colour and opacity 
      line (pmouseX,pmouseY,x,y);// draw lines starting at mouse position and shooting out at random positions 
} 


