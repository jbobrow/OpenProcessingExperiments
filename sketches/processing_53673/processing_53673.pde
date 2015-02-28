
//Kim Sipkens 
//PS2 Q1

//lerpColor is set up: (c1, c2, amt)
//c1: add FROM this color, starting point
//c2: add TO this color, ending color
//amt: must be between 0.0 and 1.0, float

void setup () {
size (400,400);
}

color from = color ( 255, 0, 0); //starting color 
color to = color ( 0, 0, 255); // ending color

void draw () {
  //the following code is repeating a line
 //changing the color gradually starting at C1 ending at C2 
 for ( int i = 0; i < width; i++) {
   color interA = lerpColor(from, to, (float)i/width);
   stroke(interA);
   line(i,0,i,height);
 }
}      
