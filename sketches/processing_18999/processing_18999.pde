
int ellipseX = 66;
int ellipseY = 100;
int rayon = 40;
 
int rectX = 133;
int rectY = 60;
int rectW = 40;
int rectH = 80;
 
void setup() {
  size(200,200);
  noStroke();
}
 
void draw() {  //draw function loops
  background(200);
   
  // detecter le mouseOver sur un cercle
  float distance = dist( mouseX , mouseY , ellipseX , ellipseY );
  if ( distance < rayon ) {
      // mouseOver
      fill(255);
  } else {
      fill(0);
  }
  
  ellipse( ellipseX , ellipseY , rayon *2 , rayon*2 );
   
  // detecter le mouseOver sur un rectangle
  float gauche = rectX ;
  float droite = rectX+rectW;
  float haut = rectY;
  float bas = rectY+rectH;
  if ( mouseX > gauche && mouseX < droite && mouseY > haut && mouseY < bas ) {
      // mouseOver
      fill(255);
  } else {
      fill(0);
  }
  rect( rectX , rectY , rectW , rectH );
   
   /*
 rectMode(CENTER);
 float gauche = rectX - rectW/2;
 float droite = rectX+rectW/2;
 float haut = rectY - rectH/2;
 float bas = rectY+rectH/2;
  if ( mouseX > gauche && mouseX < droite && mouseY > haut && mouseY < bas ) {
      // mouseOver
      fill(255);
  } else {
      fill(0);
  }
  rect( rectX , rectY , rectW , rectH );
   */
   
}

