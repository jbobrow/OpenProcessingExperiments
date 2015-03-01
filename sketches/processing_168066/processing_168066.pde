
void init()
{
  frame.removeNotify();       //??
  frame.setUndecorated(false); //setzt den status der fensterumrahmung
  frame.addNotify();           //??
  frame.setLocation(0,0);      //??
  super.init();
}

void setup() {
  size(1100,750);  //setzt die größe des fensters
  background(120); //setzt die hintergrundfarbe des fensters
  frameRate(500);   //setzt die geschwindigkeit mit der alles aktualisiert wird
  colorMode(HSB, 255);//setzt den farbmodus auf HSB 
 //(hue(farbe von 0-255), satturation(sättigung), brightness(helligkeit) 
  PFont mono;
  mono = loadFont("AngsanaNew-Bold-40.vlw");
  textFont(mono);
  text("       bitte a drücken um den farbwechsel zu starten", 2, 30);
  text("bitte # drücken um nur die ränder zu zeichnen", 2, 60);
  text("leertaste löscht alles", 600, 45);
}
int i = 255;
int h = 0;   // }
int s = 255; // } setzt variablen für h s b ^^ (
int b = 200; // }
void draw() {
  int x = (1100 - mouseX);// } spiegle x (breite)
  int y = (750 - mouseY); // } spiegle y (höhe)
  if (key == '+') b=b+1;  //erhöhe helligkeit
  if (key == '-') b=b-1;  //verringere helligkeit
  if (mousePressed) {     //"wenn maus gedrückt"
    fill(h,255,150);      //füllt alles nachfolgende mit den werten in der klammer bis es geändert wird
    h++;                  //addiere 1 zu der variable h
    if (h == 256) h = 0;  //wenn die variable h über 255 (also 256) setze sie auf 0
    ellipse(random(1100),random(1100),80,80); //kreirt eine ellipse an einer zufalligen position
} else{                               //wenn die maus nicht gedrückt ist^^
    if(key == '#') i = 0; //wenn taste # gedrückt setze i (durchsichtigkeit) auf 0 also durchsichtig
    if(key == 'a') i = 255;   //setze auf undurchsichtig^^
    fill(h,255,b,i);
    stroke(h,150,120);              //setze die randfarbe
    h++;                  //addiere 1 zu der variable h
    if (h == 256) h = 0;            //wenn die variable h über 255 (also 256) setze sie auf 0
    ellipse(mouseX,mouseY,80,80);   //kreire eine ellipse an der mausposition
    ellipse(x,mouseY,80,80);        //kreire eine ellipse gegenüber der mausposition
    ellipse(x,y,80,80);             //kreire eine ellipse gegenüber der mausposition
    ellipse(mouseX,y,80,80);        //kreire eine ellipse gegenüber der mausposition
  } 
}

void keyReleased()
{
  if(key == 32)       //wen die taste 32 (leertaste)gedrückt ist
   restart();          //rufe die restart funktion auf
}

void restart()        //wenn die restart funktion aufgerufen wird
{{{{
          background(120);     //setze den hintergrund auf 120(grau) somit wird alles gemalte gelöscht
}}}}



