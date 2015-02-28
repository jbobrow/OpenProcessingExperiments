
// 2012 Buddha Graphix / Jesper Birk / http://www.graphix.dk
// with inspiration from:
// http://openprocessing.org/visuals/?visualID=48061


// import fullscreen.*; 
// FullScreen fs;    // uncomment for full screen mode (needs Fullscreen library)


float image_Scale_Min = 0.025;
float image_Scale_Max = 3;

int minLayers = 3;
int maxLayers = 15;


boolean filters = true;   
int filterRandomnes = 10; // less is more
int blurAmount = 10; //      more is more
int blurRandomnes = 10; //   less is more

boolean drawLines = true; 
int minLines = 5; 
int maxLines = 15;      
float minWeight = 1;
float maxWeight = 600;
int lineGray = 0;
int lineMaxAlpha = 50;

int cleanCanvas = 5;  // how many pictures before canvas is reset
int canvasColor = 0;  // gray

boolean SAVING = false;   
int saveCount = 1;


String [] imageFiles = { 
"DSC09415.JPG", 
"DSC09439.JPG", 
"DSC00229.JPG", 
"DSC06864.JPG", 
"DSC08382.JPG", 
"DSC08710.JPG", 
"DSC08522.JPG", 
"DSC09371.JPG", 
"IMG_3843.JPG", 
"DSC08457.JPG", 
"DSC09409.JPG", 
"DSC09426.JPG", 
"DSC09404.JPG", 
"IMG_4150.JPG", 
"IMG_4113.JPG", 
"DSC00218.JPG", 
"DSC08458.JPG", 
"IMG_1288.JPG", 
};

PImage [] images = new PImage[imageFiles.length];




// Blending function not working too neat yet
boolean blendImage = true;
int blendmode = LIGHTEST;
// BLEND, ADD, SUBTRACT, LIGHTEST, DARKEST, DIFFERENCE, EXCLUSION, MULTIPLY, SCREEN, OVERLAY, HARD_LIGHT, SOFT_LIGHT, DODGE, BURN




// no need to edit
int imageOriantation;
int cleanCanvasCountDown;
float featureR, featureG, featureB;




void setup() {
//  size(screen.width, screen.height);  // full screen mode
  size(990, 660);
  smooth();
  
  // fs = new FullScreen(this);   // uncomment for full screen mode
  // fs.enter(); 
  
  for (int i=0;i<imageFiles.length;i++) {  images[i] = loadImage(imageFiles[i]);  }

  cleanCanvasCountDown = cleanCanvas;
}






void draw() {

  if (cleanCanvasCountDown < 1) {
    background(canvasColor);
    cleanCanvasCountDown = cleanCanvas;
  }
cleanCanvasCountDown -=1;



// set orientation for images & lines
  float random_imageOrientation = random(4);  
  imageOriantation = 1;
  if (random_imageOrientation > 1) { 
    imageOriantation = 2;
  }
  if (random_imageOrientation > 2) { 
    imageOriantation = 3;
  }
  if (random_imageOrientation > 3) { 
    imageOriantation = 4;
  }
  // 1 = random direction (pictures & lines), 2 = horisontal orientation (pictures & lines), 3 = vertical orientation (lines),  4 = vertical & horisontal mix


  
  float random_feature_color = random(4);
  
    featureR = random(255);
    featureG = featureR;
    featureB = featureR;
  
  if (random_feature_color >1) {
    featureR = random(50,255);
    featureG = 0;
    featureB = 0;
  }
  
    if (random_feature_color >2) {
    featureR = 0;
    featureG = random(50,255);
    featureB = 0;
  }
  
    if (random_feature_color >3) {
    featureR = 0;
    featureG = 0;
    featureB = random(50,255);
  }


  for (int i=0;i<int(random(minLayers,maxLayers));i++) {  // Layer loop start

    drawLines();

    if (imageOriantation == 1) {
      drawImage (images[int(random(0, imageFiles.length))], random(0, width), random(0, height), random(image_Scale_Min, image_Scale_Max), random(0, TWO_PI));
    }

    if (imageOriantation == 2 || imageOriantation == 3 ) {
      drawImage (images[int(random(0, imageFiles.length))], random(0, width), random(0, height), random(image_Scale_Min, image_Scale_Max), 0);
    }

    if (imageOriantation == 4 ) {
      float   thisFlip = TWO_PI;
      float randomFlip = random(4);
      thisFlip = TWO_PI;
      if (randomFlip > 1) { 
        thisFlip = HALF_PI;
      }
      if (randomFlip > 2) { 
        thisFlip = PI;
      }
      if (randomFlip > 3) { 
        thisFlip = PI + HALF_PI;
      }
      drawImage (images[int(random(0, imageFiles.length))], random(0, width), random(0, height), random(image_Scale_Min, image_Scale_Max), thisFlip);
    }

    if (filters) { 
      runFilters();
    }
  }  // Layer loop end
  
  
    if( SAVING ){
    saveFrame( "images/image_" + saveCount + ".png" );
    saveCount ++;
  }
  
}






