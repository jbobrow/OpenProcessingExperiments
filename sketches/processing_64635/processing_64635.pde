
/*Alcys_Immortelles
*"everlasting flower"
*fait par Jacques Maire
*le lundi 25 juin 2012
*/

import remixlab.proscene.*;

Scene scene;
float temp;
Brin[] brins;
 Quaternion q;
 int nb; 
void setup(){
size(900,700,P3D);
scene=new Scene(this);
  scene.setGridIsDrawn(false);
  scene.setAxisIsDrawn(false);

 scene.camera().setPosition(new PVector(-1000,7200,1500));
  scene.camera().lookAt( scene.camera().sceneCenter() );
  scene.camera().addKeyFrameToPath(1);

  scene.camera().setPosition(new PVector(7000,1000,1500));
  scene.camera().lookAt( scene.camera().sceneCenter() );
  scene.camera().addKeyFrameToPath(1);

  scene.camera().setPosition(new PVector(1000,-3200,1500));
  scene.camera().lookAt( scene.camera().sceneCenter() );
  scene.camera().addKeyFrameToPath(1);

  scene.camera().setPosition(new PVector(-1000,7200,1500));
  scene.camera().lookAt( scene.camera().sceneCenter() );
  scene.camera().addKeyFrameToPath(1);
        scene.camera().playPath(1);


  //re-position the camera:
  scene.camera().setPosition(new PVector(-1000,7200,1500));
  scene.camera().lookAt( scene.camera().sceneCenter() );
 // scene.showAll();
scene.setCameraPathsAreDrawn(false);
 scene.camera().keyFrameInterpolator(1).setInterpolationSpeed(0.12);
 scene.camera().keyFrameInterpolator(1).setLoopInterpolation(true);
 
nb=150;
brins=new Brin[nb];
for(int i=0;i<nb;i++){
brins[i]= new Brin(new PVector(random(-5000,5000),random(-5000,5000),-1000));
}}

void draw(){
  temp=millis()*0.004+0.002*sq(cos(0.02*millis()));
 background(255, 255, 190);
  directionalLight(255, 255, 0, 0, -1, -1);
  directionalLight(0, 0, 155, -1, 0, -1);
  directionalLight(0, 155, 0, -1, 0, 1);
  directionalLight(255, 0, 0, 1, 1, -1);
  for(int i=0;i<nb;i++){
 brins[i].dessineBrin();
}}

