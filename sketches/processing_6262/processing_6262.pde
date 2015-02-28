
PVector vertexs[][]; // the vertex array for the planet
float terrain[][]; // the terrain map
int size = 128; // size must be power of two 2^n
float roughtness = 4f; // for the terrain
PGraphics sky;
float rotation;
float rotationMoon;
boolean jump = false;
float jumpstep=0;
float jumpangle = 0;

void setup() {
  size(512, 512, P3D);
  colorMode(HSB, 255);
  sky = createGraphics(width,height,P2D);
  noStroke();
  background(0);
  makeWorld();
  makeSky();
}

void makeSky() {
  sky.beginDraw();
  for (int i=0; i<200; i++) {
    sky.fill(0,random(255),255);
    int size = (int)random(5);
    sky.ellipse(random(width),random(height),size,size);
  }
  sky.endDraw();
}

void makeWorld() {
  terrain = new float[size + 1][size + 1];
  // seeding the borders of the array with the same value, because we trying to get a polar wrap.
  float seed = random(0.5f);
  for (int i = 0; i < size + 1; i++) {
    terrain[i][0] = terrain[i][size] = terrain[0][i] = terrain[size][i] = seed;
  }
  // make a fractal terrain
  makeTerrain();
  // initialize vertex list using polar coordinates
  vertexs = new PVector[size + 1][size + 1];
  for (int i = 0; i <= size; i++) {
    float angleV = (i * (180f / size)) * (PI / 180); // vertical angle
    for (int j = 0; j <= size; j++) {
      float angleH = (j * (360f / size)) * (TWO_PI / 360); // horizontal angle
      float altitude = terrain[i][j] < 0.4f ? 0.4f : terrain[i][j];
      vertexs[i][j] = new PVector();
      vertexs[i][j].x = (float) ((512 + (altitude * 128)) * cos(angleH) * sin(angleV));
      vertexs[i][j].y = (float) ((512 + (altitude * 128)) * sin(angleH) * sin(angleV));
      vertexs[i][j].z = (float) ((512 + (altitude * 128)) * cos(angleV));
    }
  }
}

void draw() {

  background(sky);
  // let's jump to space !
  if (mousePressed) jump = true;
  if (jump) { // space jump
    jumpangle = map(cos(radians(jumpstep)),1,-1,radians(50),radians(10));
    jumpstep = (jumpstep > 360) ? 0 : jumpstep + 10;
    if (jumpstep == 0 ) jump = false;
  } 
  else {
    jumpangle = radians(50);
  }
  // the view angle controls the camera
  camera((1/sin(jumpangle))*512,1f,1f,0,-((1/cos(jumpangle))*512),0,0f,1f,0);
  // P1.0.9 bug workaround...
  ((PGraphics3D) g).cameraNear = -8;

  rotateZ(map(mouseY, 0, height, -PI, PI));
  rotateX(map(mouseX, 0, width, PI, -PI));
  ambientLight(0, 0, 64);
  // Galileo, you are wrong! its the sun that rotates around the earth...
  pushMatrix();
  rotateZ(rotation+=PI/128);
  directionalLight(0, 0, 255, -1, 0, 0);
  popMatrix();
  // draw a little gray moon...
  pushMatrix();
  fill(128); 
  rotateZ(rotationMoon+=PI/512);
  translate(-2048,0,0);
  sphere(128);
  popMatrix();
  // draw the planet...
  for (int i = 0; i <= size; i++) {
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j <= size; j++) {
      if (i > 0) {
        float c = terrain[i - 1][j] < 0.4f ? 255 - (0.4f * 255)	: 255 - (terrain[i - 1][j] * 255);
        float snow = terrain[i][j] > 0.80f ? 255 - (terrain[i][j] * 255): 255;
        fill(c, snow, 255);
        vertex(vertexs[i - 1][j].x, vertexs[i - 1][j].y, vertexs[i - 1][j].z);
      }
      // use the terrain height to get the color
      // bellow a point its the ocean, so we paint blue
      float c = terrain[i][j] < 0.4f ? 255 - (0.4f * 255)	: 255 - (terrain[i][j] * 255);
      // I like snow... :)
      float snow = terrain[i][j] > 0.80f ? 255 - (terrain[i][j] * 255) : 255;
      fill(c, snow, 255);
      vertex(vertexs[i][j].x, vertexs[i][j].y, vertexs[i][j].z);
    }
    endShape();
  }
}

