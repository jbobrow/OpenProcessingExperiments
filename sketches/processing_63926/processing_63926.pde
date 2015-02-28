
//Circle properties
float x, y;
final float r = 15f;
final float v = 2f;

void setup() {
  size(200,200);
  x = width/2;
  y = height/2;
  strokeWeight(3);
}

void draw() {
  //Get mouseX and mouseY relative to the circle
  float relMouseX = mouseX - x;
  float relMouseY = mouseY - y;
  //Get the angle to the mouse (in radians.)
  float angle = atan2(relMouseY, relMouseX);
  //atan2() is used to return the angle to a point in 2d space,
  //much like arctangent.
  //For now, you can just remember that "atan2(y,x)" will
  //get you the angle to a point.
  //Please refer to a trigonometry textbook or mentor for 
  //the mathematics.
  
  //"Clear" screen with a cool fading effect
  noStroke();
  fill(255, 10);
  rect(0,0,width,height);
  
  //Draw circle
  stroke(0);
  fill(255);
  ellipse(x, y, 2*r, 2*r);
  //Draw line towards mouse from center of circle
  line(x, y, x + r*cos(angle), y + r*sin(angle));
  //If you need to draw a line at a weird angle,
  // "length*cos(angle)" will get you the length along the x-axis
  // "length*sin(angle)" will get you the length along the y-axis
  //Again, refer to a trigonometry textbook or mentor for the 
  //mathematics.
  
  //Get distance to the mouse squared and compare it 
  //with radius squared.
  //This is the same as comparing radius and distance, but
  //runs faster with less memory usage.
  float d = relMouseX*relMouseX + relMouseY*relMouseY;
  if(d > r*r) {
    //If not touching mouse, move to it.
    x += v*cos(angle);
    y += v*sin(angle);
    //Again, we can use "length*cos(angle)" and 
    //"length*sin(angle)" to determine the x and y distances
    //when moving at arbitrary angles. In this case, "length"
    //corresponds to the number of pixels we want to move at 
    //direction "angle."
  }
}

