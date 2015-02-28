
/**
 * Constrain. 
 * 
 * Move the mouse across the screen to move the circle. 
 * The program constrains the circle to its box. 
 */
 
float mx;
float my;
float easing = 0.05;
int radius = 24;
int edge = 100;
int inner = edge + radius;
PImage cup;
PImage back;
   
void setup() {
  size(800, 600);
  noStroke(); 
  //ellipseMode(RADIUS);
  imageMode(CORNER);
  back=loadImage("cupshop.jpg");
  cup = loadImage("cupcake2.png");
}

void draw() { 
  background(back);
 
  if (abs(mouseX - mx) > 0.1) {
    mx+= (mouseX - mx) * easing;
  }
  if (abs(mouseY - my) > 0.1) {
    my = my + (mouseY- my) * easing;
  }

 image(cup, mx, my,radius*5,radius*5);
  fill(255);  
 // ellipse(mx, my, radius, radius);
}


