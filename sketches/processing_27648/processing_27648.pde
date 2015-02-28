
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 5-9: Simple Gravity

float x = random(100);   // x location of square
float y = -3;     // y location of square
float posx = random(100);
float posy;
float speed = 0;   // speed of square

// A new variable, for gravity (i.e. acceleration).   
// We use a relatively small number (0.1) because this accelerations accumulates over time, increasing the speed.   
// Try changing this number to 2.0 and see what happens.
float gravity = 0.1;  

void setup() {
  size(500,500);
  background(0);
  //iniciar(0,random(height));
}
  // Display the square
void dibujarpelota(){
  fill(devuelveColor());
  smooth();
  noStroke();
  ellipseMode(CENTER);
  ellipse(x,y,5,5);
    
  // Add speed to location.
  y = y + speed;
  
  // Add gravity to speed.
  speed = speed + gravity;
 }  

void render (){
 //x = x + 1;
 // if (y > height) 
    // Multiplying by -0.95 instead of -1 slows the square down each time it bounces (by decreasing speed).  
    // This is known as a "dampening" effect and is a more realistic simulation of the real world (without it, a ball would bounce forever).
   // speed = speed * -0.95;
   if (y > height) { 
   x = random(500);
   y = 0;
}
 // If square reaches the bottom
  // iniciar?
 /*void iniciar(float xx, float yy){
   posx = xx;
   posy = yy;
 }*/
}


  
color devuelveColor(){
  float rojo = random(0,255);
  float verde = random(0,255);
  float azul = random(0,255);
  return color(rojo,verde,azul);
  }
  
void draw(){
render();
loop();
dibujarpelota();
iniciar();
}




