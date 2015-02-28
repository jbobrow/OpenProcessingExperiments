

//edit variables 

float shade = 255;
float outline = 128;
float shadeincrease = -.55;
float sWeight = .25;

float linespacing = 10;
float accelerator = 1.01;
float xspacing = 1;
float xRandom = .025;
float yRandom = .05;
int wide = 500;
int tall = wide*16/9;
int points = 50;

//declare arrays
float [] xArray = new float [points];
float [] yArray = new float [points];
float [] xArrayNew = new float [points];
float [] yArrayNew = new float [points];

void setup () {
  size (wide, tall);
  background (255);
  smooth ();
  
  //populate arrays
  for (int i = 0; i < points; i++) {
    xArray[i] = i-(points/2);
  }
  for (int i = 0; i < points; i++) {
    yArray[i] = 0;
  }
  
  //sky
  for (int i = 0; i < 100; i++) {
    stroke (212+i/2);
    line (0,i,wide,i);
  }
  
}

void draw () {
  
  for (int i = 0; i < 100; i++) {
    stroke (212+i/2);
    line (0,i,wide,i);
  }
  
  translate (wide/2, tall-wide*1.615);
  
  //adjust arrays
  for (int i = 0; i < points; i++) {
    xArrayNew[i] = xArray[i] + random (-xRandom,xRandom);
  }
  for (int i = 0; i < points; i++) {
    yArrayNew[i] = yArray[i] + random (-yRandom,yRandom);
  }
  
  fill (shade);
  stroke (shade+5);
  strokeWeight (sWeight);
  
  beginShape ();
  vertex (-500,tall*2);
  for (int i = 0; i < points; i++) {
    curveVertex (xspacing*11*xArrayNew[i], linespacing+11*yArrayNew[i]);
  }
  vertex (500,tall*2);
  endShape ();
  
  //reset arrays
  for (int i = 0; i < points; i++) {
    xArray[i] = xArrayNew[i];
  }
  for (int i = 0; i < points; i++) {
    yArray[i] = yArrayNew[i];
  }
  
  //accelerate
  linespacing = linespacing*accelerator;
  xspacing = xspacing*accelerator;
  yRandom = yRandom*accelerator;
  
  //design change
  shade = shade+shadeincrease;
  outline = outline-shadeincrease;
  sWeight = random (.25, yRandom*2);
  
  /*
  //safety
  int sum = 0;
  for (int i = 0; i < points; i++) {
    sum += yArray[i];
   }
  
  if (sum > 100) {
    noLoop ();
  }
  */
  
  //safety
  int safety = millis ();
  if (safety > 7500) {
    noLoop ();
  }
}

void mouseClicked () {
  noLoop ();
}

