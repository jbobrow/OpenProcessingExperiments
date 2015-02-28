
//********************************************
//
//              ×× DATA ××
//
//********************************************

PImage speak;
PImage [] buffer;

int ratio = 45, widthRatio, heightRatio; //number of small parts
float noiseScale = 0;
int choix, noiseInt;

//********************************************
//
//              ×× SETUP ××
//
//********************************************

void setup() {
  size(800, 600);
  background(255);
  smooth();

  speak = loadImage("Penguins.jpg");
  speak.resize(400, 400);
  //  ------  to keep the same noise algorithm
  //noiseSeed(2);

  buffer       = new PImage[ratio * ratio];
  //  ------  size of the futures splitted images
  widthRatio   = speak.width / ratio;
  heightRatio  = speak.height / ratio;

  buffer = splitImage(speak, ratio);

  for (int i = 0; i < width; i += widthRatio) {
    for (int j = 0; j < height; j += heightRatio) {
      //image(buffer[(int)(random(buffer.length))], i, j);//------------------ random version

      for (choix = 0; choix < buffer.length; choix += noiseInt) {
        
        noiseScale    -=.01;
        float noiseVal = noise(noiseScale) ;
        //  ------  this method adapt the result from noiseVal 
        //  ------  to the buffer length
        noiseInt       = (int)map(noiseVal, 0, 1, 0, buffer.length);
        
        pushMatrix();
        translate( i + (buffer[choix].width/4), j + (buffer[choix].height/4) );
        scale(0.9);
        image(buffer[choix], 0, 0);//-------------------------------------- noise version
        popMatrix();
      }
    }
  }
}

//********************************************
//
//              ×× SPLIT IMAGE ××
//
//********************************************

//  ------  This method return array of PImage objects
//  ------  which represent the same image splitme, but 
//  ------  fragmented in 15 * 15 = 225 small pictures.
PImage [] splitImage(PImage splitMe, int ratio) {

  PImage [] buffSplit = new PImage[ratio * ratio];

  for (int i = 0; i < buffSplit.length; i++) {
    //  ------  put a new PImage in each part of the array
    buffSplit[i] = new PImage(widthRatio, heightRatio);

    //  ------  work with this processing PImage method:
    //  ------  img.copy(srcImg, sx, sy, swidth,  sheight, dx, dy, dwidth, dheight);
    buffSplit[i].copy(
    splitMe, //  ---------------------------------------------------  the source image we want to work on
    ((i * widthRatio) % splitMe.width), //  ------------------------  x coordinate of the source image upper left corner
    ((i / (splitMe.height / heightRatio)) * heightRatio), //  ------  y coordinate of the source image upper left corner 
    widthRatio, //  ------------------------------------------------  source image width
    heightRatio, //  -----------------------------------------------  source image height
    0, //  ---------------------------------------------------------  int: X coordinate of the destination's upper left corner
    0, //  ---------------------------------------------------------  int: Y coordinate of the destination's upper left corner
    buffSplit[i].width, //  ----------------------------------------  int: destination image width
    buffSplit[i].height                                  //  -------  int: destination image height
    );
  }
  return buffSplit;
}

//********************************************
//
//              ×× DRAW ××
//
//********************************************

void draw() {
}

//********************************************
//
//            ×× KEYPRESSED ××
//
//********************************************

void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame(timestamp()+"_##.png");
  }
}

//********************************************
//
//            ×× TIMESTAMP ××
//
//********************************************

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


