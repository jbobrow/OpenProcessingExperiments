
//this is the variable
float r = 0;

void setup() {
  //this is what happens to the background. 
  size(400,400);
  background(10);
  smooth();
  noStroke();
   size(400,400);
  background(10);
  smooth();
  noStroke();

}

void draw() {
  //this is for the circles on the screen that I changed from the code I got. 
 fill(random(256), random(256), random(256) );
  rotate(r);
  float circle_size = random(5, 15);
  ellipse(100 + r, 10, circle_size, circle_size);
  r = r + 0.2;
  println(r);
  translate(width/2, height/2);
  fill(255);
  rotate(r);
//this is for the random shapes. I changed it so they would come from the sides. 
  ellipse(100 + r, 10, circle_size, circle_size);
  r = r + 0.2;
  println(r);
//this is for the shapes and how they float around on the screen. 
float r = 0;
float x = random(500);
  float y = random(500);
  float w = random(100);
  float h = random(100);
  fill(random(255), random(255), random(255), 10);
  rect(x, y, w, h);
  ellipse(x, y, w, h);
  triangle(random(500),random(500),random(500),random(500),random(500),random(500));
}
void keyPressed() {
  //this is to make the background different colours when you click the space bar. 
  if(key==' '){
    background(random(255), random(255), random(255));}
 }
