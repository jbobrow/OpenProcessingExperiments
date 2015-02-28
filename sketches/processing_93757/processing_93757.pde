
/* Modified by @ramayac, 19-03-2013 */

float offset = 50.0;
float scaleVal = 35.0;
float angleInc = PI/28.0;
float angle = 0.0;

void setup(){
    size(700,700);
    background(40);
    noFill();
    stroke(250);
    smooth();
    noLoop();
}

void draw(){
    for(int x = 0; x <= width; x += 5) {
      float y = offset + (sin(angle) * scaleVal);

      arc(width/2,height/2, x, y*9, HALF_PI,TWO_PI*2);
      
      angle += angleInc;   
    }
}

