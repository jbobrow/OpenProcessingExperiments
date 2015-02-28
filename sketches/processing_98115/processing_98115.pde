
ArrayList<PImage> ImageArrayList_ball = new ArrayList<PImage>();
PImage pImage;
PGraphics pGraphics;
float ax, ay;
/**
 * The initSphere method is to initialize the
 * points of a sphere to the nodeArrayList arraylist
 * as VertexNode objects.
 */
ArrayList<VertexNode> nodeArrayList = new ArrayList<VertexNode>();

void setup() {
  size(500, 500, P3D);
  ax = 0;
  ay = 0;
  pGraphics = createGraphics(200, 100);
  pGraphics.beginDraw();
  //pGraphics.fill(0);
  //pGraphics.rect(0,0,200,100);
  pGraphics.background(#FAEE05);
  pGraphics.textAlign(CENTER);
  //pGraphics.rect(0,(pGraphics.height/3.0),200,(pGraphics.height*2.0/3.0));
  pGraphics.fill(255);
  pGraphics.ellipse(pGraphics.height / 5.0, pGraphics.height / 2.0, pGraphics.height / 5.0, pGraphics.height / 5.0);
  pGraphics.textSize(pGraphics.height / 7.0);
  pGraphics.fill(0);
  pGraphics.text("1", pGraphics.height / 5.0, pGraphics.height / 2.0 + (pGraphics.height / 5.0 / 4.0));
  pGraphics.endDraw();
  ImageArrayList_ball.add(pGraphics.get());
  pGraphics.beginDraw();
  pGraphics.background(#001BFF);

  //pGraphics.rect(0,(pGraphics.height/3.0),200,(pGraphics.height*2.0/3.0));
  pGraphics.fill(255);
  pGraphics.ellipse(pGraphics.height / 5.0, pGraphics.height / 2.0, pGraphics.height / 5.0, pGraphics.height / 5.0);

  pGraphics.fill(0);
  pGraphics.text("2", pGraphics.height / 5.0, pGraphics.height / 2.0 + (pGraphics.height / 5.0 / 4.0));
  pGraphics.endDraw();
  ImageArrayList_ball.add(pGraphics.get());
  pGraphics.beginDraw();
  pGraphics.background(#CF00FF);

  //pGraphics.rect(0,(pGraphics.height/3.0),200,(pGraphics.height*2.0/3.0));
  pGraphics.fill(255);
  pGraphics.ellipse(pGraphics.height / 5.0, pGraphics.height / 2.0, pGraphics.height / 5.0, pGraphics.height / 5.0);

  pGraphics.fill(0);
  pGraphics.text("3", pGraphics.height / 5.0, pGraphics.height / 2.0 + (pGraphics.height / 5.0 / 4.0));
  pGraphics.endDraw();
  ImageArrayList_ball.add(pGraphics.get());
  pGraphics.beginDraw();
  pGraphics.background(0);

  //pGraphics.rect(0,(pGraphics.height/3.0),200,(pGraphics.height*2.0/3.0));
  pGraphics.fill(255);
  pGraphics.ellipse(pGraphics.height / 5.0, pGraphics.height / 2.0, pGraphics.height / 5.0, pGraphics.height / 5.0);
  pGraphics.fill(0);
  pGraphics.text("8", pGraphics.height / 5.0, pGraphics.height / 2.0 + (pGraphics.height / 5.0 / 4.0));
  pGraphics.endDraw();

  specular(255, 255, 255);
  shininess(25.0);
  noStroke();
}

void draw() {

  background(255);
  pushMatrix();
  //image(pGraphics.get(),250,250);
  translate(250, 250);

  //(pmouseX-mouseX)
  ax += (pmouseX - mouseX) /float(width) * 2.0 * PI;
  ay += (pmouseY - mouseY) /float(height) * 2.0 * PI;
  rotateX(ay * 2);
  rotateY(ax * 2);
  //rotateX((pmouseX-mouseX)/float(width)*2.0*PI);
  //rotateZ((pmouseY-mouseY)/float(height)*2.0*PI);
  //
  mysphere(50, ImageArrayList_ball.get(0));
  popMatrix();
  pushMatrix();
  translate(100, 100);
  rotateX(ay * 2);
  rotateY(ax * 2);
  mysphere(50, ImageArrayList_ball.get(1));
  popMatrix();
  pushMatrix();

  translate(400, 400);

  rotateX(ay * 2);
  rotateY(ax * 2);

  mysphere(50, ImageArrayList_ball.get(2));
  popMatrix();

  /*  for (int i = 0; i<8;i++)
   {
   rotateY(1.0/8.0*PI*2.0);
   //rotateY(i/4.0*PI);
   for (int j = 0; j <8;j++)
   {
   rotateX(1.0/8.0*PI*2.0);
   ellipse(0,0,500,500);
   }
   
   }*/
  perspective();
}

void mysphere(float mag, PImage tex) {


  if (nodeArrayList.size() < 1)//checks if the sphere points are initialized
  {
    initSphere(mag, tex);
  }

  beginShape(TRIANGLE_STRIP);
  texture(tex);
  for (int i = 0; i < nodeArrayList.size() - 1; i++) {
    vertex(nodeArrayList.get(i).x, nodeArrayList.get(i).y, nodeArrayList.get(i).z, nodeArrayList.get(i).u, nodeArrayList.get(i).v);
  }
  endShape();
}

void initSphere(float mag, PImage tex) {
  nodeArrayList = new ArrayList<VertexNode>();
  boolean flip = false;
  float hd = 3;
  float vd = 5;
  float x1, x2, x3, x4, y1, y2, y3, y4, z1, z2, z3, z4, offset, inverseoff;
  //noStroke();
  for (int i = 0; i < (vd); i++) { //fill(vd/i*255,255-(vd/i*255),0);
    for (int j = 0; j < hd ; j++) {
      offset = cos(j%2/(vd /2.0)*PI)* (mag * sin(j / hd * PI))/2.0;

      x1 = cos((i+(j%2)/2.0) / (vd / 2.0) * PI ) * (mag * sin(j / hd * PI));
      x2 = cos((i+((j+1)%2)/2.0) /(vd / 2.0) * PI * 1.0) * (mag * sin((j + 1) / hd * PI));
      x3 = cos(((i-1+((j+1)%2)/2.0) ) / (vd / 2.0) * PI ) * (mag * sin((j + 1) / hd * PI));
      x4 = cos(((i-1+(j%2)/2.0)) / (vd / 2.0) * PI ) * (mag * sin(j / hd * PI));
      y1 = cos(j / hd * PI) * mag;
      y2 = cos((j + 1) / hd * PI) * mag;
      y3 = cos((j + 1) / hd * PI) * mag;
      y4 = cos(j / hd * PI) * mag;
      z1 = sin((i+(j%2)/2.0) / (vd / 2.0) * PI ) * (mag * sin(j / hd * PI));
      z2 = sin((i+((j+1)%2)/2.0) / (vd / 2.0) * PI ) * (mag * sin((j + 1) / hd * PI));
      z3 = sin(((i-1+((j+1)%2)/2.0)) / (vd / 2.0) * PI ) * (mag * sin((j + 1) / hd * PI));
      z4 = sin(((i-1+(j%2)/2.0)) / (vd / 2.0) * PI ) * (mag * sin(j / hd * PI));

      nodeArrayList.add(new VertexNode(x1, y1, z1, ((i+(j%2)/2.0) / (vd / 2.0) * tex.height), (j / (hd * 2.0) * tex.width)));
      nodeArrayList.add(new VertexNode(x4, y4, z4, (((i-1+(j%2)/2.0)) / (vd / 2.0) * tex.height), (j / (hd * 2.0) * tex.width)));
      nodeArrayList.add(new VertexNode(x2, y2, z2, ((i+((j+1)%2)/2.0) / (vd / 2.0) * tex.height), ((j + 1) / (hd * 2.0) * tex.width)));

      nodeArrayList.add(new VertexNode(x2, y2, z2, ((i+((j+1)%2)/2.0) / (vd / 2.0) * tex.height), ((j + 1) / (hd * 2.0) * tex.width)));
      nodeArrayList.add(new VertexNode(x4, y4, z4, (((i-1+(j%2)/2.0)) / (vd / 2.0) * tex.height), (j / (hd * 2.0) * tex.width)));
      nodeArrayList.add(new VertexNode(x3, y3, z3, (((i-1+((j+1)%2)/2.0)) / (vd / 2.0) * tex.height), ((j + 1) / (hd * 2.0) * tex.width)));

      //nodeArrayList.add(new VertexNode(x3, y3, z3, (((i+1-((j+1)%2)/2.0)) / (vd / 2.0) * tex.height), ((j + 1) / (hd * 2.0) * tex.width)));
      //nodeArrayList.add(new VertexNode(x4, y4, z4, (((i+1-(j%2)/2.0)) / (vd / 2.0) * tex.height), (j / (hd * 2.0) * tex.width)));
      //
    }
  }
  for (int k = 0; k<2;k++)
  {
    initSphereTessellater(mag);
  }
}

void initSphereTessellater(float mag)
{
  VertexNode p1, p2, p3, np12, np23, np31;
  ArrayList<VertexNode> tempnodeArrayList = new ArrayList<VertexNode>();
  for (int i = 0 ;i<nodeArrayList.size()-1;i+=3)
  {
    p1  = nodeArrayList.get(i);
    p2 = nodeArrayList.get(i+1);
    p3 = nodeArrayList.get(i+2);
    np12 = new VertexNode((p1.x+p2.x)/2.0, (p1.y+p2.y)/2.0, (p1.z+p2.z)/2.0, (p1.u+p2.u)/2.0, (p1.v+p2.v)/2.0);
    np23 = new VertexNode((p2.x+p3.x)/2.0, (p3.y+p2.y)/2.0, (p3.z+p2.z)/2.0, (p3.u+p2.u)/2.0, (p3.v+p2.v)/2.0);
    np31 = new VertexNode((p1.x+p3.x)/2.0, (p1.y+p3.y)/2.0, (p1.z+p3.z)/2.0, (p1.u+p3.u)/2.0, (p1.v+p3.v)/2.0);
    np12.normalize();
    np23.normalize();
    np31.normalize();
    np12.mult(mag);
    np23.mult(mag);
    np31.mult(mag);
    tempnodeArrayList.add(p1);
    tempnodeArrayList.add(np12);
    tempnodeArrayList.add(np31);

    tempnodeArrayList.add(p2);
    tempnodeArrayList.add(np12);
    tempnodeArrayList.add(np23);

    tempnodeArrayList.add(p3);
    tempnodeArrayList.add(np23);
    tempnodeArrayList.add(np31);

    tempnodeArrayList.add(np23);
    tempnodeArrayList.add(np31);
    tempnodeArrayList.add(np12);
  }
  nodeArrayList.clear();
  nodeArrayList.addAll(tempnodeArrayList.toArray());
}
/**
 * The VertexNode class is used for storing the
 * vertices and texture points to an array.
 */
class VertexNode {
  float x, y, z, u, v;

  VertexNode(float x, float y, float z, float u, float v) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.u = u;
    this.v = v;
  }
  void normalize()
  {
    float a;
    a = abs(sqrt(sq(x)+sq(y)+sq(z))); 
    x/=a;
    y/=a;
    z/=a;
  }
  void mult(float a)
  {
    x*=a;
    y*=a;
    z*=a;
  }
}
