
String str = new String("Paris");
int i;

void setup() {
  frameRate(10);
  size(700, 700);   
  background(255); // nero per switchColor, bianco per !switchColor
}

void draw() {
  animationChar(str.charAt(i), false, 0, 255);
  i++;
  i %= str.length();

  //animationString(str, false, 0, 255);
}

void animationChar(char c, boolean switchColor, int hue_1, int hue_2) {
  colorMode(HSB);

  if (switchColor) {
    filter(ERODE);
    fill(0, 20);
  } else {
    filter(DILATE);
    fill(255, 20);
  }
  rect(0, 0, width, height);

  fill(random(hue_1, hue_2), random(100, 255), random(100, 255));
  if (width < height)
    textSize(random(width / 4, width / 2));
  else {
    textSize(random(height / 4, height / 2));
  }
  text(c, random(width), random(height));
}

void animationString(String s, boolean switchColor, int hue_1, int hue_2) {
  colorMode(HSB);

  if (switchColor) {
    filter(ERODE);
    fill(0, 20);
  } else {
    filter(DILATE);
    fill(255, 20);
  }
  rect(0, 0, width, height);

  fill(random(hue_1, hue_2), random(100, 255), random(100, 255));
  textAlign(CENTER);
  if (width < height)
    textSize(random(width / 4, width / 2));
  else {
    textSize(random(height / 4, height / 2));
  }
  text(s, random(width), random(height));
}



