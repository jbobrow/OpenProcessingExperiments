
float x = 300;
float y = 300;
float change = 1;
float geschwindigkeit = 1.10;
float a = 0;
float b = 0;
float c = 0;

   
void setup() {
  size(600, 600);
  smooth();
  background(10,10,30);


}
 
 
void draw() {
  a = random (255);
  b = random (255);
  c = random (255);



  y = y*geschwindigkeit;
 
   
  if ((y >= height) || (y <= 3)) {
    geschwindigkeit=1/geschwindigkeit;
  }
   
  if ((x >= width) || (x <= 6)) {
    change =-change; 
  }
   
  noStroke();
  fill(a,b,c);
  ellipse(x, y, 100,20);
 
}
 
 


