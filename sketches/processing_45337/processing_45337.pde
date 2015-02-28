


import processing.pdf.*;
boolean savePDF = false;

int octaves = 3;
float falloff = 0.5;

color arcColor = color(0,130,164,100);

float tileSize = 40;
int gridResolutionX, gridResolutionY;
boolean debugMode = true;
PShape arrow;

void setup() {

  size(800,600); 
  cursor(CROSS);
  gridResolutionX = round(width/tileSize);
  gridResolutionY = round(height/tileSize);
  smooth();
  arrow = loadShape("arrow.svg");
}

void draw() {
  
  background(255);
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  noiseDetail(octaves,falloff);
  float noiseXRange = mouseX/50.0;
  float noiseYRange = mouseY/10.0;

  for (int gY=0; gY<= gridResolutionY; gY++) {  
    for (int gX=0; gX<= gridResolutionX; gX++) {
      float posX = tileSize*gX;
      float posY = tileSize*gY;

      // get noise value
      float noiseX = map(gX, 0,gridResolutionX, 0,noiseXRange);
      float noiseY = map(gY, 0,gridResolutionY, 0,noiseYRange);
      float noiseValue = noise(noiseX,noiseY);
      float angle = noiseValue*TWO_PI;

      pushMatrix();
      translate(posX,posY);

      // debug heatmap
      if (debugMode) {
        noStroke();
        ellipseMode(CENTER);
        fill(noiseValue*255);
        ellipse(0,0,tileSize*25,tileSize*0.5);
      }



      // arrow
      stroke(0);
      strokeWeight(0.75);
      rotate(angle);
      shape(arrow,0,0,tileSize*0.75,tileSize*0.75);
      popMatrix();
    }
  }

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
  println("octaves: "+octaves+" falloff: "+falloff+" noiseXRange: 0-"+noiseXRange+" noiseYRange: 0-"+noiseYRange); 
}

void keyReleased() {  
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_####.png");
  if (key == 'p' || key == 'P') savePDF = true;
  if (key == 'd' || key == 'D') debugMode = !debugMode;
  if (key == ' ') noiseSeed((int) random(100000));
}

void keyPressed() {
 // if (key == ' ') {
 //   mm.finish();  // Finish the movie if space bar is pressed!
 // }
  if (keyCode == UP) falloff += 0.05;
  if (keyCode == DOWN) falloff -= 0.05;
  if (falloff > 1.0) falloff = 1.0;
  if (falloff < 0.0) falloff = 0.0;

  if (keyCode == LEFT) octaves--;
  if (keyCode == RIGHT) octaves++;
  if (octaves < 0) octaves = 0;
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}




