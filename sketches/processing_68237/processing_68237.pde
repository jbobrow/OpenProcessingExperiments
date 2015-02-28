
//Raven Kwok (aka Guo Ruiwen)
//aug27_2012_diffractionGrating
/*

raystain@gmail.com
twitter.com/ravenkwok
flickr.com/ravenkwok
weibo.com/ravenkwok
the-moor.blogbus.com

note: The asphalt background of this sketch was taken from Wayne Flower's flickr page "http://www.flickr.com/photos/30675512@N00/3433984140/", though I did a bit awkward modification on it.

*/


PImage bg, fg;
float centerX, centerY;
float trackX, trackY;

void setup() {
  size(450, 450, P2D);

  centerX = width/2;
  centerY = height/2;

  bg = loadImage("cement.jpg");
  fg = createImage(450, 450, RGB);

  colorMode(HSB);
  frameRate(30);
  image(bg,0,0);
}

void draw() {

  trackX = lerp(trackX, mouseX, 0.3);
  trackY = lerp(trackY, mouseY, 0.3);


  fg.loadPixels();
  for (int i=0;i<height;i++) {
    for (int j=0;j<width;j++) {

      float factorSinewave = sin(radians(dist(j, i, centerX, centerY)))*255;
      float factorPerlinnoise = noise((float(j)+float(frameCount)/2)/100, (float(i)+float(frameCount)/2)/100)*255;
      float distanceToMouse = constrain(dist(trackX, trackY, j, i), 1, 1000);
      float factorMouse = 10000/sqrt(distanceToMouse);

      float h = factorSinewave*4+factorPerlinnoise*6+factorMouse;

      int divider = floor(h/255);
      h -= 255*divider;
      int index = j+i*width;
      if (divider>5) {
        fg.pixels[index] = color(h, 100, 180);
      }
      else {
        fg.pixels[index] = bg.pixels[index];
      }
    }
  }

  fg.updatePixels();
  
  tint(255,30);
  image(fg, 0, 0);
  
  tint(255,50);
  image(bg, 0, 0);
}


