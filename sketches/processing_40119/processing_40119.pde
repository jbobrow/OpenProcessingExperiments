
void setup() {
  size(400, 400);
  background(255);
  smooth();
  noStroke();
}

void draw() {
}
void mousePressed() { //changes the color of yellow of the faces
  background(255);
  yellow();
  for (int l=40;l<width; l+=80) {
    for (int h=40;h<height;h+=80) {


      smile(l, h);
    }
  }
}




// this is the helper function I created to fill the faces with random shades yellow
 void yellow(){
   fill(random(240,255),random(240,247), random(10,100));
 } 
 
 //this function creates the smiles that are repeated across the screen.
 
void smile(float x, float y) {
  pushMatrix();
  //rotate(radians (random(-10, 6)));
  translate(x, y);
  noStroke();
  ellipse(0, 0, 75, 75);
  strokeWeight(2);
  stroke(0);
  line(0-10, 0-10, 0-10, 0);
  line(0+10, 0-10, 0+10, 0);
  ellipse(0, 0+20, 10, 10);

  popMatrix();
  
}
 


