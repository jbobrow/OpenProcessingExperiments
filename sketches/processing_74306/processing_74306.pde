
// load/run
void loadLevel(String filename) {
  // make player rocket
  makeRocket(0,0);
  // load map image
  PImage mapImage = loadImage(filename);
  // loop through pixels
  for(int x = 0; x < mapImage.width; x++) {
    for(int y = 0; y < mapImage.height; y++) {
      color c = mapImage.get(x,y);
      float sx = float(width)/mapImage.width;
      float sy = float(height)/mapImage.height;
      // block tiles
      if(c == color(0,0,0)) {
        FBox bx = new FBox(sx,sy);
        bx.setStatic(true);
        bx.setPosition(x*sx + sx/2,y*sy + sy/2);
        bx.setFill(0);
        bx.setNoStroke();
        world.add(bx);
      }
      // angled tiles
      if(c== color(237,28,36) || c== color(255,242,0) || c== color(34,177,76) || c== color(0,162,232)) {
        FPoly bx = new FPoly();
        bx.vertex(sx/2,sy/2);
        bx.vertex(-sx/2,-sy/2);
        bx.vertex(sx/2,-sy/2);
        bx.setFill(0);
        bx.setNoStroke();
        bx.setStatic(true);
        bx.setPosition(x*sx + sx/2,y*sy + sy/2);
        if(c== color(237,28,36)) bx.setRotation(0.0);
        if(c== color(255,242,0)) bx.setRotation(-PI/2);
        if(c== color(34,177,76)) bx.setRotation(PI/2);
        if(c== color(0,162,232)) bx.setRotation(PI);
        world.add(bx);
      }
      // target platform
      if(c== color(255,201,14)) {
        target = new FPoly();
        target.vertex(3*sx/2,-sy/2);
        target.vertex(-3*sx/2,-sy/2);
        target.vertex(-sx/2,sy/2);
        target.vertex(sx/2,sy/2);
        target.setFill(0);
        target.setNoStroke();
        target.setStatic(true);
        target.setPosition(x*sx + sx/2,y*sy + sy/2);
        world.add(target);
      }            
      // player position
      if(c == color(255,174,201)) {
        rocket.setPosition(x*sx + sx/2,y*sy + sy/2);
      }
    }
  }
}

void runLevel() {
  if(keys[82]) {world.clear(); loadLevel(level);}
  // stars
//  for(int i = 0; i < 3; i++) {
//    stars[i].update();
//  }
}

