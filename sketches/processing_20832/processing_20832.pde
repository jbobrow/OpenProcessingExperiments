

float i; // variable for rotation (integer)

void setup() {
  size(250,250);}
 
void draw() {
  background(255);
  rotate(i);
  i -= 0.01; //increase rotation
  fill(176,232,176,200);// color of boxes
  rotate(i); 
  smooth(); //
  noStroke();
  rect(20, 40, 30, 100); //
  rect(50, 180, 40, 60);
  rect(30, 50, 20, 20);
  rect(50, 60, 50, 50);
  rect(100, 240, 60, 79);

  fill(29,193,4,200);
  rotate(i);
  smooth();
  noStroke();
  rect(20, 40, 30, 100);
  rect(50, 180, 40, 60);
  rect(30, 50, 20, 20);
  rect(50, 60, 50, 50);
  rect(100, 240, 60, 79);
  
  fill(49,134,53,150); // box color 
  rotate(i);
  smooth();
  noStroke();
  rect(20, 40, 30, 100);
  rect(50, 180, 40, 60);
  rect(30, 50, 20, 20);
  rect(50, 60, 50, 50);
  rect(100, 240, 60, 79);

 fill(44,77,46,150); // box color 
  rotate(i);
  smooth();
  noStroke();
  rect(20, 40, 30, 100);
  rect(50, 180, 40, 60);
  rect(30, 50, 20, 20);
  rect(50, 60, 50, 50);
  rect(100, 240, 60, 80);
}
 
void mousePressed(){
  background(0); // if mousepressed the background changes to black)
}




