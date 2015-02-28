
//Un point  règlable toujours aligné avec deux points baladeurs
import remixlab.proscene.*;
float r,lambda;
Scene scene;
InteractiveFrame frame1, frame2, frame3;
AxisPlaneConstraint contrainte1, contrainte3;
PVector pos3, dir3,diff;

void setup() {        
     size(800, 600, P3D);
     r=3;
     scene = new Scene(this);
     scene.setRadius(90);
     scene.showAll();
     scene.setCameraType(Camera.Type.PERSPECTIVE);//ORTHOGRAPHIC
     scene.setGridIsDrawn(false);
     scene.drawAxis(30f);
     contrainte1=new LocalConstraint();
     contrainte3=new LocalConstraint();

     contrainte3.setRotationConstraintType(AxisPlaneConstraint.Type.FORBIDDEN);
     // contrainte1.setRotationConstraintDirection(constraints[previous].rotationConstraintDirection());

     float low = 0;
     float high = 40;
     frame1 = new InteractiveFrame(scene);
     frame1.setPosition(new PVector(random(low, high), random(low, high), random(low, high)));
     frame2 = new InteractiveFrame(scene);
     frame2.setPosition(new PVector(random(low, high), random(low, high), random(low, high)));
     frame3 = new InteractiveFrame(scene);
   
    
        lambda=0.5;
     pos3=PVector.mult(PVector.add(frame1.position(), frame2.position()),lambda);
     frame3.setPosition(pos3);
     dir3=PVector.sub(frame1.position(), frame2.position());
     contrainte3.setTranslationConstraintType(AxisPlaneConstraint.Type.AXIS);
     contrainte3.setTranslationConstraintDirection(dir3);
     frame1.setConstraint(contrainte1);
     frame3.setConstraint(contrainte3);
}
void draw() {
     background(0);
  //le point bleu   
     pushMatrix();
     frame1.applyTransformation(); 
     scene.drawAxis(r*10f);
     noStroke();
     fill(0, 0, 255);
     sphere(r);
     popMatrix();
  //le point rouge 
     pushMatrix();
     frame2.applyTransformation();
     scene.drawAxis(r*5f);
     noStroke();
     fill(255, 0, 0);
     sphere(r);
     popMatrix();
 //calcul du point blanc
     PVector adir3=dir3.get();
      dir3=PVector.sub(frame1.position(), frame2.position());
     PVector diff=PVector.sub(dir3,adir3);
 if(diff.mag()>0){    
       frame3.setPosition(PVector.add(PVector.mult(frame2.position(),lambda),PVector.mult(frame1.position(),1.0-lambda))); }  
     pushMatrix();
     frame3.applyTransformation();
     contrainte3.setTranslationConstraintDirection(dir3); 
     scene.drawAxis(r*7f);
     noStroke();
     fill(255);
     sphere(r*1.5);
     popMatrix();

    ligne(frame1.position(), frame2.position());
    
     PVector f1f3=PVector.sub(frame3.position(), frame1.position());
     PVector  f1f2=PVector.sub(frame2.position() , frame1.position());
    lambda=(f1f2.dot(f1f3))/(f1f2.dot(f1f2));
    
  
}

void ligne(PVector u, PVector v) {
     stroke(255, 255, 0);
    strokeWeight(5);
     line(2.0*u.x-v.x, 2.0*u.y-v.y,2.0*u.z-v.z, 2.0*v.x-u.x, 2.0*v.y-u.y,2.0*v.z-u.z);
}


