
PImage Img;
float [][] Temperature;
float MinBlobVal = 0.01831564; 
WarmBlob [] WarmWax;
HotBlob [] HotWax;

void setup() {
   size(920, 500);
   Img = createImage(width, height, RGB);
   Temperature = new float[height][width];

   makeWax();
}

void draw() {
   zeroTemperature();
   for (int i=0; i<WarmWax.length; i++) {
     WarmWax[i].move();
     WarmWax[i].render();
   }
   for (int i=0; i<HotWax.length; i++) {
     HotWax[i].move();
     HotWax[i].render();
   }
   
   Img.loadPixels();
   buildImage();
   Img.updatePixels();
   image(Img, 0, 0);
}

void makeWax() {
   int numWarmBlobs = 1+int(width/100);
   WarmWax = new WarmBlob[numWarmBlobs];
   int xcenter = 0;
   for (int i=0; i<numWarmBlobs; i++) {
      WarmWax[i] = new WarmBlob(i*100, height, 100);
   }
   int numHotBlobs = 10;
   HotWax = new HotBlob[numHotBlobs];
   for (int i=0; i<numHotBlobs; i++) {
      HotWax[i] = new HotBlob();
   }
}

void zeroTemperature() {
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         Temperature[y][x] = 0;
      }
   }
}

void buildImage() {
   for (int y=0; y<height; y++) {
      for (int x=0; x<width; x++) {
         float midT = 0.4;
         float rangeT = 0.05;
         if (abs(Temperature[y][x] - midT) < rangeT) {
            Img.set(x, y, color(255, 0, 0));
         } else {
            Img.set(x, y, color(0, 0, 0));
         }
      }
   }
}

class Blob {
   float cx, cy;   // blob center
   float r;        // blob radius
   float xangle, xinc, xrad;  // for wobbling blobs left-right
   float yangle, yinc, yrad;  // for wobbling blobs up-down
   float xorig, yorig;        // starting x and y

   Blob(float acx, float acy, float ar) {
      cx = acx;
      cy = acy;
      r = ar;
      startWobbles(radians(20)*random(-1, 1), r*random(0.1, 0.3),    
                   radians(20)*random(-1, 1), r*random(0.1, 0.3));
   }

   void startWobbles(float axinc, float axrad, float ayinc, float ayrad) {
      xangle = random(0, radians(360));
      yangle = random(0, radians(360));
      xinc = axinc;
      yinc = ayinc;
      xrad = axrad;
      yrad = ayrad;
      xorig = cx;
      yorig = cy;
   }
   
   void move() {
      cx = xorig + (xrad * cos(xangle));
      cy = yorig + (yrad * cos(yangle));
      xangle += xinc;
      yangle += yinc;
   }

   void render() {
      int lox = max(0, int(cx-r));
      int hix = min(width, int(cx+r));
      int loy = max(0, int(cy-r));
      int hiy = min(height, int(cy+r));
      for (int y=loy; y<hiy; y++) {
         for (int x=lox; x<hix; x++) { 
            float d2 = sq(x-cx)+sq(y-cy);
            if (d2 > r*r) continue;
            float d = sqrt(d2);
            float h = map(d, 0, r, 1, 0);
            float v = exp(-4*h*h);
            v = map(v, 1, MinBlobVal, 0, 1);  
            Temperature[y][x] += v;
         }
      }
   }
}

class WarmBlob extends Blob {
     
   WarmBlob(float acx, float acy, float ar) {
      super(acx, acy, ar);
      startWobbles(radians(3)*random(-1, 1), ar*random(0.1, 0.2),
                   radians(3)*random(-1, 1), ar*random(0.1, 0.2));
   }
}

class HotBlob extends Blob {
   float vx, vy;   // speed per frame

   HotBlob() {
      // We must call the Blob constructor
      super(0, 0, 0);
      restart(true);
   }
  
   void restart(boolean firstTime) {
      r = random(40, 100);
      cx = random(width);
      cy = height+r;
      if (firstTime) cy += random(height);
      vx = random(-.1, .1);
      vy = map(r, 40, 100, -4, -2) * random(0.8, 1.2);
      startWobbles(radians(2)*random(-1, 1), r*random(0.3, 0.6),
                   radians(2)*random(-1, 1),   random(0.3, 0.6));
   }
  
   void move() {
      xorig += vx;
      yorig += vy;
      super.move();
      if (cy+r < 0) {
         restart(false);
      }
   }
}
