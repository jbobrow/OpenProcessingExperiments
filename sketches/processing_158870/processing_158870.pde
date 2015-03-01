
int nblayers=15;
PGraphics []layers=new PGraphics [nblayers];
PGraphics drawer=createGraphics(200, 200);
PGraphics drawing;
int brushdia=50;
float bgcolor=color(128+random(128), 128+random(128), 128+random(128));
void setup() {
  size(600, 600);
  smooth(8);
  ellipseMode(CENTER);
  drawer.beginDraw();
  drawer.background(0, 0);
  drawer.noFill();
  drawer.strokeWeight(1);
  drawer.stroke(255);
  drawer.endDraw();
  drawing=createGraphics(width, height);
  for (int i=0; i<nblayers; i++) {
    layers[i]=createGraphics(width, height);
    layers[i].background(random(255), random(255), random(255));
  }
  for (int i=0; i<nblayers; i++) {
    PGraphics layer=layers[i]; 
    layer.loadPixels();
  }
  drawing.beginDraw();
  drawing.background(layers[0].pixels[5]);
  drawing.endDraw();
  drawing.loadPixels();
  filter(BLUR, 1);
}
void draw() {
  background(0);
  image(drawing, 0, 0);
  if (mousePressed) {
    int loc;
    drawer.beginDraw();
    drawer.background(0, 0);
    drawer.ellipse(100, 100, int(brushdia), int(brushdia));
    drawer.endDraw();
    image(drawer, mouseX-100, mouseY-100);
    for (int i=-brushdia; i<=brushdia; i++) {
      for (int j=-brushdia; j<=brushdia; j++) {
        if (mouseX+i<width && mouseX+i>0 && mouseY+j>0 && mouseY+j<height) {
          float distance=dist(i, j, 0, 0);
          float prox=(brushdia/2-distance)*50/brushdia;
          loc=(j+mouseY)*width+i+mouseX;
          int n=0;
          layer=layers[n]; 
          float alph=alpha (layer.pixels[loc]);        
          while (alph==0 && n<nblayers-1) {
            n++;
            layer=layers[n];
            alph=alpha (layer.pixels[loc]);
          }

          if (alph>=0 && distance<brushdia/2) {
            alph-=prox;
            layer.pixels[loc]=color(layer.pixels[loc], max(0, alph-prox));//(layer.pixels[loc] & 0xffffff) | (alph << 24);//
            if (n<nblayers-1)drawing.pixels[loc]=combineColors(int(layer.pixels[loc]), int(layers[n+1].pixels[loc]));
            else drawing.pixels[loc]=combineColors(layer.pixels[loc], bgcolor);
          }
        }
      }
    }
    for (int i=0; i<nblayers; i++) { 
      layers[i].updatePixels();
      drawing.updatePixels();
    }
  }
}

void mouseScrolled()
{
  drawer.beginDraw();
  drawer.background(0, 0);
  drawer.ellipse(100, 100, int(brushdia), int(brushdia));
  drawer.endDraw();
  image(drawer, mouseX-100, mouseY-100);
  if (mouseScroll > 0 && brushdia<200)
  {
    brushdia++; // positive scroll
  } else if (brushdia>20)
  {
    brushdia--; // negative scroll
  }
}
color combineColors(color c1, color c2) {
  float a, r, g, b, a1, r1, g1, b1, a2, r2, g2, b2;
  a1=(c1>> 24 & 0xFF)/255;
  a2=(c2>> 24 & 0xFF)/255;
  r1=c1>> 16 & 0xFF;
  g1=c1>> 8 & 0xFF;
  b1=c1 & 0xFF;
  r2=c2>> 16 & 0xFF;
  g2=c2>> 8 & 0xFF;
  b2=c2 & 0xFF;
  r=r1*a1+r2*(1-a1); 
  g=g1*a1+g2*(1-a1); 
  b=b1*a1+b2*(1-a1);
  return color(r, g, b);
}



