
/* @pjs preload="harper.png"; 
 */

/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/18328*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

float colonnes = 10;
float rangees = 10;

float angle;
PImage img;

int time;

void setup(){
  
  size(400,400,P3D);
  
 
  noStroke();
  
  img = loadImage("harper.png");
  
  angle=0;
  
  // TRES IMPORTANT:
  textureMode(NORMALIZED);
  
  time = millis();
}
void draw(){
  background(10);
  
  int elapsed = millis() - time;
  time = millis();
  
  //println(elapsed);
  angle = (elapsed*0.0015) + angle;
  
  float angleColonne = angle;
  float angleRangee = angle;
  
  float largeurColonne = width/colonnes;
  float hateurRangee = height/rangees;
  
  translate(largeurColonne/2,hateurRangee/2);
  
  for(int c=0;c<colonnes;c++){   // colonnes
    angleColonne = angleColonne+0.1;
    angleRangee = angleColonne;
    for(int r=0;r<rangees;r++){     // rangees 
      angleRangee = angleRangee+0.1;
      pushMatrix();
      translate(c*largeurColonne,r*hateurRangee);
      rotate(angleRangee);
      //if ( mousePressed ) {
        //translate(largeurColonne/2,hateurRangee/2);
      //} else {
        translate(-largeurColonne/2,-hateurRangee/2);
      //}
      //rotate(-angleRangee);
      beginShape();
        texture(img);
        // VERTEX: X Y Z textureX textureY
        vertex(0,0,0,c/colonnes,r/rangees);
        vertex(largeurColonne,0,0,(c+1)/colonnes,r/rangees);
        vertex(largeurColonne,hateurRangee,0,(c+1)/colonnes,(r+1)/rangees);
        vertex(0,hateurRangee,0,c/colonnes,(r+1)/rangees);
        
      endShape();
      popMatrix();
    }
  }
  
}


void mousePressed() {
   colonnes = (int) random(1,50);
    rangees = (int) random(1,50);
}


