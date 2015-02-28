

/**
* DEUX ECRANS
*par Jacques Maire
* fait le 10 mai 2012
**/



import remixlab.proscene.*;


Scene mainScene, atScene;
int largeAt=300;
PGraphics canevas, atcanvas;
Bipole bipole;


void setup() {
  size(900, 700, P3D);
  atcanvas=createGraphics(largeAt, height, P3D);
  atScene=new Scene(this, (PGraphics3D) atcanvas, 0, 0);  
  atScene.setRadius(50);
  atScene.setGridIsDrawn(false);
  atScene.setAxisIsDrawn(true);

  canevas = createGraphics( width-largeAt, height, P3D);
  mainScene = new Scene(this, (PGraphics3D) canevas, largeAt, 0);
  mainScene.setGridIsDrawn(false);
  mainScene.setAxisIsDrawn(true);
  mainScene.setRadius(110);
  bipole=new Bipole();

}



void draw() {
  handleMouse(); 
  
  //--------------------------------- 
  // dessin dans la partie principale 
  //----------------------------------
  canevas.beginDraw();
  mainScene.beginDraw();

  PGraphics3D pgm=mainScene.renderer(); 
  pgm.background(255);
 pgm.directionalLight(255,255,255,-1,-1,2);
    pgm.directionalLight(255,255,255,1,0,-1);
    pgm.lights();
  for (int i=0;i<20;i++) {
 
   pgm.pushMatrix();
    pgm.rotateZ(TWO_PI/20*i+millis()/5000.0);
    pgm.scale(1+0.1*i+cos(millis()/5000.0));
   pgm. translate(2*i,2*i,2*i);
    bipole.draw(pgm);
    pgm.popMatrix();
  }

  mainScene.endDraw();
  canevas.endDraw();
  image(canevas, mainScene.upperLeftCorner.x, mainScene.upperLeftCorner.y);


  //--------------------------------- 
  // dessin dans la partie atelier
  //----------------------------------  

  atcanvas.beginDraw(); 
  atScene.beginDraw(); 
  PGraphics3D pg=atScene.renderer();
  pg.background(0,0,150);
   pg.directionalLight(255,255,255,-1,-1,1);
    pg.directionalLight(255,255,255,-1,0,-1);
    pg.noStroke();

 for(int i=0;i<4;i++){
pg.pushMatrix();
bipole.repere[i].applyTransformation(pg);
pg.fill(bipole.couleur[i]);
pg.sphere(bipole.r);
pg.popMatrix();
}
    
    
  bipole.draw(pg);
  atScene.endDraw();
  atcanvas.endDraw();
  image(atcanvas, atScene.upperLeftCorner.x, atScene.upperLeftCorner.y);
}



public void handleMouse() {


  if (mouseX < largeAt) {
    mainScene.disableMouseHandling();
    mainScene.disableKeyboardHandling();
    atScene.enableMouseHandling();
    atScene.enableKeyboardHandling();
  } 
  else {
    atScene.disableMouseHandling();
    atScene.disableKeyboardHandling();
    mainScene.enableMouseHandling();
    mainScene.enableKeyboardHandling();
  }
}

void ligne(PGraphics3D gg, PVector u, PVector v, float e, int c) {
  gg.stroke(c);
  gg.strokeWeight(e);
  gg.line(v.x, v.y, v.z, u.x, u.y, u.z);
}



