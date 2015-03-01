
float a = 0;
float x = 0;
int q=1;
float r=100;
float b=100;
float g=100;
float randomizerX = random(0.1, 0.2);
float randomizerY = random(0.1, 0.9);
PImage img, img2, m;

void setup() {
  size(800, 800);
  background(r, g, b);

  smooth(8);
  img=loadImage ("spectrum_logo_white.png");
  img2=loadImage("spectrum_logo_black.png");
  m=img;
  fill(200);

}

void draw() {
  noStroke();

  image(m, 0, 0, 800, 800);
  smooth(8);
  //filter(BLUR, 0.3);
  pushMatrix();
  
//colors  
  if (r<10 || b<10 || g<10)q=1;
  if (r>250 || b>250 || g>250)q=0;
  if (q==1)
  { 
    r+=(random(0, 15));
    b+=(random(0, 7));
    g+=(random(0, 7));
  } else
  { 
    r-=(random(0, 15));
    b-=(random(0, 7));
    g-=(random(0, 7));
  }
//background shapes
  fill(r, g, b, 0.5);
  rect(0, 0, width, height);
  float y = map(sin(a)*sin(a), -1, 1, 0, width-50);
  float x = map(cos(a*randomizerY)*cos(a), -1, 1, 50, height-50);
  float ellipseSize = map(sin(a), -1, 1, 40, 80);
  stroke(b, r, g);
  fill(r, g, b);
  //ellipse(x, y, ellipseSize, ellipseSize);
  ellipse(x, y, ellipseSize, ellipseSize);
  ellipse(x/2, y, ellipseSize, ellipseSize);
  ellipse(y, x/2, ellipseSize, ellipseSize);
  ellipse(width-x, height-y, ellipseSize, ellipseSize);
  // ellipse(width-x/2,height-y,ellipseSize,ellipseSize);
  ellipse(y, x, ellipseSize, ellipseSize);
  ellipse(height-y, width-x, ellipseSize, ellipseSize);
  //ellipse(height-y/2,width-x,ellipseSize,ellipseSize);

  a = a + 0.03;
  popMatrix();
  
//image mask

 //image(m, 0, 0, 800, 800);
noStroke();

 fill(200);
  rect(0,700,110,50,5);
  fill(0, 102, 153);
text("Press 'spacebar'", 10, 720);
text("to change colour",10, 735);
  smooth(8);
}
void keyPressed() {
  if (key=='b') {
    if (m==img2)m=img;
    else m=img2;
    fill(r, g, b, 0.5);
    rect(0, 0, width, height);
  }
  if (key == ' ') {
    r=random(0, 255);
    g=random(0, 255);
    b=random(0, 255);
    background(r, g, b);
    randomizerY = random(0.1, 0.9);
    randomizerX = random(0.1, 0.9);
  }
if(key=='s') {
  saveFrame("spectrum-###.jpg");
}
}


