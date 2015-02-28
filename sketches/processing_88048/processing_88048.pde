
int drawingRate = 5000; // 1000 = 1 second
int lineWidthMax = 5;
float backgroundOpacity = 50;
float drawingSizeRatio = 3/4.0;
float drawingTranslateRatio = (1.0 - drawingSizeRatio)/2.0;

void setup () {
  size(screen.width, screen.height);
  noCursor();
  smooth();
}

void draw () {
  fill(255, 255, 255, backgroundOpacity);
  strokeWeight(0);
  rect(0, 0, width, height);
  strokeWeight(random(0, lineWidthMax));
  translate(width*drawingTranslateRatio, height*drawingTranslateRatio);
  line(random(0, width*drawingSizeRatio),
       random(0, height*drawingSizeRatio),
       random(0, width*drawingSizeRatio),
       random(0, height*drawingSizeRatio));
  delay(drawingRate);
}
