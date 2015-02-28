
//Levi Mousaw; Drwing Program
float r;
float g;
float b;
float a;

float diam;
float x;
float y;
float ellSize;
int counter = 0; // Dont draw until the canvas is clicked
 

void setup() {
  size(1000,800);
  smooth();
  background(255);
  noStroke();
  frameRate (10);
}

void draw() {
  if (mousePressed){
  r= random(255);
  g= random(255);
  b= random(255);
  a= random(255);
  diam=random(75);
  x=random(width);
  y=random(height);
  }
  //ellipse values

  noStroke();
  fill(r,g,b,a);
  ellipse(mouseX,mouseY,ellSize,ellSize);//
  ellSize++;//oncebigger than 100 set it back to zero,loop
  if(ellSize>95){
    ellSize = 0;
    
  println(mouseX + " : " + mouseY);
    if (mousePressed){ // Changes color of bubbles
  background(255);
    }
 
  }
  //ellipse(mouseX,mouseY,diam,diam);

  
  // If the mouse is on the right side of the screen is equivalent to 
  // "if mouseX is greater than width divided by 2."
  if(mouseX > width/2) {
    r = r + 5; 
  } else {
    r = r - 5;
  }

  // If r is greater than 255, set it back to 255.  
  // If r is less than 0, set it back to 0.
  if (r > 255) {
    r = 255; 
  } else if (r < 0) {
    r = 0; 
  }

}







