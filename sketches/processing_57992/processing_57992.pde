
// Using an Array to store our variables.
 

 
float x[] = new float[50]; // this creates an array of 15 floats, more than we had!
int posx;
int posy;
color c;
 
void setup() {
  size(500, 500);
  fill(0, 100, 255, 100);
  smooth();
    mouseX=2000;
  mouseY=2000;
   
  // "i" will count from 0 to 50, allowing us to access each individual
  // variable in our array using a single loop!
  for (int i=0; i < 50; i++) {
    x[i] = random(width);
  }
}
 
void draw() {
  translate (mouseX, mouseY);
  fill(0);
  if (mousePressed)
  {
    c=color(random(255),random(255),random(255));
    fill(c);
  }
  background(255);
  float dia;
 
  for (int i=0; i < 50; i++) {
    // we can use a similar loop here to draw the ellipses
    // using each variable in the array
    dia = dist(x[i], 150, mouseX, mouseY);

        ellipse(50, 150, dia, dia);
        ellipse(0, 100, 50, 50);
        ellipse(0, 100, 30, 30);
        ellipse(75, 100, 50, 50);
        ellipse(75, 100, 30, 30);



   

  }
}
//http://www.openprocessing.org/sketch/22180



