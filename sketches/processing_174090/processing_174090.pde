
//Here I present my interactive sketch variant. 
//Using this sketch you can create a different kind of abstract pieces of art.

//Global Variables
color strokeColor = color(0, 10);

//setup()
void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  background(174, 69, 48);
}

//draw()
void draw() {
if (mousePressed){
  pushMatrix();
  translate(width/2, height/2);
  //map(value, start1, stop1, start2, stop2);
  int circleResolution = (int)map(mouseX+100, 10, height/2, 2, 10);
  int radius = mouseY-width/2;
  float angle = circleResolution;
  
  //style
  strokeWeight(2);
  stroke(strokeColor);
  
  beginShape();
  for (int i=0; i<=circleResolution; i++){
    float x = 0 + sin(angle*i) * radius;
    float y = 0 + cos(angle*i) * radius;
    vertex(x, y);
  }
  endShape();
  popMatrix();
}
}
//keyPressed()
//Case 4 everytime adds a circle of random size on the background.
//However it has a strange effect: after mouse has been pressed,
//the circles become a kind of blurred, also they always change its
//color according to the button pressed - 1-3
//Unfortunately I hadn't enough time to research this effect in details.
//I will send this assignment and try to sort out this things.
void keyReleased() {
  if (key == DELETE || key == BACKSPACE) background(174, 69, 48);
  if (key == 's' || key == 'S') saveFrame("screenshot.png");
  
  switch(key) {
    case '1':
      strokeColor = color(0, 10);
      break;
    case '2':
      strokeColor = color(186, 26, 99, 10);
      break;
    case '3':
      strokeColor = color(60, 90, 93, 10);
      break;
    case '4':
      strokeWeight(random(10));
      strokeColor = color(0, 10);
      float a = 45;
      float b = 45;
      a = random(width);
      b = random(height);
      ellipse(a, b, 100, 100);
      break;
  }
}

