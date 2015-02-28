
int xKoordinate=30;
int yKoordinate=30;

int xSize=20;
int ySize=20;

color figurFarbe=color(200,30,30);
color hintergrundFarbe=color(80,80,30);

int spielFeldGroesse=300;


void setup(){
    size(spielFeldGroesse,spielFeldGroesse);
    ellipseMode(CENTER);
    textAlign(CENTER,CENTER);
}


void draw(){
    background(hintergrundFarbe);
    //spielfigur zeichnen
    fill(figurFarbe);
    ellipse(xKoordinate,yKoordinate,xSize,ySize);
    
    
    line(mouseX,mouseY,xKoordinate,yKoordinate);
    fill(0,0,0,0);
    ellipse(mouseX,mouseY,20,20);
}


void keyPressed() {
  if (key == CODED) { //Sondertaste
    if (keyCode == UP) {
      yKoordinate-=3;
    } else if (keyCode == DOWN) {
      yKoordinate+=3;
    } 
  } 
}
