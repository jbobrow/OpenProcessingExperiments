
SelfOrganizingMap som;
PImage mainImage, restart, begin;
PImage[] thumbs;
boolean somActive = false;

// Note: if you are running this in Processing, you must uncomment out the blank path string
// and comment out the one with the path "../code/SOM/data".  If you are running this with
// Processing.js the path variable must refer to the location of the actual images used in
// this sketch.

String path = "";                      // <-- if in Processing
//String path = "../code/SOM/data/";   // <-- if using ProcessingJS

void setup()
{
  size(720, 600);
  frameRate(30);
  noStroke();
  fill(0, 175);
  
  // load thumbnails
  thumbs = new PImage[8];
  for (int i = 0; i < 8; i++)
    thumbs[i] = loadImage(path + "flower" + (i+1) + "_sm.jpg");
  begin = loadImage(path + "begin.png");
  restart = loadImage(path + "restart.png");
  
  som = new SelfOrganizingMap(100, 100);
}

void draw() 
{
  // drawing the main image and its SOM
  if (somActive) {
    color sample = mainImage.pixels[ (int) random(360*600) ];
    som.updateMap(sample);  
    image(mainImage, 0, 0);
    image(som.pg, 360, 0, 360, 600);
    rect(0, 573, 185, 26);
    image(restart, 0, 573);
  }
  // drawing the home screen
  else {
    background(0);
    for (int i=0; i<8; i++)
      image(thumbs[i], 19 + (i%4)*175, 40 + 280*floor(i/4));
    image(begin, 0, 0); 
  }
}

void mousePressed()
{
  if (somActive) {
    if (mouseX < 185 && mouseY > 573)
      somActive = false;
  } else {
    for (int i = 0; i < 8; i++) {
      if (mouseX > (19 + (i%4)*175) && mouseX < (175 +(i%4)*175) &&
          mouseY > (40 + 280*floor(i/4)) && mouseY < (300 + 280*floor(i/4))) {
          mainImage = loadImage(path + "flower" + (i+1) + ".jpg");
          mainImage.loadPixels();
          som.initializeMap();
          somActive = true;
          }
    }
  }
}


