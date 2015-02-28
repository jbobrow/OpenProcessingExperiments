
import eu.fluidforms.processing.*;

// Config - you will have to delete the savedState.txt file if you change this
int meshResolutionX = 150;
int movementDamper = 100;
float maxOffset = 100;
float minOffset = 0;
// End Config


PImage sourceImage;
float bestScore = Integer.MAX_VALUE;
int improvements = 0;
float[][] offsets;
float[][] bestOffsets;
float[][] offsetWeights;
float incX;// to be calculated
float incY;
int meshResolutionY;

void setup() {
  sourceImage = loadImage("CheSmall.jpg");
  //size(sourceImage.width, sourceImage.height, P3D);
  size(920, 470, P3D);

  setupDataStructure();
  loadData();  

  noStroke();
  FF.setup(this);
  FF.useDefaultLights(false);
  
  frameRate(10);
}

void setupDataStructure(){
  incX = (int)(width/meshResolutionX);
  incY = incX;
  meshResolutionY = (int)(height/incX);

  offsets = new float[meshResolutionX][meshResolutionY];
  bestOffsets = new float[meshResolutionX][meshResolutionY];
  offsetWeights = new float[meshResolutionX][meshResolutionY];
}

void draw() {
  pushMatrix();
  FF.navigation.resetMatrix();

  setupLight();

  if (!mousePressed) {
    moveVertices();
  }

  drawPlane();

  if (!mousePressed) {
    testFitness();
  } 
  else {
    rotateMesh();
  }
  popMatrix();


  if (keyPressed && !online) {
    saveFrame("MeshImageV2.png");
  }
}

void setupLight() {
  directionalLight(255, 255, 255, 0, 0, -1);
  lightFalloff(1, 20.0, 20.0);
}

void testFitness() {
  loadPixels();
  adjustOffsetWeights();
  adjustOffsets();
  updatePixels();
}

void rotateMesh() {
  pushMatrix();
  translate(width/2, 0);
  rotateY(sin((float)frameCount/50)/4);
  translate(-width/2, 0);
  drawPlane();
  popMatrix();
}

void moveVertices() {
  for (int x=1; x<offsets.length-1; x++) {
    for (int y=1; y<offsets[0].length-1; y++) {
      float offset = random(offsetWeights[x][y]);
      if (random(2)>1) {
        offset*=-1;
      }

      offsets[x][y] = bestOffsets[x][y] + offset;
      offsets[x][y] = min(maxOffset, offsets[x][y]);
      offsets[x][y] = max(minOffset, offsets[x][y]);
    }
  }
}

void drawPlane() {
  float thickness =  20;

  background(255);
  fill(255);

  float offsetX = 0f;
  if (false) {
    offsetX = -width/2;
  }

  for (int y=0; y<offsets[0].length-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x=0; x<offsets.length; x++) {
      vertex(x*incX + offsetX, y*incY, offsets[x][y]);
      vertex(x*incX + offsetX, (y+1)*incY, offsets[x][y+1]);
    }
    endShape();

    if (FF.isExporting()) {
      //draw bottom
      beginShape(TRIANGLE_STRIP);
      for (int x=0; x<offsets.length; x++) {
        vertex(x*incX + offsetX, (y+1)*incY, - thickness);
        vertex(x*incX + offsetX, y*incY, - thickness);
      }
      endShape();
    }
  }

  if (FF.isExporting()) {
    // right
    beginShape(TRIANGLE_STRIP);
    for (int y=0; y<offsets[0].length; y++) {
      int x = offsets.length - 1;
      vertex(x*incX + offsetX, y*incY, -thickness);
      vertex(x*incX + offsetX, y*incY, offsets[x][y]);
    }
    endShape();

    // left
    beginShape(TRIANGLE_STRIP);
    for (int y=0; y<offsets[0].length; y++) {
      int x = 0;
      vertex(x*incX + offsetX, y*incY, offsets[x][y]);
      vertex(x*incX + offsetX, y*incY, -thickness);
    }
    endShape();

    // bottom
    beginShape(TRIANGLE_STRIP);
    for (int x=0; x<offsets.length; x++) {
      int y = offsets[0].length - 1;
      vertex(x*incX + offsetX, y*incY, offsets[x][y]);
      vertex(x*incX + offsetX, y*incY, -thickness);
    }
    endShape();

    // top
    beginShape(TRIANGLE_STRIP);
    for (int x=0; x<offsets.length; x++) {
      int y = 0;
      vertex(x*incX + offsetX, y*incY, -thickness);
      vertex(x*incX + offsetX, y*incY, offsets[x][y]);
    }
    endShape();
  }
}


void adjustOffsetWeights() {
  for (int x=1; x<offsets.length-1; x++) {
    for (int y=1; y<offsets[0].length-1; y++) {

      int actualX = (int)screenX(x*incX, y*incY, offsets[x][y]);
      int actualY = (int)screenY(x*incX, y*incY, offsets[x][y]);

      float polygonShade = 0;
      float imageShade = 0;
      for (int i=0; i<incX; i++) {
        for (int j=0; j<incY; j++) {
          polygonShade += red(get(actualX + i, actualY + j));
          imageShade += red(sourceImage.get(actualX, actualY));
        }
      }
      float averagePolygonShade = polygonShade / (incX*incY);
      float averageImageShade = imageShade / (incX*incY);


      offsetWeights[x][y] = (float)abs(averageImageShade - averagePolygonShade) / movementDamper;
    }
  }
}

void adjustOffsets() {
  float score = 0;
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {
      score += abs((float)(red(get(x, y)) - red(sourceImage.get(x, y))));
    }
  }

  if (score<bestScore) {
    improvements++;
    println(improvements + ": " + (int)score + " at " + new Date());

    String sImprovement = "000000"+improvements;
    sImprovement = sImprovement.substring(sImprovement.length()-6);
    //saveFrame("saved/improvement"+sImprovement+".jpg");

    bestScore = score;
    //arraycopy(offsets, 0, bestOffsets, 0, offsets.length);
    for (int x=0; x<offsets.length; x++) {
      for (int y=0; y<offsets[0].length; y++) {
        bestOffsets[x][y] = offsets[x][y];
      }
    }
  }
}

void exit() {
  if(!online){
    println("Saving State...");
    String[] lines = new String[offsets.length+1];
    lines[0] = ""+(int)bestScore + "\t" + improvements;
    for (int x=0; x<bestOffsets.length; x++) {
      lines[x+1] = "";
      for (int y=0; y<bestOffsets[0].length; y++) {
        lines[x+1] += bestOffsets[x][y] + "\t";
      }
    }
    saveStrings("savedState.txt", lines);
  }
  super.exit();
}

void loadData() {
  boolean restor = true;
  String[] savedLines = loadStrings("savedState.txt");
  if (savedLines==null) {
    restor = false;
  }
  else {
    String[] scoreData = savedLines[0].split("\t");
    bestScore = Integer.parseInt(scoreData[0]);
    improvements = Integer.parseInt(scoreData[1]);
  }

  float val = 0;
  for (int x=1; x<offsets.length; x++) {
    String[] savedValues = null;
    if (restor) {
      savedValues = savedLines[x].split("\t");
    }
    for (int y=0; y<offsets[0].length; y++) {
      if (restor) {
        val = Float.parseFloat(savedValues[y]);
      }
      offsets[x-1][y] = val;
      bestOffsets[x-1][y] = val;
      offsetWeights[x-1][y] = 1;
    }
  }
}


color get(int x, int y) {
  //return super.get(x, y);
  int i = y*width+x;
  i = max(0, i);
  i = min(pixels.length-1, i);
  return pixels[i];
}


