

float margin = 220;

float xnoise, ynoise, znoise;
float xstart, ystart, zstart;
float seednoise, zoom;

void setup() {
  size(640, 480, P3D);
//  pgl = (PGraphicsOpenGL) g;
//  gl = pgl.gl;
//  initSyphon(gl, "processing");

  xstart = 0;
  ystart = 0;
  zstart = 0;
  seednoise = random(10);
  zoom = 0;

  noStroke();
}

void clearBackground() {
  background(255);
}

void draw() {
  
  clearBackground();

  seednoise += 0.01;
  if (zoom > -1600) { 
    zoom -= 4;
  }

  // Centra y gira
  translate(width/2, height/2, zoom);
  rotateY(frameCount * 0.02);
  rotateX(frameCount * 0.01);
  rotateZ(frameCount * 0.005);

  xstart = noise(seednoise) * 10;
  ystart = xstart;
  zstart = ystart;

  xnoise = xstart;
  float inc = 0.1;

  // Construye la cuadricula usando multiples transformaciones
  for (float i =- 2600+margin; i <= 2000-margin; i += margin) {
    pushMatrix();
    xnoise += inc;
    ynoise = ystart;

    for (float j =- 2600+margin; j <= 2000-margin; j += margin) {
      pushMatrix();
      ynoise += inc;
      znoise = zstart;
      
      for (float k =- 1000+margin; k <= 1000-margin; k += margin) {
        pushMatrix();
        znoise += inc;
        
        float boxW = noise(xnoise, ynoise, znoise) * 255;
        float boxH = noise(xnoise, ynoise, znoise) * 500;
        float boxD = noise(xnoise, ynoise, znoise) * 100;
        
        float gr = 255 - boxW;

        float alph = boxW;
        if (alph > 100) {
          translate(k, j, i);
          if (alph > 150) {
            fill(boxD*2, 0, 0, 35);
          } 
          else {
            fill(20, gr + 50, 200, 35);
          }
          box(boxW, boxH, boxD);
        }

        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }
  //renderTexture(pgl.gl);
}



