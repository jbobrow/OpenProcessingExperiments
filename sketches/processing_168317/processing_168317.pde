
float resolution = 5.00;
float noiseMod = 10.0;
float noiseMin = 1.0;
float noiseMax = 200.0;
float triFadeDurationMin = 0.4;
float triFadeDurationMax = 1.0;
float fadeDelay = 2.0;
float triFadeDelayMin = -1.0;
float triFadeDelayMax = 1.0;
int framerate = 25;
boolean highContrast = true;
boolean interactive = false;
boolean invert = false;

//Internals
boolean record = false;
int frameCounter;
int numHorizPoints;
int numVertPoints;
TriFace[][] triangles;

void setup() {
  size(640, 360, P2D);
  setResolution(resolution);
  createGrid();
}

void setResolution(float res) {
  float gridRes = max(1.0, res);
  numHorizPoints = round(gridRes * 16.0);
  numVertPoints = round(gridRes * 9.0);
  triangles = new TriFace[numVertPoints][numHorizPoints * 2 - 1];
}

void createGrid() {
  PVector[][] vertices = new PVector[numVertPoints][numHorizPoints];

  for (int row = 0; row < numVertPoints; row++) {
    for (int col = 0; col < numHorizPoints; col++) {
      float colOffset = (row % 2 == 0) ? 0.0 : width / numHorizPoints * 0.5;
      vertices[row][col] = new PVector(col * width / numHorizPoints + colOffset, row * height / numVertPoints);
    }
  }

  for (int row = 0; row < numVertPoints-1; row++) {
    for (int col = 0; col < numHorizPoints-1; col++) {
      int colOffset = ((row) % 2 == 0) ? 0 : 1;

      float timelength = map(noise((float)row/(float)numVertPoints * noiseMod, (float)col/(float)numHorizPoints * noiseMod), 0.0, 1.0, triFadeDurationMin, triFadeDurationMax);
      float delay = (float)row/(float)triangles.length * fadeDelay+ map(noise((float)row/(float)numVertPoints * noiseMod, (float)col/(float)numHorizPoints * noiseMod), 0.0, 1.0, triFadeDelayMin, triFadeDelayMax);
      TriFace topTri = new TriFace(timelength, delay);
      PVector a = vertices[row][col];
      PVector b = vertices[row][col+1];
      PVector c = vertices[row+1][col+colOffset];
      topTri.build(a, b, c);
      triangles[row][col*2] = topTri;

      timelength = map(noise((float)row/(float)numVertPoints * noiseMod, (((float)col)+0.5)/(float)numHorizPoints * noiseMod), 0.0, 1.0, triFadeDurationMin, triFadeDurationMax);
      delay = (float)row/(float)triangles.length * fadeDelay+ map(noise((float)row/(float)numVertPoints * noiseMod, (((float)col)+0.5)/(float)numHorizPoints * noiseMod), 0.0, 1.0, triFadeDelayMin, triFadeDelayMax);
      TriFace botTri = new TriFace(timelength, delay);
      a = vertices[row+1][col];
      b = vertices[row+1][col+1];
      c = vertices[row][col+1-colOffset];
      botTri.build(a, b, c);
      triangles[row][col*2+1] = botTri;
    }
  }
}

void draw() {
  background(0);
  int frameProgress = (interactive) ? (int)(((float)mouseY / height) * ((fadeDelay + triFadeDelayMax + triFadeDurationMax) * 25)) : frameCounter;


  if (mousePressed && (mouseButton == LEFT)) {
    noiseMod = map((float)mouseX / width, 0.0, 1.0, noiseMin, noiseMax);
    createGrid();
  }

  for ( int row = 0; row < triangles.length; row++) {
    for ( int col = 0; col < triangles[row].length; col++) {
      if ( triangles[row][col] != null) {
        triangles[row][col].update( frameProgress );
      }
    }
  }

  if (record)
    saveFrame("fade-####.png");

  if (++frameCounter > (fadeDelay + triFadeDelayMax + triFadeDurationMax) * framerate && !interactive) {
    frameCounter = 0;
    invert = !invert;
  }
}

void mouseClicked() {
  if (mouseButton == RIGHT) {
    highContrast = !highContrast;
    createGrid();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      resolution += 0.5;
    } else if (keyCode == DOWN) {
      resolution -= 0.5;
    } else if (keyCode == LEFT) {
      fadeDelay -= 1.0;
    } else if (keyCode == RIGHT) {
      fadeDelay += 1.0;
    }
  }
  if (key == ' ') {
    interactive = !interactive;
  } else if ( key == 'r') {
    record = !record;
  }

  setResolution(resolution);
  createGrid();
}



class TriFace {
  PVector[] vertices;
  float fade = 0.0;
  int duration;
  int delay;
  color tintColor;

  TriFace(float timeLength, float timeDelay) {
    vertices = new PVector[3];
    duration = round(timeLength * (float)framerate);
    delay = round(timeDelay * (float)framerate);
  }

  void build(PVector a, PVector b, PVector c) {
    vertices[0] = a;
    vertices[1] = b;
    vertices[2] = c;
  }

  void update(int frame) {

    //if (frame >= delay && fade < 1.0) {
    if (frame >= delay) {
      fade = min(1.0, max(0.0, norm(frame - delay, 0, duration)));
    } else {
      fade = 0.0;
    }

    //if (triShape != null) {   
    noStroke();
    float lerpAmt = (invert) ? 1.0 - fade : fade;
    if (highContrast) {
      fill(255 * int(lerpAmt));
    } else {
      fill(lerpColor(color(0), color(255), lerpAmt));
    }
    triangle(vertices[0].x, vertices[0].y, vertices[1].x, vertices[1].y, vertices[2].x, vertices[2].y);
  }
}

