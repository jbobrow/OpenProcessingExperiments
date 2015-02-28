
import netscape.javascript.*;


PImage bild;
PImage bild1;
PImage bild2;
PImage bild3;
PFont font;


color farbe;
int[] positionsX = new int[150];
int[] positionsY = new int[150];
int i = 0;

void setup () {
  

  bild1 = loadImage("flowers.jpg");
 
 bild2 = loadImage("cake.jpg");
  
 bild3 = loadImage("gummi.jpg");
 
 bild = bild1;
 

font = loadFont("ArialMT.vlw");
   textFont (font, 20);

size (900, 400);
background (255);
stroke (0);
smooth ();
strokeWeight (0.6);
}


void draw(){ 
  
  stroke (0);
  
  
// drawing the "layout" of the application
  
rect (0,0,400,500);
fill (255);
image (bild, 0, 0);

  textSize (10);
     fill (0);

   text ("press keys 1,2,3 to choose the picture", 420, 20);
   text ("click on the picture to pick a color", 590, 20);
   text ("use the empty area for drawing", 740, 20);

//defining the interaction - choose a picture with pressing a key

  if (keyPressed) {
    
    if (key == '2') {
  
    bild = bild2;   
}

    if (key == '3') {

    bild = bild3;
}

  if (key == '1') {
  
    bild = bild1;  
}
  }
 
//"color picker"

if (mousePressed) {
   if (mouseY>0&& mouseY<300 && mouseX>0 && mouseX<400) {
 farbe = get(mouseX, mouseY);
   }
  
 }
   
  stroke (farbe);
  
// defining the sketching line
  
     positionsX = append(positionsX, mouseX);
   positionsY = append(positionsY, mouseY);
 
 if (mousePressed) {
   if (mouseY>0&& mouseY<400 && mouseX>400 && mouseX<1200) {
  for(int j=0; j < positionsX.length; j++){
      int distanz = int(dist(positionsX[j], positionsY[j],mouseX, mouseY));
      float r = random(0, 20);
      if(distanz < 20 && r <20)  line(positionsX[j],positionsY[j],mouseX, mouseY);
  }
   }
 }

  fill (farbe);
  
    


}

