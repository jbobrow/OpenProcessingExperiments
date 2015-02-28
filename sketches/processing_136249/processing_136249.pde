
/* The canvas is 800*800 and thus is within 800*600 and 1280*720.

I have used Keyboard Input, Mouse Input, Screenshot Saving Capability, It also has a blank canvas until it receives user input, and a static canvas after input completes.

I have used 5 different colors: black, green, blue, pink and yellow.

The output is geometrical and it makes me feel happy.

*/
PImage geometry;
color strokeColor = color(0, 10);
void setup(){
  size(850, 650);
  geometry = loadImage("geometry.PNG");
  colorMode(HSB, 360, 200, 100, 100);
  noFill();
  background(360);
}
void draw(){
image(geometry, 0, 0 );
  if(mousePressed){
    pushMatrix();
    translate(width/2, height/2);
    int circleResolution = (int)map(mouseY+120, 0, height, 6, 10);
    int radius = mouseX-width/2;
    float angle = TWO_PI/circleResolution;
    strokeWeight(4);
    stroke(strokeColor);
    beginShape();
    for (int i=0; i<=circleResolution; i++){
      float a = 0 + cos(angle*i) * radius;
      float b = 0 + sin(angle*i) * radius;
      vertex(a, b);
    }
    endShape();
    popMatrix();
  }
}
void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background(360);
  if (key == 's' || key =='S')saveFrame("Assignment3.png");
  switch(key){
    case '1':
    strokeColor = color(300, 100, 54, 10);
    break;
    case '2':
    strokeColor = color(120, 100, 64, 10);
    break;
    case '3':
    strokeColor = color(250, 100, 71, 10);
    break;
    case '4':
    strokeColor = color(320, 100, 71, 10);
    break;
    case '5':
    strokeColor = color(55, 100, 71, 10);
    break;
  }
}


