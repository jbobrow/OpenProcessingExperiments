
import controlP5.*;

ControlP5 controlP5;

String [][] csv;
PImage b, play, pause;
boolean go = false;
PFont font, bold;

int Jahr;
int ind = 2;
Slider s1;

void setup() {
  size(800,550);
  smooth();

  b = loadImage("images.jpeg");
  font = loadFont ("Calibri-14.vlw");
  bold = loadFont ("Calibri-Bold-14.vlw");
  
  collectData();

  controlP5 = new ControlP5(this);
  controlP5.addSlider("Jahr",1970,2010,1970,50,460,700,30);

  s1 = (Slider)controlP5.controller("Jahr");

  s1.setNumberOfTickMarks(41);
//s1.setSliderMode(Slider.FLEXIBLE);



}

void draw() {
  background(#fafafa);
  image(b, 35, 30, b.width/2, b.height/2);  
  
    
  String m = csv[ind][1];
  int i = Integer.parseInt(m);

  String w = csv[ind][2];
  int j = Integer.parseInt(w);

  String g = csv[ind][3];
  int k = Integer.parseInt(g);


  noStroke();

  // männlich
  fill(#3399FF,200);
  ellipse(450,350,i/400000,i/400000);
  //weiblich
  fill(#FF33CC, 200);
  ellipse(450,200,j/400000,j/400000);
  //gesamt
  fill(#FF3300,200);
  ellipse(650,270,k/400000,k/400000);
  
  // Text im Kreis
  fill(255);
  textFont(font);
  textSize(14);
  text(m, 420,355);
  text("*",476,355);
  text(w, 420,205);
  text("*",476,205);
  text(g, 620,275);
  text("*", 676,275);
  
  // Legende
  fill(0);
  textFont(font);
  textSize(14);
  text("weiblich", 427, 270);
  text("männlich", 425, 420);
  text("gesamt", 633, 395);
  
  textSize(12);
  text("* Einwohner", 688, 520);
 
  textFont(bold);
  textSize(21);
  text("Demographischer Wandel in Deutschland", 395, 70);
  text("von 1970 bis 2010", 480, 100);

 
  
  
  slider_update();
  
}

void collectData() {

  String lines[] = loadStrings("Input.csv");
  int csvWidth=0;

  //breite der csv bestimmen
  for (int i=0; i < lines.length; i++) {
    String [] chars=split(lines[i],';');
    if (chars.length>csvWidth) {
      csvWidth=chars.length;
    }
  }

  //csv array mit unbekannten zeilen und spalten der csv
  csv = new String [lines.length][csvWidth];

  //werte ins array
  for (int i=0; i < lines.length; i++) {
    String [] temp = new String [lines.length];
    temp= split(lines[i], ';');
    for (int j=0; j < temp.length; j++) {
      csv[i][j]=temp[j];
    }
  }
  
 
  
}

int slider_update() {
  int jahr = int(s1.value());
  ind = jahr-1968;
  //println(ind);
  
  return jahr;
  
}

  
  

