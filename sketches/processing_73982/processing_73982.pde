
void setup()
{
  size(400,400);
  background(125);
  noStroke();
  smooth();
  colorMode(HSB);
}
void draw()
{
  for (int i = 0; i < height; i += 9){
  //set myHue to hold transition value for hue
  float myHue = map(i,0, height, 0, 255);
  //loop with j going from 0 to width of window each time
  //complete j loop is executed every time i loop executes once
  for (int j = 0; j < width; j +=10){
    //set mySaturation to hold transition value for hue
    float mySaturation =map(j,0, random(width), random(i),255);
    //update fill with changing hue and saturation values
    fill(myHue,mySaturation,255);
    // draw rectange at i, j co-ordinates
    rect(j, i, 14,14);
  }
}
}

