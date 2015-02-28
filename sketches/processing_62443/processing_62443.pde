
MultiLevelMatrix2D matrix;

int masterLevel = 0;
	
PImage tempFilter;
int tempThreshold = 60;
	
void setup() {
  size(512, 512, JAVA2D);
  matrix = new MultiLevelMatrix2D(8, 0, 0, 512, 512);

  registerMouseEvent(this);	
  	
  tempFilter = this.loadImage("ml.jpg");
  for (int ix = 0; ix < matrix.matrices.get(7).length; ix++) {
    for (int iy = 0; iy < matrix.matrices.get(7)[0].length; iy++) {
      if (iy < tempFilter.height && ix < tempFilter.width) {
        if (red(tempFilter.pixels[iy * tempFilter.width + ix]) < 60)
          matrix.matrices.get(7)[ix][iy].divide();
      }
    }
  }
}
	
void draw() {
  background(255);
  matrix.display();
}

void mouseEvent(MouseEvent event) {
  tempThreshold = (int)((float)mouseX / 512f * 256f);
  matrix.clear();
  for (int ix = 0; ix < matrix.matrices.get(7).length; ix++) {
    for (int iy = 0; iy < matrix.matrices.get(7)[0].length; iy++) {
      if (iy < tempFilter.height && ix < tempFilter.width) {
        if (red(tempFilter.pixels[iy * tempFilter.width + ix]) < tempThreshold)
          matrix.matrices.get(7)[ix][iy].divide();
      }
    }
  }
}

