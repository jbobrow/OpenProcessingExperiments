
import processing.xml.*;

String strXmlFile = "colormap_02.xml";

XMLElement xmlFile;
PImage back, colormap;
PGraphics buffer, frame;
int[] colormask;
int step = 0;
int nbColorsInColormap;

void setup() {
  xmlFile = new XMLElement(this, strXmlFile);
  back = loadImage(xmlFile.getChild("background").getStringAttribute("src"));
  size(back.width, back.height);
  colormap = loadImage(xmlFile.getChild("colormap").getStringAttribute("src"));
  buffer = createGraphics(back.width, back.height, P3D);
  int resw = xmlFile.getIntAttribute("resw");
  int resh = xmlFile.getIntAttribute("resh");
  frame = createGraphics(resw, resh, P3D);
  nbColorsInColormap = resw * resh;
  frameRate(24);
}

float angle;

void draw() {
  step++; if (step >= frame.width) step = 0;
  
  background(255);
  image(back, 0, 0);
  
  frame.beginDraw();
    frame.background(255, 0);
    frame.translate(frame.width/2, frame.height/2);
    frame.rotate(angle+=PI/80);
    color c = color(50.0, 150.0, 150.0);
    frame.stroke(c); frame.noFill();
    //for (int i = 0; i < frame.height; i++) frame.pixels[i*frame.width+step] = c;
    frame.rect(-8, -8, 16, 16);
  frame.endDraw();
  
  //image(getBuffer(frame, colormap), 0, 0);
  blend(getBuffer(frame, colormap), 0, 0, width, height, 0, 0, width, height, SCREEN);
}

PImage getBuffer(PImage img, PImage colormap) {
  buffer.beginDraw();
    buffer.background(255, 0);
    for (int i = 0; i < colormap.pixels.length; i++) {
      color pixel_id = colormap.pixels[i];
      if (pixel_id >= -nbColorsInColormap) buffer.pixels[i] = img.pixels[-pixel_id-1];
    }
  buffer.endDraw();
  return buffer;
}


