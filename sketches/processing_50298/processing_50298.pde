

/*
Blood Tornado
by Anna Lotko
1/26/12
CTIN 544
*/

int rotation = 0;
float easing = 0.02;
float x = 0.0;
float y = 0.0;
   
void setup() {
  size(1000,600);
  smooth();
}
 
void draw() {
  //the low alpha value fades the spiral slowly
  fill(0, 5);
  strokeWeight(0);
  rect(0, 0, 1000, 600);
  
  //easing
  float targetX = mouseX;
  float targetY = mouseY;
  
  x += (targetX - x) * easing;
  y += (targetY - y) * easing;
  
  //spiral stroke
  strokeWeight(20);
  
  //spiral radias
  float radius = (width / 8);
 
  for (int i = 0; i <= 360; i+=10) {
    float j = radians(i - rotation);
    stroke(i,2,2,10);
    //this draws a bezier curve in relation to (a) the mouse position and (b) radius; it uses trigonometry to calculate the form of the bezier for each i & j value
    bezier(x, y, x + radius / 2 * cos(j), y + radius / 2 * sin(j), x + radius * cos(j + HALF_PI), y + radius * sin(j + HALF_PI), x + radius * cos(j + PI), y + radius * sin(j + PI));  
  }
  //rotates the bezier curve around x,y
  rotation++;
}

