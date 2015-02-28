
//My title of this artistics is called 'The Enhanced version'
//My intention/artistics
//1. To draw the circle and the rectangle in uniform pattern

//2. The color of the pattern depends of the key 1,2 and 3
//To save the picture press s, 
//To delete just press delete or backspace

//Global Varaibles 
color strokeColor = color(0, 10);

//setup()
void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100, 100); 
  noFill();
  background(360);
}
//draw()
void draw() {
  if (mousePressed) {
    pushMatrix();
    //translate(width/2, height/2);
    //map(value, start1, stop1, start2, stop2);
    int circleResolution=(int)map(mouseY+100, 0, height, 2, 10);
    int radius = mouseX-width/2;
    float angle = TWO_PI/circleResolution;
    float locx=mouseX;

    //style
    strokeWeight(5);
    stroke(strokeColor);
    ellipse(locx/2, mouseY/2, mouseX/2, mouseY/2);
    rect(mouseX/2, mouseY/2, mouseX/2, mouseY/2);
    ellipse(mouseY/2, mouseX/2, mouseX/2, mouseY/2);
    rect(mouseX/2, mouseY/2, mouseX/2, mouseY/2);
    beginShape();
    for (int i = 0; i<=circleResolution; i++) {

      float x = 0 + cos(angle*i)*radius;
      float y=0+sin(angle*i)*radius;
      vertex(x, y);
    }
    endShape();
    //ellipse(x,y);
    popMatrix();
  }
}
//keyPressed()
void keyReleased() {
  if (key == DELETE || key==BACKSPACE) background(360);
  if (key== 's' || key=='S') saveFrame("yourpicture.png");

  switch(key) {
  case '1':
    strokeColor = color(5, 100);
    break;

  case '2':
    strokeColor = color(100, 100, 24, 10);
    break;

  case '3':
    strokeColor = color(152, 200, 80, 20);
    break;
  }
}