void keyPressed() {
  if (key == ' ') {
    makeWorld();
  }
}

// This will make a fractal terrain, using the diamond/square algorythm.
// The terrain array MUST have a size of power of 2 + 1 (2^n + 1), for this to work.
// Will check if values are not zero, for "seeding" purposes...
// Final values, will be between 0 and 1;
// http://gameprogrammer.com/fractal.html
void makeTerrain() {
  float roughtscale;
  if (terrain[0][0] == 0) {
    terrain[0][0] = random(1);
  }
  if (terrain[0][terrain.length - 1] == 0) {
    terrain[0][terrain.length - 1] = random(1);
  }
  if (terrain[terrain.length - 1][0] == 0) {
    terrain[terrain.length - 1][0] = random(1);
  }
  if (terrain[terrain.length - 1][terrain.length - 1] == 0) {
    terrain[terrain.length - 1][terrain.length - 1] = random(1);
  }

  roughtscale = roughtness;

  for (int size = terrain.length - 1; size > 1; size = size >> 1) {
    roughtscale = roughtscale * 0.5f;
    int halfsize = (size) >> 1;
    // do the diamond part...
    for (int i = 0; i < terrain.length - 1; i += size) {
      for (int j = 0; j < terrain.length - 1; j += size) {
        // pick the four corners of the square
        float a = terrain[j][i];
        float b = terrain[j][i + size];
        float c = terrain[j + size][i];
        float d = terrain[j + size][i + size];
        // average them and add a randomness perturbation
        if (terrain[j + halfsize][i + halfsize] == 0) {
          terrain[j + halfsize][i + halfsize] = max(min(((a + b + c + d) / 4)	+ random(-roughtscale, roughtscale), 1), 0);
        }
      }
    }
    // do the square part...
    for (int i = 0; i < terrain.length - 1; i += size) {
      for (int j = 0; j < terrain.length - 1; j += size) {
        float a = terrain[j][i];
        float b = terrain[j][i + size];
        float c = terrain[j + size][i];
        float d = terrain[j + size][i + size];
        float center = terrain[j + halfsize][i + halfsize];

        // diamond coordinates
        int dy1 = j - halfsize;
        int dy2 = j + halfsize;
        int dy3 = j + size + halfsize;
        int dy4 = j + halfsize;

        int dx1 = i + halfsize;
        int dx2 = i + size + halfsize;
        int dx3 = i + halfsize;
        int dx4 = i - halfsize;

        dy1 = dy1 < 0 ? j + halfsize : dy1;
        dy3 = dy3 > terrain.length - 1 ? j + halfsize : dy3;
        dx4 = dx4 < 0 ? i + halfsize : dx4;
        dx2 = dx2 > terrain.length - 1 ? i + halfsize : dx2;

        // pick the four corners of the diamond
        float da = terrain[dy1][dx1];
        float db = terrain[dy2][dx2];
        float dc = terrain[dy3][dx3];
        float dd = terrain[dy4][dx4];

        // create the square, with their average and a randomness
        // perturbation
        if (terrain[j][i + halfsize] == 0) {
          terrain[j][i + halfsize] = max( min(((a + b + center + da) / 4)	+ random(-roughtscale, roughtscale), 1),	0);
        }
        if (terrain[j + halfsize][i + size] == 0) {
          terrain[j + halfsize][i + size] = max(min(((b + d + center + db) / 4) + random(-roughtscale, roughtscale), 1), 0);
        }
        if (terrain[j + size][i + halfsize] == 0) {
          terrain[j + size][i + halfsize] = max(min(((c + d + center + dc) / 4) + random(-roughtscale, roughtscale), 1), 0);
        }
        if (terrain[j + halfsize][i] == 0) {
          terrain[j + halfsize][i] = max(min(((a + c + center + dd) / 4) + random(-roughtscale, roughtscale), 1),	0);
        }
      }
    }
  }
}



