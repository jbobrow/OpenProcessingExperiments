
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/62717*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */


/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/29631*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */


/*Pied de Poule
 *par Jacques Maire
 *fait le 28 mai 2012
 *
 *photo credit:"http://www.photo-libre.fr"
 */

import remixlab.proscene.*;
PImage photo;

Scene scene;

float wid, hei, haut;
void setup() {
  size(800, 900, P3D);
  scene=new Scene(this);
  scene.setAxisIsDrawn(false);
  scene.setGridIsDrawn(false);
  scene.camera().setPosition(new PVector(0, 0, 700));
  photo = loadImage("v2.gif");
  frameRate(30);
  wid=photo.width/2.0;
  hei=photo.height/2.0;
} 
void draw() {
  background(0,0,35);
  noStroke();
 directionalLight(255, 255,255, -1, -1, -0.1); 
  directionalLight( 255, 255 ,255*sin(millis()*0.02), 2,1+sq(sin(millis()*0.01)), -0.1); //255*sq(cos(millis()*0.01)) 
  directionalLight(255, 100,100, -0.3+0.2*sin(millis()*0.002)/10, -0.3+0.1*cos(millis()*0.002)/10, -0.2); 
float ct=-3*cos((millis()%10000)*0.00005*TWO_PI);
  for (int x=5;x<photo.width;x+=10) {
    for (int y=5;y<photo.height;y+=10) { 
      pushMatrix();
      haut=10-20*sq(sin(0.015*(x-wid)*ct))-20*cos(0.015*(y-hei)*ct);
      haut+=haut*cos(haut/TWO_PI);
      haut*=sin(haut);
      translate(x-wid, y-hei, 0);
      rotateZ(millis()*0.001);
      scale(1.2, 1.2, 1);
      beginShape(TRIANGLES);
      texture(photo);
      vertex(0, 0, haut, x, y);
      vertex(-5, -5, 0, x-5, y-5);
      vertex(5, -5, 0, x+5, y-5);
      vertex(0, 0, haut, x, y);
      vertex(-5, -5, 0, x-5, y-5);
      vertex(-5, 5, 0, x-5, y+5);
      vertex(0, 0, haut, x, y);
      vertex(5, -5, 0, x+5, y-5);
      vertex(5, 5, 0, x+5, y+5);
      vertex(0, 0, haut, x, y);
      vertex(-5, 5, 0, x-5, y+5);
      vertex(5, 5, 0, x+5, y+5);  
      endShape();
      popMatrix();
    }
  }
}


