
class navConsole {

  int genX;
  int genY;
  int mod;
  navConsole(int oX, int oY, int module) {

    genX = oX;
    genY = oY;
    mod = module;
  }

  void update() {

    navigation.allowPanButton(false);
    navigation.allowZoomButton(false);

    navigation.setZoomScale(zoomer);
    navigation.setPanOffset(panX, panY);
  }

  void display() {

    fill(0, 100);
    noStroke();  
    rect(genX, genY, 3.5*mod, 2.5*mod);
    stroke(255);
    strokeWeight(1);
    line(9*(mod/4), 2*(mod/4), 9*(mod/4), 8*(mod/4));


    navigator in = new navigator( 11*(mod/4), 3*(mod/4), mod/4);
    in.zoomIn(mouseX, mouseY);

    navigator out = new navigator( 11*(mod/4), 7*(mod/4), mod/4);
    out.zoomOut(mouseX, mouseY);

    navigator up = new navigator(5*(mod/4), 7*(mod/4), mod/4);
    up.panUp(mouseX, mouseY);

    navigator down =  new navigator(5*(mod/4), 3*(mod/4), mod/4);
    down.panDown(mouseX, mouseY);

    navigator right =  new navigator(3*(mod/4), 5*(mod/4), mod/4);
    right.panRight(mouseX, mouseY);

    navigator left = new navigator(7*(mod/4), 5*(mod/4), mod/4);
    left.panLeft(mouseX, mouseY);
  }
}


