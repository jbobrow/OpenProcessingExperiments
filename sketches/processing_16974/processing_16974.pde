
// Emerging Lines //
//      By        //
//  Mistah Specs  //

void setup() {
  size(500, 500); //For OpenProcessing Viewing Only
  // Replace '(500, 500)' with '(screen.height, screen.height)'
  // and use Ctrl+Shift+R for present mode
  background(0);
  colorMode(HSB, 255);
}

void draw() {
  smooth();
  strokeWeight(3);
  int dx = mouseX;
  int dy = mouseY;

  //Left-Click for colored lines originating from the midpoints of the window edges
  if(mousePressed && (mouseButton == LEFT)) {
    stroke(random(255), 255, 255, 60);
    //First Series, To Mouse
    line(dx,dy, width/2,0);
    line(dx,dy,0, height/2);
    line(dx,dy,width/2,height);
    line(dx,dy,width,height/2);
    //Second Series, To Mouse Reflected Y
    line(width-dx,dy, width/2,0);
    line(width-dx,dy,0, height/2);
    line(width-dx,dy,width/2,height);
    line(width-dx,dy,width,height/2);
    //Third Series, To Mouse Reflected X
    line(dx,height-dy, width/2,0);
    line(dx,height-dy,0, height/2);
    line(dx,height-dy,width/2,height);
    line(dx,height-dy,width,height/2);
    //Fourth Series, To Mouse Reflected XY
    line(width-dx,height-dy, width/2,0);
    line(width-dx,height-dy,0, height/2);
    line(width-dx,height-dy,width/2,height);
    line(width-dx,height-dy,width,height/2);
  }
  //Right-Click for white lines originating from the window corners
  if(mousePressed && (mouseButton == RIGHT)) {
    stroke(random(255), 0, 255, 55);
    //First Series, To Mouse
    line(dx,dy, width,0);
    line(dx,dy,0, height);
    line(dx,dy,0,0);
    line(dx,dy,width,height);
    //Second Series, To Mouse Reflected Y
    line(width-dx,dy, width,0);
    line(width-dx,dy,0, height);
    line(width-dx,dy,0,0);
    line(width-dx,dy,width,height);
    //Third Series, To Mouse Reflected X
    line(dx,height-dy, width,0);
    line(dx,height-dy,0, height);
    line(dx,height-dy,0,0);
    line(dx,height-dy,width,height);
    //Fourty Series, To Mouse Reflected XY
    line(width-dx,height-dy, width, 0);
    line(width-dx,height-dy,0, height);
    line(width-dx,height-dy,0,0);
    line(width-dx,height-dy,width,height);
  }
  // Space Bar Clears
  if(keyPressed && (key == ' ')) {
    background(0);
  }
  delay(15);
}


