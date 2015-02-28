
PImage map;
PImage flags;
void setup() {
  size(600, 755);
  textSize(20);
  text("2012", 550, 750);
  map = loadImage("tristate.jpg");
  flags = loadImage("flags.png");
}

void draw() {
  image(map, 0, 0);

  fill(0);
  color underMouse = get(mouseX, mouseY);
  if ( (red(underMouse) == 126) && (green(underMouse) == 61) && (blue(underMouse) == 151)) {
    textSize(20);
    text("New York", 50, 150);
    textSize(30);
    text("2,574,121", 50, 180);
  }
  if ( (red(underMouse) == 39) && (green(underMouse) == 170) && (blue(underMouse) == 224)) {
    textSize(20);
    text("Pennsylvania", 50, 150);
    textSize(30);
    text("436,254", 50, 180);
  }
  if ( (red(underMouse) == 247) && (green(underMouse) == 236) && (blue(underMouse) == 48)) {
    textSize(20);
    text("New Jersey", 50, 150);
    textSize(30);
    text("1,134,033", 50, 180);
  }

  if (keyPressed == true) {
    if (key == '1') {
      image(flags, 200, 200);
      
    }
    if (key == '2') {
      textSize(18);
      text("There are 35.5 million people that speak spanish in the USA", 50, 600);
    }
    if (key == '3') {
      textSize(18);
      text("About 36 Million native speakers,", 50, 600);
      text("and about 5 million who speak it as a second language.", 50,620);
    }
    if (key == '4') {
      textSize(18);
      text("The population of the United States is approximately", 50, 600);
      text("305,689,000.", 50,620);  
    }
    
  }
}
