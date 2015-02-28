
import controlP5.*;
ControlP5 controlP5;

public int kreisgroesse =90;
public int kreisklein = 40;
public int dicke = 10;
public int hoehe = 40;
public int quadrat= 10;
public int schluesselhoehe = 100;
public int r= 100;
public int g= 160;
public int b= 203;


void setup () {
  size(800,800);
  smooth();
  background(245);
  
  controlP5 = new ControlP5(this);
  controlP5.addSlider("kreisgroesse",30,200,90,40,10,240,10);
  controlP5.addSlider("kreisklein", 20,50,40,40,30,240,10);
  controlP5.addSlider("dicke", 10,50,5,40,50,240,10);
  controlP5.addSlider("hoehe", 10,200,40,40,70,240,10);
  controlP5.addSlider("quadrat", 10,70,30,40,90,240,10);
  controlP5.addSlider("schluesselhoehe", 10,200,100,40,110,240,10);
  controlP5.addSlider("r",10, 255, 100, 40, 130, 200, 10);
  controlP5.addSlider("g",10, 255, 160, 40, 150, 200, 10);
  controlP5.addSlider("b",10, 255, 203, 40, 170, 200, 10);
  //controlP5.addSlider("punkt", 0, 800, 205, 10, 10, 200, 10);

}

void draw () {
  background(240);
  ellipse(400,280,kreisgroesse,kreisgroesse);
  
  ellipse(400,280,kreisklein,kreisklein);
  strokeWeight(dicke);
  stroke(r,g,b);
  
  line(400,300,400,400+hoehe);
  
  rect(400-dicke,300+schluesselhoehe,quadrat,quadrat); 
    
}

void keyPressed() {
 
  if (key== 's' || key == 'S') {
    println("Bild abspeichern");
    saveFrame("logo_####.tif");
  }
 
  if (key == 'p' || key == 'P') {
    beginRecord(PDF, "keylogo.pdf");
  }
 
  if (key == 'e' || key == 'E') {
    endRecord();
  }
}

