
int x = 100;
int y = 100;
int z = 20;

int h = 20;
int w = 30;
float angle = 0;
float noiseScale=0.02;


void setup() {
  background(0);
  size(800, 800, P3D);
  noStroke();
  smooth();
}


void draw() {
  background(0);

  lights();
  directionalLight(0, 255, 255, 0, 0, -1);
  spotLight(255, 0, 0, width/2, height/2, 400, 0, 0, -1, PI/4, 2);
  
  
  noiseScale = mouseX/100;
  
  if (frameCount % 1 == 0) {
    fill(130, 200, 133);
    //    translate(x, y, z);
    //    rotateX(frameCount);
    //    rectMode(CENTER);  
    angle = angle+0.01;

    for (int i = 0; i < width+40; i+=35) {
      for (int j = 0; j < height+40; j +=35) {
        float randomAdd = random(float(mouseX)/230);

        
        spinningRect(i, j, 0, 0, angle+randomAdd);
      }
    }

    //rect(0, 0, w, h);
  }

}

void spinningRect(int xIn, int yIn, int rectPlacementX, int rectPlacementY, float angle) {
  pushMatrix();
  translate(xIn, yIn, z);
  rotateX(angle);
  rectMode(CENTER);
  rect(rectPlacementX, rectPlacementY, 30, 30);
  popMatrix();
}


