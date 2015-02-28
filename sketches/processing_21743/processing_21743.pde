
/**
 * shows how to set a specific easing (character of movment)
 * list of all easing styles below:
 *
 * Ani.LINEAR
 * Ani.QUAD_IN
 * Ani.QUAD_OUT
 * Ani.QUAD_IN_OUT
 * Ani.CUBIC_IN
 * Ani.CUBIC_IN_OUT
 * Ani.CUBIC_OUT
 * Ani.QUART_IN
 * Ani.QUART_OUT
 * Ani.QUART_IN_OUT
 * Ani.QUINT_IN
 * Ani.QUINT_OUT
 * Ani.QUINT_IN_OUT
 * Ani.SINE_IN
 * Ani.SINE_OUT
 * Ani.SINE_IN_OUT
 * Ani.CIRC_IN
 * Ani.CIRC_OUT
 * Ani.CIRC_IN_OUT
 * Ani.EXPO_IN
 * Ani.EXPO_OUT
 * Ani.EXPO_IN_OUT
 * Ani.BACK_IN
 * Ani.BACK_OUT
 * Ani.BACK_IN_OUT
 * Ani.BOUNCE_IN
 * Ani.BOUNCE_OUT
 * Ani.BOUNCE_IN_OUT
 * Ani.ELASTIC_IN
 * Ani.ELASTIC_OUT
 * Ani.ELASTIC_IN_OUT
 * 
 * MOUSE
 * click           : set end position of the animations and trigger new one
 */
 
 import de.looksgood.ani.*;
// constants

float x = 35;
float y = 35;
float x1 = 70;
float y1 = 70;
float x2 = 10;
float y2 = 10;
float x3 = 400;
float y3 = 400;
float x4 = 107;
float y4 = 107;
float x5 = 344;
float y5 = 344;


int diameter = 50;
int Y_AXIS = 1;
int X_AXIS = 2;

PImage b;


void setup(){
  size(500, 629);


  // create some gradients
  // background
  color b1 = color(190, 190, 190);
  color b2 = color(20, 20, 20);
  
  setGradient(0, 0, width, height, b1, b2, Y_AXIS);
  //center squares
color c1 = color(237, 237, 229, 50);
color c2 = color(242, 243, 238, 50);
setGradient(0, 0, 500, 629, c1, c2, Y_AXIS);
smooth();
noStroke();
Ani.init(this);
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ){
  // calculate differences between color components 
  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);

  // choose axis
  if(axis == Y_AXIS){
    /*nested for loops set pixels
     in a basic table structure */
    // column
    for (int i=x; i<=(x+w); i++){
      // row
      for (int j = y; j<=(y+h); j++){
        color c = color(
        (red(c1)+(j-y)*(deltaR/h)),
        (green(c1)+(j-y)*(deltaG/h)),
        (blue(c1)+(j-y)*(deltaB/h)) 
          );
        set(i, j, c);
      }
    }  
  }  
  else if(axis == X_AXIS){
    // column 
    for (int i=y; i<=(y+h); i++){
      // row
      for (int j = x; j<=(x+w); j++){
        color c = color(
        (red(c1)+(j-x)*(deltaR/h)),
        (green(c1)+(j-x)*(deltaG/h)),
        (blue(c1)+(j-x)*(deltaB/h)) 
          );
        set(j, i, c);
      }
    }  
  }
}

void draw() {
  b = loadImage("bg.jpg");
  background(b);
  fill(116, 140, 174, 95);
  noStroke();
  rect(x, y, 40, 400);
  
  fill(87, 56, 53, 200);
  noStroke();
  rect(x1, y1, 40, 400);
  
  fill(228, 210, 186, 200);
  noStroke();
  ellipse(x2, y2, 200, 200);
  
  fill(34, 26, 41, 200);
  noStroke();
  ellipse(x3, y3, 200, 100);
  
  fill(81, 51, 53, 95);
  noStroke();
  rect(x4, y4, 200, 200);
  
  fill(221, 191, 92);
  noStroke();
  rect(x5, y5, 20, 110);
  
}

void mouseReleased() {
  Ani.to(this, 1.0, "x", random(mouseX), Ani.BOUNCE_OUT);
  Ani.to(this, 1.0, "y", random(mouseY), Ani.BOUNCE_OUT);
  
  Ani.to(this, 1.0, "x1", random(mouseX), Ani.BOUNCE_OUT);
  Ani.to(this, 1.0, "y1", random(mouseY), Ani.BOUNCE_OUT);
  
  Ani.to(this, 1.0, "x2", random(mouseX), Ani.BOUNCE_OUT);
  Ani.to(this, 1.0, "y2", random(mouseY), Ani.BOUNCE_OUT);
  
  Ani.to(this, 1.0, "x3", random(mouseX), Ani.BOUNCE_OUT);
  Ani.to(this, 1.0, "y3", random(mouseY), Ani.BOUNCE_OUT);
  
  Ani.to(this, 1.0, "x4", random(mouseX), Ani.BOUNCE_OUT);
  Ani.to(this, 1.0, "y4", random(mouseY), Ani.BOUNCE_OUT);
  
  Ani.to(this, 1.0, "x5", random(mouseX), Ani.BOUNCE_OUT);
  Ani.to(this, 1.0, "y5", random(mouseY), Ani.BOUNCE_OUT);

}


