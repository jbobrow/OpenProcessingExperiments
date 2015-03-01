

void setup() {  //setup fonction appelée une seule fois en début de programme
  size(300, 300); // taille de la fenêtre 300 pixels de large et 300 pixels de haut
  background(255);  // couleur de fond : blanc
 
  }

void draw() {  //draw : fonction appelée en boucle une fois que le programme est lancé 
  //background(255); // effacer le fond à chaque image
  
  fill(255,5);
  noStroke();
  rect(0,0,width,height);
  
  fill(random(255),random(255),random(255));
  textSize(20+(mouseX+mouseY)/10);
  text("Bonjour !",mouseX,mouseY);
}
