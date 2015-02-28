
//Week 2 homework, z3421188
float r;
float g;
float b;

void setup() {
  size(800, 600);
  smooth();
  noCursor();
  shapeMode(CENTER); 
  frameRate(24);
}
   
void draw() {
  
//text
  fill(0, 102, 153, 51);
  text("Left click to fade background", 5, 15); 
  
//transparent bg to create "fade effect" and styling
  fill(0,15); 
  rect(0, 0, width, height);  
   
//random colours
  fill (random(255), random(255), random(255));


//shapes follows the mouse in a small spread
  beginShape(TRIANGLE_FAN);
   translate( mouseX, mouseY);
   translate (random(width/5), random(height/5));
    vertex(57.5, 50);
    vertex(57.5, 15); 
    vertex(92, 50); 
    vertex(57.5, 85); 
    vertex(22, 50); 
    vertex(57.5, 15); 
  endShape();
 }
 

//bg colour changed to create a fade effect
 void mouseClicked()
{
  r=random(255);
  g=random(255);
  b=random(255);
  background(r,g,b);
}


