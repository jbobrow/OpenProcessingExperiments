
import remixlab.proscene.*;
Scene scene;


PointSphere pt1, pt2;
PointM pointm;
Quaternion qphi, qpsi, qcomp;
PVector o=new PVector(0, 0, 0);
float phi, psi, phi0, psi0, phipsi0, phipsi, departDelai;
boolean avancer2, avancer1, avancer3;

void setup() {

     size(850, 850, P3D);


     scene=new Scene(this);
     scene.setGridIsDrawn(false);
     scene.setAxisIsDrawn(true);
     pointm=new PointM();
      phi=PI*0.4;
     phi0=0;
     psi=PI*0.6;
     psi0=0;
     pt1=new PointSphere(new PVector(250,-270, -110),phi);
     pt2=new PointSphere(new PVector(-100, -300, 130),psi);

     scene.camera().setPosition(new PVector(0, 0, 600));
    
     avancer1=true;
     avancer2=false;
     avancer3=true;
     qphi=new Quaternion(pt1.repere.position(), phi);
     qpsi=new Quaternion(pt2.repere.position(), psi);
     qcomp=Quaternion.multiply(qpsi, qphi);
     scene.camera().setPosition(new PVector(0, -200, 800));
frameRate(20);
}


void draw() {
     background(255);
     directionalLight(185, 175, 255, -0.3, 1, -1);
     directionalLight(155, 255, 195, 0.2, 1, -0.5);
     directionalLight(255, 150, 195, -1, -1, -0.5);
 directionalLight(255, 255, 195,1, -3, 1);


     pointm.draw();
     pt1.draw(pointm.mpos);
     pt2.draw(pointm.phimpos);
     phi=pt1.angleRot;
     psi=pt2.angleRot;
     qphi=pt1.quat2;
     qpsi=pt2.quat2;
     qcomp=Quaternion.multiply(qpsi, qphi);
     phipsi=qcomp.angle();

     if (millis()>departDelai+1000) {
          if (phi==phi0 &&psi==psi0 && phipsi==phipsi0) {
               phi0=0;
               psi0=0;
               phipsi0=0;
          }
          phi0=phi0+0.017;
          if (phi0>phi) {
               psi0=psi0+0.017; 
               if ( psi0<psi) { 
                    avancer2=true;
                    avancer1=false;
                    ;
               }
               else {
                    phi0=0;
                    avancer1=true;
                    avancer2=false;
               }
          }
          else {
               avancer1=true;
               avancer2=false;
               psi0=0;
          }
          phipsi0+=phipsi*0.017/(phi+psi);
          if (phipsi0>phipsi) {

               phipsi0=phipsi;
               phi0=phi;
               psi0=psi;
               avancer1=false;
               avancer2=true;
               departDelai=millis();
          }
     }
}


