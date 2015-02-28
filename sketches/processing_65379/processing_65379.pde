
/**Alcys_Directed_Spiral
*fait le 12 juillet 2012
*par Jacques Maire
*/

import remixlab.proscene.*;
Scene scene;
Quadr quadr;
InteractiveFrame[] frames;
InteractiveFrame utile;
int nb=30;
int nblateral=5;
void setup() {
  size(900, 900, P3D);
  scene=new Scene(this); 
  scene.setGridIsDrawn(true);
  scene.setAxisIsDrawn(true);
  scene.camera().setPosition(new PVector(0, 0, 900));
  quadr=new Quadr();
  utile=new InteractiveFrame(scene);
 frames=new InteractiveFrame[nb];
 for(int i=0;i<nb;i++){
    frames[i]=new InteractiveFrame(scene);
    if(i>1)frames[i].setReferenceFrame(frames[i-1]);
}
}
void draw() {
   background(0, 0, 60);
  directionalLight(255,0,0, 0, -1, -1);
  directionalLight(255, 150, 0, 0,1, 1);
  directionalLight(0, 255, 255, -1, 0, 1);
  directionalLight(0, 0, 255, 1, 1, -1);
 
 spirale();
  
}
void spirale(){
   quadr.dessineSpheres();
    calculCoordTransverses();
   float rapp=1;

  pushMatrix();   
     frames[0].applyTransformation(); 
     quadr.quadrilateres();
  for(int i=1;i<nb;i++){
   PVector posA=quadr.q.rotate(quadr.reperes[0].position());
   posA.mult(quadr.rapport);
   frames[i].setTranslation(PVector.sub(quadr.reperes[3].position(),posA));
   frames[i].setRotation(quadr.q);
   frames[i].applyTransformation(); 
   scale(quadr.rapport);
  if(pow(quadr.rapport,i)<1000){quadr.quadrilateres();}
  }
  popMatrix();
}

void calculCoordTransverses(){
 PVector posA=quadr.q.rotate(quadr.reperes[0].position());
 posA.mult(quadr.rapport);
 utile.setTranslation(PVector.sub(quadr.reperes[3].position(),posA));
 utile.setRotation(quadr.q);
for(int i=0;i<nblateral;i++){
quadr.lateral[i]=utile.inverseCoordinatesOf(PVector.mult(quadr.reperes[4+i].position(),quadr.rapport));}

 
}

