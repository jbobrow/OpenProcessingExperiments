
//import controlP5.*;

//ControlP5 cp5;

boolean noiseHue = false ;
boolean noiseBrightness = false;
boolean noiseSaturation = false;

// noise features
float toff = 100;
float yrate = 10; // 10 equals 0.01 rate as value is later divided by 1000 (to be compliant with slider)
float xrate = 10;
float trate = 10;

int octaves = 4;
float falloff = 0.5;

// color features
float hue = 0;
float defHue = 255;
float brightness = 100;
float defBrightness = 100;
float saturation = 100;
float defSaturation = 100;

void setup() {
  size(800, 500);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  textSize(10);
//  cp5 = new ControlP5(this);
//  cp5.addSlider("xrate")
//    .setPosition(10, 10)
//      .setRange(1, 100);
//  cp5.addSlider("yrate")
//    .setPosition(10, 30)
//      .setRange(1, 100);
//  cp5.addSlider("trate")
//    .setPosition(10, 50)
//      .setRange(1, 100);
//  cp5.addSlider("octaves")
//    .setPosition(10, 70)
//      .setRange(1, 16);
//  cp5.addSlider("falloff")
//    .setPosition(10, 90)
//      .setRange(0, 1);
//  cp5.addSlider("defHue")
//    .setPosition(10, 150)
//      .setRange(0, 360);
//  cp5.addSlider("defSaturation")
//    .setPosition(10, 170)
//      .setRange(0, 100);
//  cp5.addSlider("defBrightness")
//    .setPosition(10, 190)
//      .setRange(0, 100);
}

void draw() {
  loadPixels();
  float xoff = 0;
  noiseDetail(octaves, falloff);
  
  for (int x = 0; x < width; x++ ) {
    float yoff = 10000;
    for (int y = 0; y < height; y++) {
      
      hue = noiseHue ? map(noise(xoff, yoff, toff), 0, 1, 0, 360) : defHue;
      saturation = noiseSaturation ? map(noise(xoff, yoff, toff), 0, 1, 0, 100) : defSaturation;
      brightness = noiseBrightness ? map(noise(xoff, yoff, toff), 0, 1, 0, 100) : defBrightness;

     pixels[x+y*width] = color(hue, saturation, brightness);

      yoff+=yrate/1000;
    }
    xoff+=xrate/1000;
  }
  toff+=trate/1000;

  updatePixels();

  text("noiseHue: " + (noiseHue ? "on" : "off"), 10, 420);
  text("noiseSaturation: " + (noiseSaturation ? "on" : "off"), 10, 430);
  text("noiseBrightness: " + (noiseBrightness ? "on" : "off"), 10, 440);
  text("xrate: " + nf(xrate/1000,0,3), 10, 450);
  text("yrate: " + nf(yrate/1000,0,3), 10, 460);
  text("trate: " + nf(trate/1000,0,3), 10, 470);
  text("octaves: " + nf(octaves,0), 10, 480);
  text("falloff: " + nf(falloff,0,2), 10, 490);
}

void keyPressed() {
  if (key == '1') {
    noiseHue = !noiseHue;
  } else if (key == '2') {
    noiseSaturation = !noiseSaturation;
  } else if (key == '3') {
     noiseBrightness = !noiseBrightness;
  } else if (key == 'a') {
    xrate ++;
  } else if (key == 'z') {
    xrate --;
  } else if (key == 's') {
    yrate ++;
  } else if (key == 'x') {
    yrate --;
  } else if (key == 'd') {
    trate ++;
  } else if (key == 'c') {
    trate --;
  } else if (key == 'f') {
    octaves++;
  } else if (key == 'v') {
    octaves--;
  } else if (key == 'g') {
    falloff+=0.01;
  } else if (key == 'b') {
    falloff-=0.01;
  }
}




