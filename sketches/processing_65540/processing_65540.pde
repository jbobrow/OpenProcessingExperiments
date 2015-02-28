
/**Alcys_OrthoLog
 * fait par Jacques Maire
 * le mardi 19 juillet 2012
 */
import remixlab.proscene.*;
Scene scene;
InteractiveFrame repere;
float k=1;
float a, r, angle, rapport;
PVector oy=new PVector(0, 1, 0), oz=new PVector(0, 0, 1);
int nb=10;
void setup () {
  size( 900, 900, P3D ); 
  scene=new Scene(this); 
  scene.setGridIsDrawn(false);
  scene.setAxisIsDrawn(false);
  scene.camera().setPosition(new PVector(0, 0, 28000));
  repere=new InteractiveFrame(scene);
  frameRate(40);
}

void draw ()
{ 
  angle=0.0001*millis();
  rapport=0.3+0.2*sq(cos(angle));
  background(0 );
  directionalLight(255, 0, 0, 0, -1, -0.1);
  directionalLight(0, 0, 255, -0.2, 1, 0);
  directionalLight(255, 255, 0, -1, 0, -0.4);

  for (int u=0;u<nb;u++) { 
    for (int v=0;v<50;v++) {
      PVector v0=vecteur(u, PI/nb*v);
      PVector v1=vecteur(u, PI/nb*(v+1));
      PVector dif=PVector.sub(v1, v0);
      float lon=dif.mag()*1.2;
      fill(255);
      noStroke();
      if (v0.mag()>10) {
        //-------------------------------------  
        repere.setPosition(PVector.add(PVector.mult(v0, 0.5), PVector.mult(v1, 0.5)));
        repere.setOrientation(new Quaternion(oz, dif.cross(oz)));
        pushMatrix();
        repere.applyTransformation();
        rotate(angle*40);
        box(0.55*lon, lon*0.55, 2*lon*rapport); 
        popMatrix();
        repere.setPosition(v0);
        pushMatrix();
        repere.applyTransformation();
        rotate(-angle*40);  
        fill(255);
       scene.cone(8, lon*0.6, lon*0.6, 100+2*cos(5*angle)*lon*rapport);
        popMatrix();

        //--------------------------------------
        repere.setOrientation(new Quaternion(oz, dif));
        repere.setPosition(v0);
        pushMatrix();
        repere.applyTransformation();
        fill(255);
        rotate(-angle*40);
        scene.cone(8, lon*0.6, lon*0.6,100+2*sin(5*angle)*lon*rapport);
        popMatrix();
      }
    }
  }
}
PVector vecteur(int u, float t) {
  float  aa=0.01*exp(k*2*PI*u/nb);
  float rayon=aa*exp(k*t);
  return new PVector(rayon*cos(t), rayon*sin(t), 0);
}


