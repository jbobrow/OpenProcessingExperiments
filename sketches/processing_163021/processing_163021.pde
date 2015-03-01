
color avgColor;
PImage img1;
color [] pixelColors1;

int r = 1;
int resolution = 50;
String [] urls = new String [10];
boolean row1Sampled = false;
int sampleIndex;

int savedTime;
int totalTime = 5000;

void setup () {
  size (800, 300);
  urls[0] = "http://images.nationalgeographic.com/wpf/media-live/photos/000/835/cache/mestia-svanetia-church-candles_83591_990x742.jpg";
  urls[1] = "http://images.nationalgeographic.com/wpf/media-live/photos/000/835/cache/owl-peeking-tree-northumberland_83592_990x742.jpg";
  urls[2] = "http://images.nationalgeographic.com/wpf/media-live/photos/000/835/cache/fishing-net-beach-vietnam_83585_990x742.jpg";
  urls[3] ="http://images.nationalgeographic.com/wpf/media-live/photos/000/835/cache/poland-summer-hay-jumping_83594_990x742.jpg";
  urls[4] ="http://images.nationalgeographic.com/wpf/media-live/photos/000/835/cache/pet-chameleon-scales-reptile_83593_990x742.jpg";
  urls[5] ="http://images.nationalgeographic.com/wpf/media-live/photos/000/835/overrides/arizona-aerial-irrigation-essick_83582_990x742.jpg";
  urls[6] ="http://images.nationalgeographic.com/wpf/media-live/photos/000/835/cache/lantern-festival-wish-thailand_83589_990x742.jpg";
  urls[7] ="http://images.nationalgeographic.com/wpf/media-live/photos/000/835/cache/ice-beach-breidamerkursandur-iceland_83588_990x742.jpg";
  urls[8] ="http://images.nationalgeographic.com/wpf/media-live/photos/000/835/cache/prayer-papers-sichuan-china_83595_990x742.jpg";
  urls[9] ="http://images.nationalgeographic.com/wpf/media-live/photos/000/835/cache/autumn-morning-lithuania-fog_83583_990x742.jpg";
  // Load image from a web server
  sampleIndex = int(random (9));
  img1 = loadImage(urls[sampleIndex], "gif");
  loadPixels ();
  pixelColors1 = new color[pixels.length];
  noStroke();
  savedTime = millis();
}

void draw () {

  img1.loadPixels(); 
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;

      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      float r = red(img1.pixels[loc]);
      float g = green(img1.pixels[loc]);
      float b = blue(img1.pixels[loc]);
      pixelColors1[loc] = color(r, g, b);
    }
  }
  updatePixels();
  background (0);
  for (int x = 0; x < width; x = x + width/resolution) {
    for (int y = 0; y < height; y = y + width/resolution) {

      int r = int(random(pixels.length)); 
      fill (pixelColors1[r]);
      rect (x, y, resolution, resolution);
    }
  }
  //now pick a new sample
  if (r < pixels.length-50) {
    r=r+50;
  } else {
    r = 0;
  }

  // Calculate how much time has passed
  int passedTime = millis() - savedTime;
  // Has five seconds passed?
  if (passedTime > totalTime) {
    pickNewSamplePhoto ();
    savedTime = millis(); // Save the current time to restart the timer!
  }
}

void pickNewSamplePhoto () {
  if (sampleIndex < 8) {
    sampleIndex++;
  } else {
    sampleIndex = 0;
  }

  img1 = loadImage(urls[sampleIndex], "gif");
  loadPixels ();
  pixelColors1 = new color[pixels.length];

  img1.loadPixels(); 
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;

      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      float r = red(img1.pixels[loc]);
      float g = green(img1.pixels[loc]);
      float b = blue(img1.pixels[loc]);
      pixelColors1[loc] = color(r, g, b);
    }
  }
}

//Works Cited

//Heavy help from: http://processing.org/tutorials/pixels/
//Sampling from National Geographic Photo of the Day, September 16, 2014 - September 25, 2014



