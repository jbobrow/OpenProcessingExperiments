
PImage bild;

void setup (){
  size (800, 928);
  smooth();
  noCursor();
  bild = loadImage ("ohdeer.jpg");
  }

void draw() {
  background(bild);
  
  if (mousePressed) {
  for ( int x = 0; x <= width; x+=10) {
   for ( int y = 0; y <= height; y+=10) {
  float durchmesser = 20-dist(mouseX, mouseY, x, y)/20;
        durchmesser += dist(width/2, height/2, x, y)/20;
        if (durchmesser > 0) {
        pushMatrix();
        translate(x,y);
        float a = atan2(mouseY-height/2, mouseX-width/2);
        rotate(a/2);
        fill(bild.pixels[bild.width*y]);
        triangle(0, 0, durchmesser, durchmesser*2,8,16);
        popMatrix();
      }
    }
  }
}

  
  else {
    for ( int x=0; x<= width; x+=5) {
      for ( int y=0; y<=height; y+=5) {
        float durchmesser = 20-dist(mouseX, mouseY, x, y)/20;
        durchmesser += dist(width/2, height/2, x, y)/20;
        if (durchmesser > 0) {
          strokeWeight(durchmesser/30);
          stroke (bild.pixels[(x + width)]);
          float a = atan2(mouseY-height/2, mouseX-width/2);
          rotate(a/20);
          line(x, y, x+durchmesser, y+durchmesser);
        }
      }
    }
  }
}

void keyPressed () {
 if (key == 's') {
   println("Frame abspeichern");
   saveFrame("ohdeer-####.png");
 }
}

