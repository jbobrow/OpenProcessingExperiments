
PImage img; //image variable
int x; //x variable of bezier
int y; //y variable of bezier

void setup() {
  size (450, 300);
  smooth();
  // glass installment at the Bellagio hotel in Las Vegas
  img = loadImage("chihuly.jpg"); 
  background(img);
  }

void draw() {                                       
  int y = int (floor(random(100)));  
  int a = int(random(0,img.width));    // take a random x coordinate from img
  int b = int(random(0,img.height));   // take a random y coordinate from img
  // use the random coordinate to get a color from img
  color myColor = img.get(a,b);      
  
  strokeWeight(a/100);
  stroke(myColor);
  noFill();
  bezier (x, y, 0, 0, 450, 300, x, height-y);
  x++;
}
void mousePressed() { //click to reset image
  background(img);
  x=0;
}




