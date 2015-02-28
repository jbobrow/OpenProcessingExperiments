
import processing.pdf.*;
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;
import controlP5.*;
  
  ControlP5 controlP5;
  public float farbeR = 0;
  public float farbeB = 0;
  public float farbeG = 0;

  soundbars mysound;
  
public void setup() {
  size(400, 400);
  smooth();
  background(255);
  
  controlP5 = new ControlP5(this);
  controlP5.addSlider("farbeR", 0, 255, 0, 50, 310, 200, 15);
  controlP5.addSlider("farbeG", 0, 255, 0, 50, 330, 200, 15);
  controlP5.addSlider("farbeB", 0, 255, 0, 50, 350, 200, 15);
  
  this.neuebars();
}

public void draw() {
  
  noStroke();
  fill(0,0,0); 
  rect(250, 310, 40, 55);  
  fill(farbeR, farbeG, farbeB); 
  rect(300, 310, 70, 55); 
  
}

public void neuebars() {
  PImage b;
  b = loadImage("background.jpg");
  image(b, 0, 0);
  fill(farbeR, farbeG, farbeB); 
  mysound = new soundbars();
  mysound.zeichnen();
}

public void mouseReleased() {
    this.neuebars();   
}

public void keyPressed() {
  if (key == 'n') { this.neuebars(); }  
  if (key == 'p') { saveFrame("soundsgood_####.png"); }
  if (key == 's') { beginRecord(PDF, "soundsgood_####.pdf"); }
   if (key == 'd') { endRecord(); }
}


