
class Background {

  float x, y;
  float nx, ny;

  Background(float nx, float ny) {
    x = nx;
    y = ny;
  }

  void display() {
    fill(0, y*.6);
    rect(-width, -height, width*2, height*2);

    // Ground
    fill(60, 180, 100);
    noStroke();
    rect(0, height-100, width, 100);

    //Sound filters beased off of sun coords
    float passBand = map(y, 0, width, 100, 2000);
    bpf.setFreq(passBand);
    float bandWidth = map(x, 0, height, 50, 500);
    bpf.setBandWidth(bandWidth);
    //bpf.printCoeff();
  }
}


