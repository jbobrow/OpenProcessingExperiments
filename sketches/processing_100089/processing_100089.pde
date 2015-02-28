


PImage img;
PImage img2;
 
int x;
int y;

int x2 = 0;
int y2 = 400;

void setup(){
  
  size(1000,800);
  background(0,155,255);
  
  img = loadImage("nuvole super mario 1.png"); // tipica istruzione da richiamare una sola volta;
  img2 = loadImage("nuvole super mario 2.png");
 // x = 400; 
  
}


void draw () {
  
  background(0,155,255); // toglie l'effetto di accumulazione dell'immagine 
  
image(img,random(800),random(600),img.width, img.height);
image(img2, random(1000),random(400),img2.width/2, img2.height/2);
  x++;
  x2++;
}


