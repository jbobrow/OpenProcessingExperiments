
//
// Blurcumulator
// 20 oct 2010 K Bjorke
// net result of 6 billion years of evolution
// botzilla.com
//


PImage img;
PImage noisy;

PVector ctr;
float aspect;
float mainAngle;

//////////////////////////////////////
//////////////////////////////////////
//////////////////////////////////////

void setup()
{
  size(1024, 576, JAVA2D);
  smooth();
  img = loadImage("P1100182src.jpg");
  noisy = createImage(img.width,img.height,RGB);
  mainAngle = 3.14159265358979*random(-1.0,1.0);
  ctr = new PVector(img.width/2.0,img.height/2.0);
  aspect = img.width/(float)img.height;
  // tex2 = new GLTexture(this, tex0.width, tex0.height);    
  // pulseEmboss = new GLTextureFilter(this, "pulsatingEmboss.xml");
  img.loadPixels();
  float noiseScale = 0.008;
  noisy.loadPixels(); // needed?
  for (int j=0, k=0; j<img.height; j++) {
    for (int i=0; i<img.width; i++,k++) {
      int v = 0xFF & ((int)(255.0*noise(((float)i)*noiseScale,((float)j)*noiseScale)));
      noisy.pixels[k] = (v<<16) + (v<<8) + (v);
    }
  }
  noisy.updatePixels();
}

//////////////////////////////////////
//////////////////////////////////////
//////////////////////////////////////

void draw()
{
  if (frameCount==1) image(img,0,0); // background(0);
  if ((frameCount % 3) == 0) filter(BLUR, 0.8);
  float fwd = random(60,100);
  mainAngle += random(-0.27,0.27);
  ctr.x += fwd*cos(mainAngle)*aspect;
  ctr.y += fwd*sin(mainAngle);
  if ((ctr.x<7.01) || (ctr.x>(width-71.0)) || (ctr.y<51.0) || (ctr.y>(height-51.0))) {
    mainAngle += 3.14159 + random(-.2,0.2);
  }
  ctr.x = max(ctr.x,70.0);
  ctr.x = min(ctr.x,(width-70.0));
  ctr.y = max(ctr.y,50.0);
  ctr.y = min(ctr.y,(height-50.0));
  for (int i=0; i<160; ++i) {
    float ra = 3.14159265358979*random(-1.0,1.0);
    float rr = sqrt(random(100,6000));
    float rx = ctr.x + rr*cos(ra)*aspect;
    float ry = ctr.y + rr*sin(ra);
    int ix = (int)rx;
    int iy = (int)ry;
    if ((ix>=0)&&(ix<img.width)&&(iy>=0)&&(iy<img.height)) {
      int k = (ix) + img.width*(iy);
      int r = noisy.pixels[k] & 0xFF;
      float v = 0.7*((r/255.0)-0.5);
      float ba = mainAngle + v; // random(-0.1,0.1);
      float rw = sqrt(random(1,16));
      float rl = sqrt(random(1,100));
      float ca = rl*cos(ba)*aspect;
      float sa = rl*sin(ba);
      color c = img.pixels[k];
      stroke(c);
      strokeWeight(rw);
      line(rx-ca,ry-sa,rx+ca,ry+sa);
    }
  }
}

//////////////////////////////////////
//////////////////////////////////////
//////////////////////////////////////

void keyPressed()
{
  if (key == CODED) {
    if (keyCode == UP) {
      // do something
    } 
    else if (keyCode == DOWN) {
      // something else
    }
  }
}

//////////////////////////////////////
///////////////////////////// eof ////
//////////////////////////////////////


