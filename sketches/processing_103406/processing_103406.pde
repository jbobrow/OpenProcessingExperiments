
float nkurbelX;
float nkurbelY;
float nkurbelRotation = 0;
float previousAngle = 0;

int previousFrame = 0;
int currentFrame = 0;

ImageSequence nSkate;
ImageSequence nkurbel;


void setup() {
  size(1000, 500);

  frameRate(10); // besser mit Timecode, frameRate macht das Programm langsams

  nSkate = new ImageSequence("nSkate", 133, ".png");
  nkurbel = new ImageSequence("nkurbel", 48, ".png");

nkurbelX = width*0.75; 
nkurbelY = height*0.5;

//  noCursor();
}


void draw() {
  background(255);

  float dx = mouseX - nkurbelX;   // Differenz Kurbelmittelpunkt (x) zu Maus (x)
  float dy = mouseY - nkurbelY;  // Differenz Kurbelmittelpunkt (y) zu Maus (y)

  float angle = atan2(dy, dx) ;   // Winkel
  float angleDifference = angle - previousAngle;   // Winkelunterschied

  previousAngle = angle; // update Angle, um neuen previous Angle zu bilden

  if (mousePressed) {
    nkurbelRotation = nkurbelRotation + angleDifference;   // Winkelunterschied dazuzählen

    if (nkurbelRotation < 0) {    /* Nie, nie, nie negativ werden lassen, 
    weil es keine negative Bildanzahl gibt */
      nkurbelRotation =  nkurbelRotation * -1; // verändert Vorzeichen
    }
  }
  previousFrame = currentFrame;
  currentFrame = round( map(nkurbelRotation, 0, TWO_PI, 0, 48) ) % 48;
        

  if ((previousFrame < currentFrame) || ((currentFrame == 0) && (previousFrame == 47))) {
    nSkate.advance();
  }
  else if ((previousFrame > currentFrame) || ((currentFrame == 11) && (previousFrame == 0))) {
    nSkate.reverse();
  }  
  imageMode(CENTER);

 // if (frameCount % 2 == 0) {     // Make the kurbel two times slower
   
   // nkurbel.currentFrame = 6; -> genau bestimmen welches Bild gezeichnet wird
 nkurbel.currentFrame = currentFrame; 
 // nkurbel.currentFrame = frameCount; // 2 versch. currentFrames ohne Mousekurbelbewegung
//}
 
 // nkurbel.advance(); ohne Mousekurbelbewegung
  image(nkurbel.getImage(), nkurbelX, nkurbelY);


 // nSkate.advance();
  image(nSkate.getImage(), width*0.25, height*0.5); 
}

class ImageSequence {
  ArrayList<PImage> images;
  int currentFrame = 0;     // Where are we?
  

  public ImageSequence(String fileNamePrefix, int numberOfImages, String fileNameSuffix) {
    images = new ArrayList<PImage>();

    for (int i = 0; i < numberOfImages; i++) {
      String filename = fileNamePrefix + nf(i, 6) +  fileNameSuffix;
      PImage img = loadImage(filename);
      images.add(img);
    }
  }


  void advance() {
    currentFrame = (currentFrame + 1) % images.size(); // % - Modulo -> Schleife
  }
  
  void reverse() {
    if (currentFrame == 0) {
      currentFrame = images.size() - 1;
    }
    else {
      currentFrame = currentFrame - 1 ; 
    }
  }
    
  PImage getImage() {
   if(currentFrame > images.size() - 1) {
    
    println("currentFrame zu gross");
   }
    return images.get(currentFrame);
  }
}



