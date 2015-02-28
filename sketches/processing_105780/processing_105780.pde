
// Tiles using arrays
// Changing colors on a mouse click

// Sultan



int x = 10; //Defining height of tiles
int y = 20; //Defining width of height
color[][] colors; // Creating variable color

void setup() {
  size(800, 800);
  noStroke();
  colors = new color[y][x]; //Defining color
  for(int i=0;i<y;i++) { 
    for(int waffles=0;waffles<x;waffles++) {
      
      
    }
  }
}
void draw() {
  background(255);
{
  for(int i=0;i<y;i++) {
    for(int waffles=0;waffles<y;waffles++) {  
      
     
      
      if(mousePressed == true) // Changing color of each tile
       fill(random(250),random(250), random(250));

      rect(i*(width/y), waffles*(height/x), 40, 40); // Defining each rectangle
     
     
      }
    }
  }
}
