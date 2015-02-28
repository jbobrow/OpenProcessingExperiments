
import geomerative.*;
import controlP5.*;
ControlP5 cp5;
import ddf.minim.*;
Minim minim;
AudioPlayer musique;



// Ici on déclare les objets que l'on utilise,accessible de la Setup & draw
PFont f;
String typing = "";
String saved = "";
RShape grp;
RPoint[] points;
// Tableau de coordonée des points
int [] x = new int[40];
int [] y = new int[40];
int indent = 250;
PFont police;
String chaine = "";

void setup() { 
   
   police = loadFont("CaviarDreams-48.vlw");
  textFont(police,24);
  fill(255,255,255,255);
  //Initialise le dessin
  size(1100, 650);

  // Choix des couleurs
  
  // Initialise la librairie
  RG.init(this);
  //  On charge le dossier de texte
      cp5 = new ControlP5(this);
  
  cp5.addTextfield("nom")
     .setPosition(20,100)
     .setSize(200,40)
     .setFont(police)
     .setFocus(true)
     .setColor(color(0,0,255))
     ;
     
  //import musique   
  minim = new Minim(this);
  musique = minim.loadFile("06 Air War.mp3");
  musique.loop();
  
}
void draw() {

   //grp = RG.getText(typing, "FreeSans.ttf", indent, CENTER);
  chaine = cp5.get(Textfield.class,"nom").getText();
    background(0);
    textFont(police, 32);
    text("VOTRE NOM SONNE-T-IL ELECTRO?", 340, 50);
    textFont(police,18);
    text("Down = save your name", 60, 600);

  if (chaine.length() > 0) {
  
    grp = RG.getText(chaine, "FreeSans.ttf", indent, CENTER );
    
    
    
    
    frameRate(5);
    // Nettoyer la trame
    // Positioner l'origine du dessin au milieu de la page
    translate(width/2, 3*height/4);
    // Dessiner les formes
    noFill();
    stroke(0, 0, 0, 150);
    RG.setPolygonizer(RG.ADAPTATIVE);
    grp.draw();
    // Prendre les points sur les contours des formes
    //RG.setPolygonizer(RG.UNIFORMSTEP);
    //RG.setPolygonizerStep(map(float(mouseY), 0.0, float(height), 0.0, 1.0));
    RG.setPolygonizer(RG.UNIFORMLENGTH);
    //RG.setPolygonizerLength(map(mouseY, 0, height, 3, 200));
    points = grp.getPoints();
    // S'il n'y a pas de points
    
    
    if (points != null) {
      noFill();
      stroke(0, 0, 0);
      println("nombre de points : " + points.length);
      
      for (int i=0; i<points.length; i++)
      {
        for (int j=0; j<x.length; j++)
        {
          int p = int(random(points.length));
          x[j] = int(points[p].x);
          y[j] = int(points[p].y);
        }
      }
    }
   
  
    int lastx=-1;
    int lasty=-1;
    for (int j=0; j<x.length; j++)
    {     
     
      if (j>0){
        
  
        line(x[j], y[j], lastx, lasty);
              //arc(x[j], y[j], lastx, lasty, 0, PI);
  
      }
      lastx=x[j];
      lasty=y[j];
      //println(x[j] + "    " + y[j]);
      smooth();
      stroke(random(150), random(0), random(255));  // ligne point point rajouter lueur
      strokeWeight(random(0.1,2));
      point(x[j], y[j]);
      
    }
  
  //noLoop();
  }
}
void keyPressed() {
  if (key == CODED){
  if (keyCode == DELETE){
     setup();
}
  
  if (keyCode == DOWN) {
    saveFrame();
  }
  }
  // If the return key is pressed, save the String and clear it
  if (key == '\n' ) {
    saved = typing;
    // A String can be cleared by setting it equal to ""
    typing = ""; 
  } else {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    typing = typing + key; 
  }
}
void stop() {
  
  musique.close();
  minim.stop();
  super.stop();
  
}
