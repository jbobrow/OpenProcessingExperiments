
import saito.objloader.*;


OBJModel model;

float xrot;
float rotX;
float rotY;


void setup()
{
  size(600, 600, P3D);
  colorMode(HSB);
  model = new OBJModel(this, "testfinal.obj", "relative", QUADS);


  model.enableDebug();

  model.scale(2);  

  noStroke();
}

void draw() {
  background(0,0,200);
  lights();
  xrot = xrot+0.004;
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(xrot);
  rotateY(xrot);



  for (int j = 0; j < model.getSegmentCount(); j++) {
println(j);
    Segment segment = model.getSegment(j);
    Face[] faces = segment.getFaces();

    noFill();
    noStroke();

    beginShape(QUADS);

    for (int i = 0; i < faces.length; i ++)
    {
      PVector[] vs = faces[i].getVertices();
      PVector[] ns = faces[i].getNormals();

      for (int k = 0; k < vs.length; k++) {
        normal(ns[k].x, ns[k].y, ns[k].z);
        vertex(vs[k].x, vs[k].y, vs[k].z);
      }
    }

    endShape();

  fill(mouseX/2, mouseX*2/3, mouseX/2);
    noStroke();    

    beginShape(QUADS);

    for (int i = 0; i < faces.length; i ++)
    {
      PVector[] v = faces[i].getVertices();
      PVector n = faces[i].getNormal();

      float nor = abs(tan(radians((frameCount+i))) * mouseY*2);

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
    rotY -= (mouseY - pmouseY) * 0.01;
}


