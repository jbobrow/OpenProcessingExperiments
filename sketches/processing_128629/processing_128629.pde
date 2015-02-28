
//Carlyn Maw
//Constant vs Variable Example 1

//One line is always the same. 
//One line that will be differen everytime the sketch is loaded. 
//One that is different every frame. 

final static float L1 = 78;
final float L2 = random(360); 
final static int speed = 4;
int lineY = 0;

void setup() { 
  size(480, 360); //cannot use constants in JavaScript mode.
  background(204);
}

void draw() {
  background(204);
  stroke(255);
  line(0, L1, width, L1);
  stroke(0);
  line(0, L2, width, L2);
  stroke(64);
  line(0, lineY, width, lineY);
  lineY = lineY + speed;
  if (lineY> height) {
    lineY = 0;
  }
}



