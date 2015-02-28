
float angle = 0.0;
float scalar = 4; //controls beginning radius of each spiral
float speed = .3; //This controls how the ellipses move out from each spiral center in the 1st part of program

void setup() {
  size(400, 400);
  fill(0);
  smooth();
  background(200);
}
  
void draw() {
  if(millis() < 2250){ //the spirals continue for 2.25 seconds
  spiral(200, 200);
  spiral(100, 100);
  spiral(300, 300);
  spiral(300, 100);
  spiral(100, 300); //the values in the parentheses control the coordinates of the spirals
}
 if (keyPressed== true)
  {
    if (key == 's')
    {
      saveFrame("spiral4.jpeg"); //saves the image as a jpeg
  }
  }
}
void spiral(int i, int z){
  float t = millis() / 950; //changes the millis data value close to what it is in seconds
  float x = i + cos(angle) * scalar; //creates the spiral shape--the variable "i" affects x-coordinate
  float y = z + sin(angle) * scalar; //does the same thing, except the variable "z" affects y-coordinate
  float h = 14 - (t+3); //size of the ellipses are slightly decreasing the longer the program runs
  float w = 14 - (t+3); // same as above
  ellipse(x, y, h, w);
  angle += speed;
  scalar += speed;
}

void mousePressed(){
  fill(255);
  speed = .1; //This change can only happen if a person clicks in the time the program runs
}

void mouseReleased(){ 
  float r = random(130, 140);
  float v = random(100, 130);
  fill(r, v); //changes the color--added transparency to have smooth transition--again based on person's timing
}
    

