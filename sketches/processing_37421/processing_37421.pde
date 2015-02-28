
PImage monet;

void setup() {
  monet = loadImage ("Impressionist Sunrise.png");
  size(1000,600);
  colorMode(RGB,255);
}

int count = 0;
int num = 200;

void draw() {
  loadPixels();
  monet.loadPixels();
  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      

      if(count < num) {
        for(int x = 0; x < 3; x++) {
          for(int y = 0; y < 3; y++) {
            
            int loc = i + j*width;
            int locRand = loc + floor((random(0,width*height)));
            
            int a = x*(width/2);
            int b = x*(height/2);
            int c = floor(random(0,width));
            
            float d = red(monet.pixels[locRand]);
            float e = green(monet.pixels[locRand]);
            float f = blue(monet.pixels[locRand]);
            
            stroke(d,e,f);
            line(a,b+c,a+c,b);
            line(a,b,a+c,b+c);
          }
        }
      }
      count++;
    }
  }
}


