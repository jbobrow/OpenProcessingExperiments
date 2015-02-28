
/* @pjs preload="harper.png"; 
 */

/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/18329*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */



float colonnes = 10;
float rangees = 10;

float angle;
PImage img;

void setup(){
  
  size(400,400,P3D);
  
  //frameRate(12);
  //smooth();
  noStroke();
  
  img = loadImage("harper.png");
  
  angle=0;
  
  // TRES IMPORTANT:
  textureMode(NORMALIZED);
  
}
void draw(){
  background(10);
  
  
 
    angle = angle + 0.1;
 
  //float angleColonne = angle;
  //float angleRangee = angle;
  
  float largeurColonne = width/colonnes;
  float hateurRangee = height/rangees;
  
  translate(largeurColonne/2,hateurRangee/2);
  
  for(int c=0;c<colonnes;c++){   // colonnes
    //angleColonne = angleColonne+0.1;
    //angleRangee = angleColonne;
    for(int r=0;r<rangees;r++){     // rangees 
      //angleRangee = angleRangee+0.1;
      pushMatrix();
      translate(c*largeurColonne,r*hateurRangee);
      float a = atan2(mouseY-r*hateurRangee-hateurRangee*0.5,mouseX-c*largeurColonne-largeurColonne*0.5);
      rotate(a);
      //rotate(angleRangee);
      //if ( mousePressed ) {
      //  translate(largeurColonne/2,hateurRangee/2);
      //} else {
        translate(-largeurColonne/2,-hateurRangee/2);
      //}
      beginShape();
        texture(img);
        // VERTEX: X Y Z textureX textureY
        vertex(0,0,0,0,0);
        vertex(largeurColonne,0,0,1,0);
        vertex(largeurColonne,hateurRangee,0,1,1);
        vertex(0,hateurRangee,0,0,1);
        
      endShape();
      popMatrix();
    }
  }
  
}


void mousePressed() {
 colonnes = (int)random(1,50);
 rangees = (int)random(1,50); 
  
}


