
float theta, diam;
PGraphics letter;
PFont font;
int step =20;

void setup() {
  background(20);
  size(500, 500);
  noStroke();
  letter = createGraphics(width, height);
  font = loadFont("Arial-Black-250.vlw");
  createStuff();
}

void draw() {
  background(20);

  for (int x=step/2; x<width; x+=step) {
    for (int y=step/2; y<height; y+=step) {
      int c = letter.pixels[x+y*width];
      if (brightness(c)>50) {
        diam = step*.5;
      } else {
        diam = map(sin(theta),-1,1,step*.2,step*.9);
        //diam = step*.9;
      }


      ellipse(x, y, diam, diam);
    }
  }

  theta += .0523;

  //if (frameCount%2==0 && frameCount < 121) saveFrame("image-####.gif");
}

void createStuff() {   
  letter.beginDraw();
  letter.noStroke();
  letter.background(255);
  letter.fill(0);
  letter.textFont(font, 500);
  letter.textAlign(CENTER, CENTER);
  letter.text("Q", width/2, height/2);
  letter.endDraw();
  letter.loadPixels();
}



