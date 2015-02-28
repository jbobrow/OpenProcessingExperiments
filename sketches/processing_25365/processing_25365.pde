
/*
Demonstration de l'utilisation des PGraphics:
deux ellipses suivent la souris. L'ellipse rouge est dessinee 
sur un PGraphics et l'autre directement sur la scene.
*/


PGraphics pgraphics;


void setup() {
  size(400,400);
  smooth();
  noStroke();
  
  // Creer une surface de dessin "hors-scene"
  pgraphics = createGraphics(width, height, P2D);
  smooth();
  
  

  frameRate(20);
  
  
}

void draw() {
  

  // Selectionner le PGraphics comme surface de dessin
  pgraphics.beginDraw();
  pgraphics.smooth();
  pgraphics.noStroke();
  
  // Creer l'effet de fondu.
  pgraphics.fill(0,10);
  pgraphics.rect(0,0,width,height);
  
  // Dessiner l'ellipse rouge
  pgraphics.fill(255,0,0);
  pgraphics.ellipse(mouseX - 20 ,mouseY,20,20);
  
  // Deselectionner le PGraphics comme surface de dessin
  pgraphics.endDraw();
  
  // Dessiner le PGraphics sur la scene
 
  image(pgraphics, 0, 0); 
  
  // Dessiner l'ellipse blanche sur la scene
  fill(255);
  ellipse( mouseX + 20, mouseY , 20, 20);
 
 
}


