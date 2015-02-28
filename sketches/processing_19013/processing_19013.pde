
PFont font;


void setup() {
 size(400,400); 
  font = loadFont("Monaco-14.vlw");
  textFont(font,14);
  textAlign(CENTER,BOTTOM);
}


void draw() {
  
  background(200);
  
  // GAUCHE
  // oeil
  fill(0);
  text("CONSTRAIN",75+50,150);
  fill(255);
  rect(75,150,100,100);
  fill(0);
  // pupille
  int x1 = constrain(mouseX,75,175-10);
  int y1 = constrain(mouseY,150,250-10);
  rect(x1,y1,10,10);
  
  // DROITE
  // oeil
  fill(0);
  text("MAP",225+50,150);
  fill(255);
  rect(225,150,100,100);
  // pupille
  fill(0);
  float x2 = map(mouseX,0,width,225,325-10);
  float y2 = map(mouseY,0,height,150,250-10);
  rect(x2,y2,10,10);
  
}



