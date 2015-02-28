
import ddf.minim.*;
AudioPlayer repSonido;
PImage imagen;
Minim minim;
color[] paletaColores ={#EFFA79,#E6FA12,#F5ED59,#FFF308,#FAF592};


void setup() {
  size(1280, 720);   // image define width and large
  background(#FFFFFF);  
  imagen = loadImage("loro1.png");  // Nombre de la imagen
  minim = new Minim(this);
  repSonido = minim.loadFile("loro.wav");
  
}

void draw() {
  ellipseMode(CORNER);
  fill(#E3C21B);
  noStroke();
  ellipse(-20,-20,200,200);
  image(imagen, 0, 0);  // show the image in coordinates 0, 0
  PFont f = loadFont("ComicSansMS-48.vlw");
  fill(#072DAF);
  textFont(f, 20);
  text("Press 'h' to view sun's rays", 400, 120);
  text("Press 'r' to clear the sun's rays", 400, 150);
  text("Move the mouse to hear me", 400,180);
  text("Click on mouse to stop me", 400, 210);
  text("Press 's' to save mi picture", 400, 240);
  //You draw the sunrays if you press 'r'
  if(keyPressed) { 
   if (key == 'h' || key=='H') {
         //line(150, 25, mouseX, mouseY);
         for (int x=25; x<width; x+=50) {
         for (int y=25; y < height; y+=50) {
         float aleatorio = random(1,5);
         strokeWeight(10);
         stroke(paletaColores[int(aleatorio)]);
         noFill();
         line(x,y,10,10);
        
       }
     }
   }//h pressed
   
  else  if (key  == 'r'|| key=='R') { 
       background(#FFFFFF);  // change background
       fill(#072DAF);
       textFont(f, 50);
       text("Lorito Brrrrr¡¡¡¡¡", 400, 70);
       }// r pressed
       
   else if (key=='s' || key=='S') {
   saveFrame("guardaLorito.png"); 
   }//s pressed
   }//end keyPressed
}//end draw

void mouseMoved(){
  repSonido.play();
}

void mousePressed(){
  repSonido.pause();
}



