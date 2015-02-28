
/**
 * example used and altered: "Framingham"by Ben Fry.
 *
 */

/*something something string "If I keep repeating myself, maybe you'll like me?*/


import processing.video.*;

Capture video;
int column;
int columnCount;
int lastRow;
int index;
String [] letters;
PFont inst;

// Buffer used to move all the pixels up
int[] scoot;


void setup() {
  size(960, 720);

  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, 160, 120);
  video.start();  
  // Also try with other video sizes

  column = 0;
  columnCount = width / video.width;
  int rowCount = height / video.height;
  lastRow = rowCount - 1;

  scoot = new int[lastRow*video.height * width];
  background(0);

  textAlign(CENTER);
  inst = loadFont("Futura.vlw");
  textFont (inst, 48);
  index = 0;

  letters = new String[36];

  letters[0] = "I";
  letters[1] = "F";
  letters[2] = "I";
  letters[3] = "K";
  letters[4] = "E";
  letters[5] = "E";
  letters[6] = "P";
  letters[7] = "R";
  letters[8] = "E";
  letters[9] = "P";
  letters[10] = "E";
  letters[11] = "A";
  letters[12] = "T";
  letters[13] = "I";
  letters[14] = "N";
  letters[15] = "G";
  letters[16] = "M";
  letters[17] = "Y";
  letters[18] = "S";
  letters[19] = "E";
  letters[20] = "L";
  letters[21] = "F";
  letters[22] = "W";
  letters[23] = "I";
  letters[24] = "L";
  letters[25] = "L";
  letters[26] = "Y";
  letters[27] = "O";
  letters[28] = "U";
  letters[29] = "L";
  letters[30] = "I";
  letters[31] = "K";
  letters[32] = "E";
  letters[33] = "M";
  letters[34] = "E";
  letters[35] = "?";
}


void draw() {

  pushMatrix();

  for (int j = 0; j < 6; j++) {
    for (int i = 0; i < 6; i++) {
      text(letters[(i+1)*(j+1)-1], i*160 + 80, j*120 + 60);
    }
  }

  popMatrix();

  // By using video.available, only the frame rate need be set inside setup()
  if (video.available()) {
    video.read();
    video.loadPixels();
    image(video, video.width*column, video.height*lastRow);
    column++;
    if (column == columnCount) {
      loadPixels();

      // Scoot everybody up one row
      arrayCopy(pixels, video.height*width, scoot, 0, scoot.length);
      arrayCopy(scoot, 0, pixels, 0, scoot.length);

      // Set the moved row to black
      for (int i = scoot.length; i < width*height; i++) {
        pixels[i] = #000000;
      }
      column = 0;
      updatePixels();
    }
  }
}



