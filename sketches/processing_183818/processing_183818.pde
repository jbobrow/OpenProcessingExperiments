
import controlP5.*;

Landscape land;
ControlP5 cp5;

float theta = 0.0;
int[] c = new int[50];

//----GUI silers----//
float sliderValue = 0;
float level = 255;
float magnitude = 0.03;
float spinX = 0;


void setup() {
  size(800, 800, P3D);
  land = new Landscape(5, 800, 800);
  cp5 = new ControlP5(this);
  
      cp5.addSlider("sliderValue")
    .setRange(-.0005, .0005)
      .setValue(0.0)
        .setPosition(11, 678)
          .setSize(30, 102)
            ;

  cp5.addSlider("level")
    .setRange(-170, 637)
      .setValue(255)
        .setPosition(12, 279)
          .setSize(30, 102)
            ;
  cp5.addSlider("magnitude")
    .setRange(0, 1.00)
      .setValue(0.05)
        .setPosition(12, 542)
          .setSize(30, 102)
            ;
  cp5.addSlider("spinX")
    .setRange(-.0005, .0005)
      .setValue(0)
        .setPosition(12, 406)
          .setSize(30, 102)
            ;


}

void draw() {


  translate(0, 0, 0);
  background(9);
  
  pushMatrix();
  translate(452, 510, -701);
  rotateX(1);
  rotateZ(theta);
  land.render(sliderValue, spinX); 
  popMatrix();
  land.calculate(level, magnitude);
  theta += 0.0070;
}
class Landscape {
  int cellSize;
  int w, h;
  int rows, cols;
  float zoff = 0.0;
  float [][] z;
 
  
  float rot = color(0,0,0);
  float pulse;

  Landscape(int _cellSize, int _w, int _h) {
    cellSize = _cellSize;
    w = _w;
    h = _h;
    cols = w/cellSize;
    rows = h/cellSize;
    z = new float[cols][rows];
    
  }

  void calculate(float _level, float _mag) {
    level = _level;
    magnitude  = _mag;
    float xoff = 0;
    for (int i = 0; i < cols; i++) {

      float yoff = 0;
      for (int j = 0; j < rows; j++) {

        z[i][j] = map(noise(xoff, yoff, zoff), 0, 1, 179, level);
        yoff += -0.05;
      }
      xoff += 0.02;
    }
    zoff += magnitude;
  }

  void render(float _sliderValue, float _spinX) {
      sliderValue = _sliderValue;
      spinX = _spinX;
     
    lights();
    for (int i = 0; i <z.length; i++) {
      float c;
      c = map(cos(frameCount*0.1), -1, 1, 100, 255);
      fill(c+i*5, c);
      z[i][i]--;
      println(z[i][i]);
    }
    for (int x = 0; x < z.length-1; x++) {
      for (int y = 0; y < z[x].length-1; y++) {
        noStroke();
        translate(0, 0, 0);
        rotateX(spinX);
        rotateY(sliderValue);
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

void keyPressed() {
  cp5.getController("sliderValue");
  cp5.getController("level");
  cp5.getController("magnitude");
  cp5.getController("spinX");
}


