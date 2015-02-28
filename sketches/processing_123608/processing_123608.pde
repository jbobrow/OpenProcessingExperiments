
void setup() {
  size(960, 120);
  background(0);
  frameRate(25);
}
float x=width/6;
float y=height/6;
float xchange=1;
float ychange=1;
void draw() {
if(focused){            //firstlaserbeamz
  stroke(#05EBF5, 10);
  y+=random(0, 20)*ychange;
  x+=random(0, 20)*xchange;
  line(width/7, height, x, y);
  if (x<0||x>width/6) {
    xchange*=-1;
  }
  if (y<0||y>height/7) {
    ychange*=-1;
  }
  if (keyPressed) {
    saveFrame("wallpaper-####.tif");
  }
  }
  
  
  
  if(focused){            //secondlaserbeamz
  stroke(#FF0505, 15);
  y+=random(0, 20)*ychange;
  x+=random(0, 20)*xchange;
  line(width/5, height, x, y);
  if (x<4||x>width/6) {
    xchange*=-1;
  }
  if (y<4||y>height/7) {
    ychange*=-1;
  }
  if (keyPressed) {
    saveFrame("wallpaper-####.tif");
  }
  }
  
  
  
  if(focused){            //thirdlaserbeamz
  stroke(#00FF0E, 15);
  y+=random(0, 20)*ychange;
  x+=random(0, 20)*xchange;
  line(width/4, height, x, y);
  if (x<8||x>width/6) {
    xchange*=-1;
  }
  if (y<=8||y>height/7) {
    ychange*=-1;
  }
  if (keyPressed) {
    saveFrame("wallpaper-####.tif");
  }
  }
  
  
  if(focused){            //studentlaserbeamz
  stroke(#FF00E6, 15);
  y+=random(0, 20)*ychange;
  x+=random(0, 20)*xchange;
  line(width/3, height, x, y);
  if (x<12||x>width/6) {
    xchange*=-1;
  }
  if (y<=12||y>height/7) {
    ychange*=-1;
  }
  if (keyPressed) {
    saveFrame("wallpaper-####.tif");
  }
  }
}





