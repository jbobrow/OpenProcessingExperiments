
// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Walker w;

void setup() {
  size(400,400);
  frameRate(12);
 background(255);
 
  // Create a walker object
  w = new Walker();

}

void draw() {
 
  // Run the walker object
  w.step();
  w.render();
}



class Walker {
  float x, y;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void render() {
    stroke(0);
    fill(175);
    rectMode(CENTER);
    rect(x, y, 40, 40);
  }

void setup() { 
int choice = random(4); 

if (choice == 1) { 
    x++; 
   }
   else if (choice ==2) { 
   x--; 
   } 
   else if (choice ==3) { 
   y++ 
   }
   else if choice ==4) { 
   y--; 
   }
   
   constrint ( choice,  
 
