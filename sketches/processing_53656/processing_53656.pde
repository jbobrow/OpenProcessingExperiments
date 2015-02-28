
float sizeChange =0;
float speed = 2;
float alphaChange;
float alphaVar = 30;
 
void setup() {
  size(400, 400);
}

void draw() {
  background(196,196,196);
  int yCent = height/6;
  noStroke();

//the rectangles
  for(int x = 1; x <= 6; x++) {
    fill(89, 178, 178, alphaVar * x);
    rect((width/6) * x, yCent, (10 * x) + sizeChange, height);
//rects grow and shrink on a cosine curve
//mouse click stops growth
    if (!mousePressed) {
//abs is the absolute value of the number
//cos is the cosine of the angle
//radians converts the degree measurement in correspondense to the value
    sizeChange=80 * abs(cos(radians(speed)));
    speed += .10;
    }
  }
}


