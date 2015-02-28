
/* @pjs preload="outrun_2.jpg" */
PImage src;
PGraphics dst;
float r, g, b, rotx, roty;
int targetw, targeth;
final int range = 15;
void setup() {
  size(500, 308); // extra wid so that the content div gives proper way for the canvas
  imageMode(CENTER);
  
  size(440 + range * 2, 308 + range * 2); // size is redefined taking into account the range
  src = loadImage("outrun_2", "jpg");
  dst = createGraphics(src.width, src.height);
  
  r = g = b = rotx = roty = 0;
  src.loadPixels();
}
void draw() {
  background(0);
  targetw = (int)(cos(rotx) * range);
  targeth = (int)(sin(rotx) * range);
  dst.loadPixels();
  
  for(long h = abs(targeth); h < src.height- abs(targeth); h++){
    for(long w = abs(targetw); w < src.width- abs(targetw); w++){
      if((h + targeth)*src.width+w + targetw == -4428) console.log(h, targeth ,w , targetw);
      r = red(src.pixels[(int)((h + targeth)*src.width+w + targetw)]);
      g = green(src.pixels[(int)(h * src.width +w)]);
      b = blue(src.pixels[(int)((h - targeth)*src.width+w - targetw)]);
      
      dst.pixels[(int)(h*src.width+w)]= color(r,g,b);
    }
  }
  
  rotx += 0.1;
  roty += 0.1;
  dst.updatePixels();
  image(dst, width/2, height/2);
}
