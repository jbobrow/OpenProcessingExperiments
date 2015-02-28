
float angle; 
void setup() 
{
size(600,600,P3D);
lights( );

}





void draw() 
{
  smooth();
  background(230,20);
    rotate(-angle);
    angle -= PI/1000;
  loadPixels();  
// Loop through every pixel
for (int i = 0; i < pixels.length; i++) {
  // Pick a random number, 0 to 255
  float rand = random(255);
  // Create a grayscale color based on random number
  color c = color(rand);
  // Set pixel at that location to random color
  pixels[i] = c;
}
// When we are finished dealing with pixels
updatePixels(); 

  stroke(255);
  fill (random(10,50),0,random(0,50),200);
translate(300, 300, 0);
rotateY(100.85);
rotateX(10.85);
  rotate(millis() * 0.001 * TWO_PI / 10); 
box(190);

noStroke();
  fill (200,200,random(0,50),180);

 rotate(millis() * 0.001 * TWO_PI / 8); 
sphere(80);

pushMatrix();
translate (180,180);
  rotate(-angle);
sphere(80);
  popMatrix();



beginShape(POLYGON); 

for (int i=0; i<0; i++) {

sphere(i+1);

} 

}

