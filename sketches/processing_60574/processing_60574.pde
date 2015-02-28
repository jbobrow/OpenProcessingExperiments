
float kreisBreite = 100;
float kreisHoehe = 100;

int xPos = 250;
int yPos = 250;

void setup () {
  size (500,500);
  colorMode (RGB,500,500,500,500);
  background (0,500,500);
  noStroke();
  fill(500,0,0);
} 

  


void draw() {
  background (500,500,0);
 
  ellipse (xPos,yPos,kreisBreite,kreisHoehe);
  

}



void mousePressed() {
  kreisBreite = kreisBreite + 50;
  kreisHoehe = kreisHoehe + 50;
  
  //code für vergrößern
  
}



void keyPressed() {
  kreisBreite = 10;
  kreisHoehe = 10;
  xPos = 250;
  yPos = 250;



  //code für zurück zur original-größe

}

