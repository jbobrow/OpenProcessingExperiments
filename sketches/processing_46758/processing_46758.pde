
import netscape.javascript.*;

import ddf.minim.*;


Minim minim;
AudioSample kick;
int sens = 2000;
int space = 100;
int v = 240;
PShape myShape;
void setup() {
  background(240);
  size(screen.width, screen.height);
  noCursor();
  minim = new Minim(this);
  kick = minim.loadSample("preview(1).mp3", 2048);
  myShape = loadShape("kisanka.svg");
  smooth();
}

int witchClick = 0;
void draw() {
 // background(240);
  fill(240, 60);
  rect(0, 0, width, height);
  pushMatrix();
  translate(width/2, height/2);
  shapeMode(CENTER);
  for (int i=0; i< 1; i++) {
  float sz = kick.left.get(i)*sens;
 shape(myShape, 0, 0, 50+(1 *sz), 70+(1 *sz));
   }
   popMatrix();
 
}


void keyPressed()
{
  if ( key == 'm' ) kick.trigger();
}

void stop()
{
 kick.close();
  minim.stop();
  super.stop();
}

void mouseReleased(){
  witchClick+=1;
  save("kisanka#"+ nfs(witchClick, 5));
 
}


