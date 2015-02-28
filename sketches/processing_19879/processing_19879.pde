
void setup() {
  size(600, 600);
  background(000);
  smooth();
}

//int xpos = 0;


void draw() {
println(mouseX + " " + mouseY);
right();
bottom();
//save("skecth.jpg");

//top();
//time();


}

void mousedPressed() {


  
background(000);

}

/*void top() {
  
fill(#0A0303);
//stroke(10);
//rect( mouseX, mouseY, 20, 20);
ellipse( mouseX, mouseY, 25, 20);  
}
*/
void bottom() {
noStroke();
fill(mouseX, 100, mouseY);
rect( mouseX-10, mouseY, mouseX, 20); 
 
}

void right() {
noStroke();
fill(mouseX, 200, mouseY);
rect( mouseX-10, mouseY, mouseX, 600); 
 
}
/* This is in relation to top part if so... still to fix???
void left() {
noStroke();
fill(mouseX, 200, mouseY);
rect( mouseX, mouseY , 20, mouseY); 
}
*/

/* Just to hide (0,0) "problem" by adding a visual timing..ahahha!!!
void time() {
xpos++;
ellipse( xpos, 0, 20, 20);
  
}*/




