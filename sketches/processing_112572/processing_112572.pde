
PImage img;
int bandNumber = parseInt(random(40));
int[] xValues = new int[20];
color[] colors = new color[20];
float randomizer = 0;
int counter = 0;
int nextX = 0;
int nextXW = 0;
boolean loop = true;


void setup(){
  size(800,500);
  img = loadImage("http://www.clintonmckayart.com/Painter/painting.jpg");
  frameRate(10);
}

void draw() {
    setWidths();
  setColors();
  randomizer = random(1);
  nextX = xValues[counter];
  nextXW = xValues[(counter)+1] - xValues[counter];
  if (randomizer < .5){
    noStroke();
    fill(colors[counter]);
    tint(255,80);
    rect(nextX, 0, nextXW, height);
  }
  if (randomizer >= .4) {
    tint(255, random(255));
    image(img, xValues[counter], 0, img.width, height, xValues[counter], 0, parseInt(random(img.width * .006)), height);
  }
  counter++;
 
}

void setColors(){
  for (int i = 0; i < colors.length; i++){tint(255,126);colors[i]= img.get(parseInt(random(width)), parseInt(random(height)));
  }
}

void setWidths(){
    for (int i = 0; i < xValues.length; i++){
  xValues[0] = 0;
  if (i > 0){
  xValues[i] = parseInt(random(60) + xValues[i-1]);
  }
  }
}


void mousePressed(){
  if (loop == true){
    noLoop();
    loop = false;
  }
   else{
    loop();
    loop = true;
  }
}
