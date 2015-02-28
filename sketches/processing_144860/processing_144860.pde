
/*
 * Andor Salga
 * Noise and Gradient Maps
 * TODO:
 *  Fix clouds
 * Refactor
 *  
 */

float noiseScale = 0.003f;
boolean useMouse = false;

PImage gradientMap;
PImage cloudMap;

PImage[] clouds = new PImage[2];
PImage[] ground = new PImage[2];

boolean invertNoise = false;
boolean showDebug = false;
boolean cloudsOn = false;

float lastTime = 0;
final float Speed = 1000;
final float CloudSpeed = Speed * 1.5; 

// Let the user move around to make things more interesting
PVector camPos = new PVector(0, 0);
PVector camVel = new PVector(0, 0);

PVector cloudCamPos = new PVector(0, 0);
PVector cloudCamVel = new PVector(0, 0);

boolean hasSetup = false;


void keyPressed() {
  // I key for toggling inversion
  if (keyCode == 73) {
    invertNoise = !invertNoise;
    generateGround();
    generateClouds();
  }
  // C key for toggling clouds
  else if (keyCode == 67)
  {
    cloudsOn = !cloudsOn;
    generateClouds();
  }
  else if (keyCode == 68)
  {
    showDebug = !showDebug;
  }
}

void setup() {
  size(500, 500);
  noSmooth();

  lastTime = millis();

  // Create/Load gradient maps
  gradientMap = loadImage("a.png");

  cloudMap = createImage(255, 1, ARGB);
  cloudMap.loadPixels();
  for (int i = 0; i < cloudMap.width; i++) {
    cloudMap.pixels[i] = color(255, i);
  }
  cloudMap.updatePixels();

  ground[0] = createImage(width, height, RGB);
  ground[1] = createImage(width, height, RGB);

  clouds[0] = createImage(width, height, ARGB);
  clouds[1] = createImage(width, height, ARGB);

  ground[0].loadPixels();
  ground[1].loadPixels();

  clouds[0].loadPixels();
  clouds[1].loadPixels();
}

/*
 *
 */
void imageSubCopy(PImage src, PImage dst, int xOffset, int yOffset)
{
  int dstX = 0;
  int dstY = 0;

  int srcX = 0;
  int srcY = 0;

  if (xOffset < 0)
  {
    srcX = abs(xOffset);
  }
  else
  {
    dstX = xOffset;
  }

  if (yOffset < 0)
  { 
    srcY = abs(yOffset);
  }
  else {
    dstY = yOffset;
    srcY = 0;
  }

  for ( ; dstX < src.width && srcX < src.width; dstX++, srcX++)
  {
    for (; dstY < src.height && srcY < src.height; dstY++, srcY++)
    {
      dst.pixels[ dstX + (dstY * src.width) ] = src.pixels[ srcX + (srcY * src.width) ];
    }

    if (yOffset < 0)
    {
      srcY = abs(yOffset);
      dstY = 0;
    }
    else {
      dstY = abs(yOffset);
      srcY = 0;
    }
  }
}

/* 
 *
 */
void generateNoiseX(PImage img, int startXOffset, int xWidth, int shiftX, int shiftY, PImage map) {  
  for (int x = startXOffset; x < startXOffset + xWidth; x++) {
    for (int y = 0; y < height; y++) {
      float n = noise((x - shiftX) * noiseScale, (y - shiftY) * noiseScale);
      n = invertNoise ? 1 - n : n;
      img.pixels[y * img.width + x] = map.pixels[int(n * (map.width - 1))];
    }
  }
}

/*
 *
 */
void generateNoiseY(PImage img, int startYOffset, int xHeight, int shiftX, int shiftY, PImage map) {
  for (int x = 0; x < width; x++) {
    for (int y = startYOffset; y < xHeight + startYOffset; y++) {
      float n = noise((x - shiftX) * noiseScale, (y - shiftY) * noiseScale);
      n = invertNoise ? 1 - n : n;
      img.pixels[y * img.width + x] = map.pixels[int(n * (map.width - 1))];
    }
  }
}

void mousePressed() {
  useMouse = true;
}

void generateClouds() {
  noiseDetail(20, 0.5);
  generateNoiseX(clouds[0], 0, width, int(cloudCamPos.x), int(cloudCamPos.y), cloudMap);
  image(clouds[0], 0, 0);
}

void generateGround() {
  noiseDetail(20, 0.5);
  generateNoiseX(ground[0], 0, width, int(camPos.x), int(camPos.y), gradientMap);
  image(ground[0], 0, 0);
}

void draw() {
  if (hasSetup == false)
  {
    if (gradientMap.width > 0) {
      generateGround();
      generateClouds();
      hasSetup = true;
    }
    return;
  }
  int t = millis();

  float dt = (millis() - lastTime) / 1000.0f;
  dt = constrain(dt, 0, 0.3);

  camVel.x = int(map(mouseX, 0, width, Speed, -Speed)* dt);
  camVel.y = int(map(mouseY, 0, height, Speed, -Speed) * dt);
  camPos.add(camVel);

  // 
  cloudCamVel.x = int(map(mouseX, 0, width, CloudSpeed, -CloudSpeed)*dt);
  cloudCamVel.y = int(map(mouseY, 0, height, CloudSpeed, -CloudSpeed)*dt);
  cloudCamPos.add(cloudCamVel);


  if (cloudsOn)
  {
    imageSubCopy(clouds[0], clouds[1], int(cloudCamVel.x), int(cloudCamVel.y));
  }

  // Move the image over, add noise to the 'missing' part
  imageSubCopy(ground[0], ground[1], int(camVel.x), int(camVel.y));


  //if (!cloudsOn)
  {
    noiseDetail(20, 0.5);
  }

  int xStartOffset = camVel.x > 0 ? 0 : width -  int(abs(camVel.x));
  int yStartOffset = camVel.y > 0 ? 0 : height - int(abs(camVel.y));

  generateNoiseX(ground[1], xStartOffset, int(abs(camVel.x)), int(camPos.x), int(camPos.y), gradientMap);
  generateNoiseY(ground[1], yStartOffset, int(abs(camVel.y)), int(camPos.x), int(camPos.y), gradientMap);

  ground[0].updatePixels();
  ground[1].updatePixels();
  
  image(ground[1], 0, 0);
  swap(ground);

  // Basically, twice the computation, so leave this optional.
  if (cloudsOn)
  {
    int cx = int(cloudCamPos.x);
    int cy = int(cloudCamPos.y);
    int cvx = int(abs(cloudCamVel.x));
    int cvy = int(abs(cloudCamVel.y));

    //noiseDetail(10, 0.3);
    noiseDetail(20, 0.5);

    xStartOffset = getOffset(int(cloudCamVel.x), width);
    yStartOffset = getOffset(int(cloudCamVel.y), height);

    generateNoiseX(clouds[1], xStartOffset, cvx, cx, cy, cloudMap);
    generateNoiseY(clouds[1], yStartOffset, cvy, cx, cy, cloudMap);

    clouds[0].updatePixels();
    clouds[1].updatePixels();

    image(clouds[1], 0, 0);
    swap(clouds);
  }

  int diff = millis() - t;
  lastTime = millis();

  if(showDebug){
    fill(0);
    text(diff + " ms", 40, 40);
    text(int(frameRate) + " FPS", 40, 60);
  }
}

int getOffset(int shift, int maxSize) {
  return shift > 0 ? 0 : maxSize - abs(shift);
}

void swap(PImage[] pArray) {
  PImage temp = pArray[0];
  pArray[0] = pArray[1];
  pArray[1] = temp;
}

