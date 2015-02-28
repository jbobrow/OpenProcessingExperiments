
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PFont ff;
PImage ww;
ArrayList positions = new ArrayList();
PeasyCam cam;
String sentence;

void setup()
{
  size(800, 600, P3D);
  cam = new PeasyCam(this, 80);
  cam.setRotations( -0.73, -0.27, 0.30); 
  ff = loadFont("imhelix2_8pt_0804_11-8.vlw");
  sentence = "Hello.";
  ww = crImage();
  scan();
}

void draw()
{
  background(255);
  lights();
  translate(-200, -8, 0);  
  for(int i = 0; i < positions.size()-1; i++)
  {
    PVector ps = (PVector) positions.get(i);
    pushMatrix();
    translate(ps.x, ps.y, 0);
    noStroke();
    fill(200);
    box(1, 1, 5);
    popMatrix();
  }
}

PImage crImage()
{
  PGraphics pg = createGraphics(400,20,JAVA2D);
  pg.beginDraw();
  pg.background(255);
  pg.fill(250);
  pg.textAlign(CENTER);
  pg.textFont(ff, 16);
  pg.text(sentence, 0, 0, 400, 20);
  pg.endDraw();
  PImage w = createImage(400,20,RGB);
  copy(pg, 0, 0, 400, 20, 0, 0, 400, 20);
  return w;
}

void scan()
{
  positions.clear(); 
  for(int x = 0; x < ww.width; x++) {
    for(int y = 0; y < ww.height; y++) {
      if(get(x,y) != -65794){
        positions.add(new PVector(x,y,0));     
      }
    }
   }
}

void keyPressed() {
  if(textWidth(sentence) <= 210){
     sentence += key;
     crImage();
     scan();
     } 
     else
     sentence = "";
}

