


import saito.objloader.*;

OBJModel model;
OBJModel model1;
float rotX;
float rotY;
float rotZ;
//PImage img; 

void setup() {

 
size(1280,800,P3D);

 
  model = new OBJModel(this, "casing.obj",TRIANGLES);
  model1 = new OBJModel (this, "casing_2.obj", TRIANGLES);
  model.scale(80);
  model1.scale(80);
  model.translateToCenter();
  model1.translateToCenter();
  noStroke();
  fill(0);
}

void draw() {
   PImage img;
    img = loadImage("joint_spec_sheet.jpg");
  image(img,0,0,1280,800);
  noTint();
  println("joint_spec_sheet.jpg y7b");
  background(img);
  lights();
    
   pushMatrix();
  translate(900,400,0);
  rotateY(rotY);
  rotateX(rotX);
  rotateZ(rotZ);
  
  
  //model.draw();
  
    for (int j = 0; j < model1.getSegmentCount(); j++) {

        Segment segment = model1.getSegment(j);
        Face[] faces = segment.getFaces();

        noFill();
        stroke(196, 64);

        beginShape(QUADS);

        for(int i = 0; i < faces.length; i ++)
        {
            PVector[] vs = faces[i].getVertices();
            PVector[] ns = faces[i].getNormals();

            for (int k = 0; k < vs.length; k++) {
                normal(ns[k].x, ns[k].y, ns[k].z);
                vertex(vs[k].x, vs[k].y, vs[k].z);
            }
        }

        endShape();

        // the face projected along the center normal    
        fill(#4BB2FF,95);
        noStroke();    

        beginShape(TRIANGLES);

        for(int i = 0; i < faces.length; i ++)
        {
            PVector[] v = faces[i].getVertices();
            PVector n = faces[i].getNormal();
            
            float nor = abs(sin(radians((frameCount+i))) * 200);

            for (int k = 0; k < v.length; k++) {
                
                vertex(v[k].x + (n.x*nor), v[k].y + (n.y*nor), v[k].z + (n.z*nor));
            }
        }

       
        endShape();
    }

    popMatrix();



  
  pushMatrix();
  translate(400,450,0);
  rotateY(rotY);
  rotateX(rotX);
  rotateZ(rotZ);
  
  
  //model.draw();
  
    for (int j = 0; j < model.getSegmentCount(); j++) {

        Segment segment = model.getSegment(j);
        Face[] faces = segment.getFaces();

        noFill();
        stroke(196, 64);

        beginShape(QUADS);

        for(int i = 0; i < faces.length; i ++)
        {
            PVector[] vs = faces[i].getVertices();
            PVector[] ns = faces[i].getNormals();

            for (int k = 0; k < vs.length; k++) {
                normal(ns[k].x, ns[k].y, ns[k].z);
                vertex(vs[k].x, vs[k].y, vs[k].z);
            }
        }

        endShape();

        // the face projected along the center normal    
        fill(#4BB2FF,95);
        noStroke();    

        beginShape(TRIANGLES);

        for(int i = 0; i < faces.length; i ++)
        {
            PVector[] v = faces[i].getVertices();
            PVector n = faces[i].getNormal();
            
              float nor = abs(sin(radians((frameCount+i))) * 200);

            for (int k = 0; k < v.length; k++) {
                
                vertex(v[k].x + (n.x*nor), v[k].y + (n.y*nor), v[k].z + (n.z*nor));
           }
        }

       
        endShape();
    }

    popMatrix();
}


void mouseDragged()
{
    rotX += (mouseX - pmouseX) * 0.01;
    rotY += (mouseY - pmouseY) * 0.01;
    rotZ += (mouseX - pmouseX) * 0.01;
}


  