void drawLines() {

  if (imageOriantation == 1 ) {
    for (int i=0;i<int(random(minLines,maxLines));i++) {
      stroke(featureR, featureG, featureB, random(lineMaxAlpha));
      strokeWeight(random(minWeight, maxWeight));
      float topOrSide = random(2);
      if (topOrSide > 1) {  // start at top  
        line (random(width), 0, random(width), height);
      }
      if (topOrSide < 1) {  // start at side  
        line (0, random(height), width, random(height));
      }
    }
  }


  if (imageOriantation == 2 ) {
    for (int i=0;i<int(random(minLines,maxLines));i++) {
      stroke(featureR, featureG, featureB, random(lineMaxAlpha));
      float randomY = random(height);
      strokeWeight(random(minWeight, maxWeight));
      line(0, randomY, width, randomY);
    }
  }


  if (imageOriantation == 3 ) {
    for (int i=0;i<int(random(minLines,maxLines));i++) {
      stroke(featureR, featureG, featureB, random(lineMaxAlpha));
      float randomX = random(width);
      strokeWeight(random(minWeight, maxWeight));
      line(randomX, 0, randomX, height);
    }
  }


  if (imageOriantation == 4 ) {
    for (int i=0;i<int(random(minLines/2,maxLines/2));i++) {
      stroke(featureR, featureG, featureB, random(lineMaxAlpha));
      float randomX = random(width);
      strokeWeight(random(minWeight, maxWeight));
      line(randomX, 0, randomX, height);
    }
    for (int i=0;i<int(random(minLines/2,maxLines/2));i++) {
      stroke(featureR, featureG, featureB, random(lineMaxAlpha));
      float randomY = random(height);
      strokeWeight(random(minWeight, maxWeight));
      line(0, randomY, width, randomY);
    }
  }
}


void drawImage(PImage img, float x, float y, float s, float r) {
 // imageMode(CENTER);
  pushMatrix();
  translate(x, y);
  scale(s);
  rotate(r);
  
  image (img, 0, 0);

   // if (blendImage) 
    //blend(img, 0,0 ,int(img.width*s), int(img.height*s), 0,0 , int(img.width*s), int(img.height*s), blendmode);

  popMatrix();

}



// very pseudo random - could use some better math
void runFilters() {
  if (random(filterRandomnes) < 1) {
    filter(GRAY);
  }

  if (random(filterRandomnes) < 1) {
    filter(THRESHOLD);
  }

  if (random(filterRandomnes) < 1) {
    filter(INVERT);
  }

  if (random(filterRandomnes) < 1) {
    filter(POSTERIZE, 4);
  }

  if (random(filterRandomnes) < 1) {
    filter(POSTERIZE, 2);
  }

  if (random(blurRandomnes) < 1) {
    filter(BLUR, random(blurAmount));
  }
}


