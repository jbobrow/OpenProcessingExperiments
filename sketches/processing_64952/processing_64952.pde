
/**Alcys_PerlinNoise
*fait le lundi 2 juillet 2012
*par Jacques Maire
*/


import remixlab.proscene.*;
Scene scene;
InteractiveFrame souris;
AxisPlaneConstraint planaire;
PImage lena;
float compteur;
float nscal=2.2;
float decalage = PI; 
float pente=56;
int dheight,dwidth;


void setup(){
size(900,900,P3D);
lena=loadImage("lena.gif");
dheight=256;
dwidth=256;
scene=new Scene(this);
scene.setGridIsDrawn(false);
scene.setAxisIsDrawn(false);
souris=new InteractiveFrame(scene);
planaire =  new WorldConstraint();
 planaire.setRotationConstraintType(AxisPlaneConstraint.Type.FORBIDDEN);
         planaire.setTranslationConstraintType(AxisPlaneConstraint.Type.PLANE);
         planaire.setTranslationConstraintDirection(new PVector(0,0,1));   
         souris.setConstraint(planaire);
         souris.setPosition(180,180,500);
         
lena.loadPixels();  
scene.camera().setPosition(new PVector(0,0,1000));
}
void draw() {
  if(!(souris.grabsMouse() && mousePressed))compteur+=0.03;
  background(50,80,125); noiseDetail(3);
  for(int y = -dheight; y < dheight; y+=5) {
    for(int x =-dwidth; x <dwidth; x+=5) {
       float npx= map(souris.position().x, 0, width, 0, 1);
       float nx= map(x, -dwidth,dwidth , 0, 1);
        float npy= map(souris.position().y, 0, height, 0, 1);
       float ny= map(y, -dheight, dheight, 0, 1);
       float xfil = noise(compteur+(npx+nx) * nscal+ decalage,(npy+ny) * nscal+ decalage);
      float yfil=noise(compteur+(npx+nx) * nscal- decalage,(npy+ny) * nscal- decalage);

        noStroke();
        fill(lena.pixels[(y +dheight)*dwidth*2+x +dheight]);
       // ellipse(x+lerp(-pente, pente, xfil),y+ lerp(-pente, pente, yfil),6,6);
       pushMatrix();
       translate(x+lerp(-pente, pente, xfil),y+ lerp(-pente, pente, yfil),lerp(-200,200,yfil+xfil));
        ellipse(x+lerp(-pente, pente, xfil),y+ lerp(-pente, pente, yfil),12,12);
       popMatrix();
    }
  }
  pushMatrix();
  souris.applyTransformation();
  noStroke();fill(255,250,0);
  sphere(20);
  popMatrix();
}

