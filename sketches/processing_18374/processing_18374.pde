
int numLines = 1000;
PVector[] vertices = new PVector[numLines * 2];
PImage img;
color r;
int fuzz = 7;

void setup() {
  colorMode(HSB, 360, 100, 100);
  r = color(255, 100, 100);
   img = loadImage("logo_plain.jpg");
   size(500,150); 
   image(img,0,0);
   loadPixels();

   for(int i=0;i<numLines*2;i++) {
     int rand = 0;
     float b = 0.0;
     while (b < 10.0) {
       rand = floor(random(pixels.length));
       color cp = pixels[rand];
       b = brightness(cp);
     }
     int x = int(rand % width);
     int y = (rand - x) / width;
     vertices[i] = new PVector(x,y);
   }
   colorMode(RGB);
   for (int i=0; i<height; i++) {
     for (int j=0; j<width; j++) {
       int k = i*width+j;
       pixels[k] = color(0,0,0);
     } 
   }
   updatePixels();

   colorMode(HSB,360,100,100,100);
   for(int i=0;i<numLines*2;i++) { 
     fill(40,100,100,50);
     stroke(140,100,100);
     int x2 = int(random(vertices[i].x - fuzz, vertices[i].x + fuzz));
     int y2 = int(random(vertices[i].y - fuzz, vertices[i].y + fuzz));
     line(vertices[i].x,vertices[i].y,x2,y2);
     
   }
   //updatePixels();
   //save("short_lines005.jpg");
}

void draw() {
}

