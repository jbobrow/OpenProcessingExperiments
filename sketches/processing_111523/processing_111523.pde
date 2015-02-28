
//Drawing a fishing net texture. I used a triangle shape with one point locked
// in the center of the sketch. Everytime you move the mouse the sides of the traingle 
// will draw taking the center into account. 
// The strokes colors are pulled from a palette of 5 colors, they draw in a random order. 
// If you press numbers "1","2", and "3" you can change de background color. 
// If you press "s" or "S" a screenshot will be saved. 
// if you want to erase the canvas press "Delete". 

// Color palette Array
color[] palette= {#C24366, #D9C099, #FFF8D8, #A8E0BA, #00ADA7}; 
// Random variable for color. 
float r;

//SETUP
void setup() {
  size(800, 600);
  background(0);
   
}

void draw() {
  
 }

// When you move the mouse the sketch will execute this code
void mouseMoved(){
  
  // Assigning value to variable
  r = random(1,5);
  // Shape with no Fill
  noFill();
  // StrokeWeight 1
  strokeWeight(1);
  // Stroke color random
  stroke(palette[int(r)]);
  // Drawing the shape. 
  triangle(width/2, height/2, pmouseX,pmouseY, mouseX,mouseY); 
}  

// Setup por changing backgroun color. 
void keyPressed(){
  // Change color to array color 4
  if (key == '1'){
   background(palette[int(4)]);
  }
  // Change color to array color 3
  if (key == '2'){
   background(palette[int(3)]);
  }
  // Change color to array color 2
  if (key == '3'){
   background(palette[int(2)]);
  }
}

// Setup for erasing canvas and saving screenshot.
void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background(0); 
  if (key == 's' || key == 'S') saveFrame("screenshot.png"); 

}
