
/**
*Alcys_Etageres
*
*Par Jacques Maire
*fait le 24 mai 2012
*/

import remixlab.proscene.*;


Scene scene;
Planche planch;
ArrayList planches;
PImage bois;


void setup() {
  size(900, 700, P3D);
  scene=new Scene(this); 
  bois=loadImage("bois.png");
  planches= new ArrayList();
  scene.setGridIsDrawn(false);
  scene.setAxisIsDrawn(false);
  scene.setRadius(50);
  scene.showAll();
 // scene.setFrameSelectionHintIsDrawn(true);
  scene.setShortcut('f', Scene.KeyboardAction.DRAW_FRAME_SELECTION_HINT);
  scene.camera().setPosition(new PVector(0, 4000, 1500));
  scene.camera().lookAt(new PVector(0, 0, 1000));
  scene.camera().setOrientation(  new Quaternion(  new PVector(1, 0, 0), -1.55  ) ); 
  assemblage();
}
void assemblage() {
 
  planches.add(new Planche(this, new PVector(590, 190, 15), new Quaternion(new PVector(0, 0, 1), 0), 30, 30, 30));//pieds
  planches.add(new Planche(this, new PVector(-590, -190, 15), new Quaternion(new PVector(0, 0, 1), 0), 30, 30, 30));//pieds
  planches.add(new Planche(this, new PVector(-590, 190, 15), new Quaternion(new PVector(0, 0, 1), 0), 30, 30, 30)); //pieds
  planches.add(new Planche(this, new PVector(590, -190, 15), new Quaternion(new PVector(0, 0, 1), 0), 30, 30, 30)); //pieds   
  planches.add(new Planche(this, new PVector(0, 0, 45), new Quaternion(new PVector(0, 0, 1), 0), 1200, 400, 30));//bas
  planches.add(new Planche(this, new PVector(590, 0, 460), new Quaternion(new PVector(0, 0, 1), 0), 20, 400, 800));//cote droit
  planches.add(new Planche(this, new PVector(-590, 0, 460), new Quaternion(new PVector(0, 0, 1), 0), 20, 400, 800));//cote gauche
   planches.add(new Planche(this, new PVector(-192.5, 0, 460), new Quaternion(new PVector(0, 0, 1), 0), 20, 400, 800));//cote int gauche
   planches.add(new Planche(this, new PVector(192.5, 0, 460), new Quaternion(new PVector(0, 0, 1), 0), 20, 400, 800));//cote int gauche 
   planches.add(new Planche(this, new PVector(0, 0, 875), new Quaternion(new PVector(0, 0, 1), 0), 1200, 400, 30));//haut
    planches.add(new Planche(this, new PVector(393.75, -190, 460), new Quaternion(new PVector(0, 0, 1), 0), 370, 20, 790));//fond droit
     planches.add(new Planche(this, new PVector(-393.75, -190, 460), new Quaternion(new PVector(0, 0, 1), 0), 370, 20, 790));//fond droit
     planches.add(new Planche(this, new PVector(0, -190, 460), new Quaternion(new PVector(0, 0, 1), 0), 370, 20, 790));//fond centre
      planches.add(new Planche(this, new PVector(0, 0, 450), new Quaternion(new PVector(0, 0, 1), 0), 370, 380, 20));//etagere centre
     planches.add(new Planche(this, new PVector(0, 0, 625), new Quaternion(new PVector(0, 0, 1), 0), 370, 380, 20));//etagere centre haut
      planches.add(new Planche(this, new PVector(0, 0, 215), new Quaternion(new PVector(0, 0, 1), 0), 370, 380, 20));//etagere centre bas
      
      
  planches.add(new Planche(this, new PVector(590, 190, 915), new Quaternion(new PVector(0, 0, 1), 0), 30, 30, 30));//pieds
  planches.add(new Planche(this, new PVector(-590, -190, 915), new Quaternion(new PVector(0, 0, 1), 0), 30, 30, 30));//pieds
  planches.add(new Planche(this, new PVector(-590, 190, 915), new Quaternion(new PVector(0, 0, 1), 0), 30, 30, 30)); //pieds
  planches.add(new Planche(this, new PVector(590, -190, 915), new Quaternion(new PVector(0, 0, 1), 0), 30, 30, 30)); //pieds   
  planches.add(new Planche(this, new PVector(0, 0, 945), new Quaternion(new PVector(0, 0, 1), 0), 1200, 400, 30));//bas  
  
    planches.add(new Planche(this, new PVector(590, 0, 1360), new Quaternion(new PVector(0, 0, 1), 0), 20, 400, 800));//cote droit
  planches.add(new Planche(this, new PVector(-590, 0, 1360), new Quaternion(new PVector(0, 0, 1), 0), 20, 400, 800));//cote gauche
   planches.add(new Planche(this, new PVector(-192.5, 0, 1360), new Quaternion(new PVector(0, 0, 1), 0), 20, 400, 800));//cote int gauche
   planches.add(new Planche(this, new PVector(192.5, 0, 1360), new Quaternion(new PVector(0, 0, 1), 0), 20, 400, 800));//cote int gauche 
   planches.add(new Planche(this, new PVector(0, 0, 1775), new Quaternion(new PVector(0, 0, 1), 0), 1200, 400, 30));//haut
    planches.add(new Planche(this, new PVector(393.75, -190, 1360), new Quaternion(new PVector(0, 0, 1), 0), 370, 20, 790));//fond droit
     planches.add(new Planche(this, new PVector(-393.75, -190, 1360), new Quaternion(new PVector(0, 0, 1), 0), 370, 20, 790));//fond droit
     planches.add(new Planche(this, new PVector(0, -190, 1360), new Quaternion(new PVector(0, 0, 1), 0), 370, 20, 790));//fond centre
      planches.add(new Planche(this, new PVector(0, 0, 1350), new Quaternion(new PVector(0, 0, 1), 0), 370, 380, 20));//etagere centre
     planches.add(new Planche(this, new PVector(0, 0, 1525), new Quaternion(new PVector(0, 0, 1), 0), 370, 380, 20));//etagere centre haut
      planches.add(new Planche(this, new PVector(0, 0, 1115), new Quaternion(new PVector(0, 0, 1), 0), 370, 380, 20));//etagere centre bas
        
        planches.add(new Planche(this, new PVector(0, 0, 1185), new Quaternion(new PVector(0, 0, 1), 0), 1.5, 1.2, 1));//boule
         planches.add(new Planche(this, new PVector(0, 0, 285), new Quaternion(new PVector(0, 0, 1), 0), 1.5, 1.2, 1));//boule
          
}



void draw() {
  background(0, 0, 150);
  // lights();
  directionalLight(255, 255, 255, 2, -1, -1);
  directionalLight(255,255, 255, 0.2, 1, -1);
  directionalLight(255,255, 255, -0.2, -0.3, -1);  
  fill(0, 125, 0);
  rect(-2000, -2000, 4000, 4000);
  float temps=min(planches.size(), millis()/2000.0);
  for (int i=0;i<temps;i++) {

    Planche planch=(Planche)planches.get(i);
    planch.actualiser( i);
  }
}















