
//Un point  règlable toujours aligné avec deux points baladeurs
import remixlab.proscene.*;
float r,lambda;
Scene scene;
InteractiveFrame frame1, frame2;
AxisPlaneConstraint  contrainte3;
PVector pos3, dir3,diff;
Rail segment;
void setup() {        
     size(800, 600, P3D);
     r=6;
     scene = new Scene(this);
     scene.setRadius(190);
     scene.showAll();
     scene.setCameraType(Camera.Type.PERSPECTIVE);//ORTHOGRAPHIC
     scene.setGridIsDrawn(false);
     scene.drawAxis(90f);
    
   
    

     float low = -50;
     float high = 140;
     frame1 = new InteractiveFrame(scene);
     frame1.setPosition(new PVector(random(low, high), random(low, high), random(low, high)));
     frame2 = new InteractiveFrame(scene);
     frame2.setPosition(new PVector(random(low, high), random(low, high), random(low, high)));
    segment=new Rail();
}




void draw() {
     background(50,0,45);
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
     scene.drawAxis(r*10f);
     noStroke();
     fill(255, 0, 0);
     sphere(r);
     popMatrix();
   //le point blanc
     segment.actualiser();
   //le segment
    line1(frame1.position(), frame2.position());

}

void line1(PVector u, PVector v) {
     stroke(255, 255, 0);
    strokeWeight(10);
     line(v.x, v.y,v.z, u.x, u.y,u.z);
}


