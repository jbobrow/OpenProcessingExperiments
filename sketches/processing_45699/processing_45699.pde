
//Un point  règlable toujours aligné avec deux points baladeurs
import remixlab.proscene.*;
float r;
int nb=4;
int nbrail=6;
Scene scene;
Balle[] balles;

PVector[] posfr= {
     new PVector(-100, -100, 0), new PVector(-60, 80, 0), new PVector(30, 10, 80), new PVector(100, -40, -70)
};
color[] couleurs= {
     color(255, 0, 255), color(0, 0, 255), color(255, 0, 255), color(100, 100, 255)
};
color[] tcouleurs= {
     color(255, 0, 255, 90), color(255, 255, 0, 90), color(255, 0, 0, 90), color(100, 100, 255, 90)
};
color[] tc;
Rail[] guides;

void setup() {        
     size(800, 600, P3D);
     tc=new color[20];
     for (int i=0;i<20;i++) {
          tc[i]=color(random(100,255),random(100,155),random(100,255),90);
     }
     r=3;
     scene = new Scene(this);
     scene.setRadius(90);
     scene.showAll();
     scene.setCameraType(Camera.Type.PERSPECTIVE);
     scene.setGridIsDrawn(false);
     scene.drawAxis(30f);


     balles=new Balle[nb];
     for (int i=0;i<nb;i++) {
          balles[i]=new Balle(posfr[i], couleurs[i]);
     }

     guides=new Rail[6];
     guides[0]=new Rail(0, 1);
     guides[1]=new Rail(1, 2);
     guides[2]=new Rail(2, 0); 
     guides[3]=new Rail(0, 3); 
     guides[4]=new Rail(1, 3); 
     guides[5]=new Rail(2, 3);
}
void draw() {
     background(255, 200, 200);
     directionalLight(100,100,0,1,-1,1);lights();
     //les points bleus
     for (int i=0;i<nb;i++) { 
          pushMatrix();
          balles[i].iFrame.applyTransformation(); 
          //scene.drawAxis(r*5f);
          noStroke();
          fill(0, 0, 255);
          sphere(r);
          popMatrix();
     }

     //les points guidés

     for (int i=0;i<nbrail;i++)
     { 
          guides[i].actualiser();
          ligne(balles[guides[i].ndepart].iFrame.position(), balles[guides[i].narrivee].iFrame.position());
     }
     //les faces des tretraedres 
     dessinerFaces();
}

void ligne(PVector u, PVector v) {
     stroke(255, 255, 0);
     strokeWeight(2);
     line(2.0*u.x-v.x, 2.0*u.y-v.y, 2.0*u.z-v.z, 2.0*v.x-u.x, 2.0*v.y-u.y, 2.0*v.z-u.z);
}
void  dessinerFaces() {
     noStroke();

     for (int i=0;i<nb;i++) { 
          fill(tcouleurs[i]);
          beginShape();
          for (int j=0;j<nb;j++) { 
               if (j!=i) vertex(balles[j].iFrame.position().x, balles[j].iFrame.position().y, balles[j].iFrame.position().z);
          }
          endShape(CLOSE);
     }

     fill(255,255,0,60);
     int t=0;
      for(int i=0;i<nbrail;i++){ 
        
      for(int k=i+1;k<nbrail;k++){ 
      for(int j=k+1;j<nbrail;j++){ fill(tc[t]) ; t++;    
      beginShape(); vertex(guides[i].repere.position().x,guides[i].repere.position().y,guides[i].repere.position().z);  
       vertex(guides[k].repere.position().x,guides[k].repere.position().y,guides[k].repere.position().z);
      
      vertex(guides[j].repere.position().x,guides[j].repere.position().y,guides[j].repere.position().z);
      endShape(CLOSE);
      }}}
      
      }

