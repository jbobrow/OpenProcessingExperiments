

Landscape land;

float theta = 0.0;
int[] c = new int[50];
void setup() {
  size(800, 800, P3D);
  land = new Landscape(5, 800, 800);
  

}

void draw() {

  translate(-3, 2, -652);
  background(9);
  
  translate(width/2, height/2, 0);
  pushMatrix();
  if (mousePressed==true) {
    rotateX(map(mouseY, 0, height, 0, PI*2));
    rotateY(map(mouseX, 0, height, 0, PI*2));
  } else {
    rotateX(0);
    rotateY(0);
  }
  // rotateZ(theta);
  land.render(); 
  popMatrix();

  land.calculate();

  theta += 0.0050;
}
class Landscape {
  int cellSize;
  int w, h;
  int rows, cols;
  float zoff = 0.0;
  float [][] z;
  int sliderValue = 100;

  float pulse;
  Landscape(int _cellSize, int _w, int _h) {
    cellSize = _cellSize;
    w = _w;
    h = _h;
    cols = w/cellSize;
    rows = h/cellSize;
    z = new float[cols][rows];


  }

  void calculate() {
    float xoff = 0;
    for (int i = 0; i < cols; i++) {

      float yoff = 0;
      for (int j = 0; j < rows; j++) {

        z[i][j] = map(noise(xoff, yoff, zoff), 0, 1, 16, 307);
        yoff += 0.08;
      }
      xoff += 0.08;
    }
    zoff += .03;
  }

  void render() {

  

    lights();
    for (int i = 0; i <z.length; i++) {
      float c;
      c = map(cos(frameCount*0.1), -1, 1, 100, 255);
      fill(c+i*5, z[i][i]);
      z[i][i]--;
      println(z[i][i]);
    }
    for (int x = 0; x < z.length-1; x++) {
      for (int y = 0; y < z[x].length-1; y++) {
        noStroke();
        translate(0, 0, 0);
        rotateX(.00005);
        rotateY(.00005);
        pushMatrix();
        
        beginShape(QUADS);
        translate(x*cellSize-w/2, y*cellSize-h/2, 0);
        vertex(0, 0, z[x][y]);
        vertex(cellSize, 0, z[x+1][y]);
        vertex(cellSize, cellSize, z[x+1][y+1]);
        vertex(0, cellSize, z[x][y+1]);
        endShape();

        popMatrix();
      }
    }
  }
}


