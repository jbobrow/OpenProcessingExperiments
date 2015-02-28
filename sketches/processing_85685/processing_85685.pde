
// Mondrian
void setup() {
  size(500, 400);
  background(255,255,255);

}
void draw() { 
strokeWeight(5);

// Horizontal Lines
line(0, 55, 500, 55); // line 1
line(0, 175, 500, 175);// line 2
line(0, 350, 500, 350); // line 3

//Vertical Lines
line(75, 400, 75, 0); //line 1
line(165, 400, 165, 0); // line 2
line(285, 400, 285, 0); // line 3
line(430, 400, 430, 0); // line 4

// Box red
fill(250,3,3); 
rect(75, 55, 90, 120);

// Box Yellow
fill(250, 226, 3); 
rect(75, 300, 90, 50);

// Box Blue
fill(3, 16, 250);
rect(285, 55, 145, 120);
}






