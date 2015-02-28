
int y = 0;
int direction = 1;



void setup () {
  size(500,500);
 smooth();
 colorMode(HSB);
}

int col = 0;
void draw() {
  background(col,255,255);


fill(178,160,160);
noStroke();
ellipse(250,210,250,250); //head

//color white = color(252,252,255, 190);

fill(178,160,160);
triangle(146, 160, 158, 50, 202, 160); //ears

fill(178,160,160);
triangle(300, 160, 332, 50, 356, 160); //ears

fill(178,160,160);
noStroke();
rect(225, 320, 60, 90); //body

fill(8,0,0);
ellipse(215,150,65,65); //eye


fill(8,0,0);
ellipse(285,150,20,20); // Right eye


 //eye
int x = mouseX; // if the mouse is one the right side of the screen then draw..
 if ( x > 250) {
   fill(55,24,24);
     ellipse(215,150,50,50);
 }
 
 if (x <120) { // if the mouse is on the left side of the screen then draw..
  fill(237,159,176,100);
ellipse(215,150,30,30); //eye
 }



fill(8,0,0);
arc(255, 260, 50, y, 0, PI); //mouth

 y= y + direction; //adds  another y value to the previous
 /*  if (test) {
  (do something)*/
 y = y + direction;
 if (( y> 150) || (y<0) ) { // y is greater than 150 OR y is less than 0 
 direction = direction *-1; // multiply by -1
  
 }  


stroke(126);
strokeWeight(4);
line(225,360,80,90); //arms

stroke(126);
strokeWeight(4);
line(285,360,450,90); //arms

fill(178,160,160);
noStroke();
arc(225, 400, 50, 50, 0, PI); //feet

fill(178,160,160);
noStroke();
arc(285, 400, 50, 50, 0, PI); //feet



}

void mousePressed(){
col+=20;
col%=255;
println(col); //prints the numerical change in colour
}

// the code to change the background colour was sourced from 
//http://forum.processing.org/topic/color-change-background-with-click







