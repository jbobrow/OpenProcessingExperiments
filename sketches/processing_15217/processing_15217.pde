
class Engine {
  Fish fs;

  Fish[] fss;

  Engine() {
  }

  Engine(Fish fs) {
    this.fs = fs;
    fss = new Fish[1];
    fss[0] = fs;
  }



  void start() {
    for (int i=0; i<fss.length; i++) {
      fss[i].move();
      fss[i].display();
    }
  }
}



