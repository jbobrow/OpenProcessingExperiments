
void setup() {
size( 1000, 720);
smooth(); 
float stars = 5;
float starsNumber = calculateStars (stars);
println (starsNumber);
}
float calculateStars (float w) {
  float newNumber = w *1;
  return newNumber;
}  
void draw() {
background( 1,11,64);
for (int x=35; x < width + 70; x += 70)
{
translate(mouseX, mouseY);
fill(255,243,42);
  stroke(255);
  strokeWeight(2);
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);;
}
}

void stars( int x, int y) {
pushMatrix();
translate( x, y);
stroke( 0);
strokeWeight( 70);
line( 0, - 35,  0, -65);
noStroke();
float d = random (20, 100); 
fill( 255); 
ellipse( - 17.5, -65, 35, 35); 


ellipse( 17.5, - 65, 35, 35); 
arc (0, -65, 70, 70, 0, PI);
fill( 0); 
ellipse( - 14, - 65, 8, 8); 
ellipse(14, -65,8,8);
quad( 0, - 58, 4, - 51, 0, -44, -4, -51);
popMatrix(); 
}






