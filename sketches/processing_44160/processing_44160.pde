
import saito.objloader.*;

float rotX=0;
float rotY=0;
float normalTranslation=0;
float zTranslation=0;
OBJModel myModel;
boolean conFill=false;
boolean conStroke=false;
void setup(){
  size(800,600,P3D);
  myModel=new OBJModel(this,"cabeza.obj","relative");
  myModel.scale(100);
}
void mouseDragged(){
  rotX+=(pmouseX-mouseX)*0.01;
  rotY-=(pmouseY-mouseY)*0.01;
}
void keyPressed(){

  if(keyCode==LEFT)
    normalTranslation++;
  if(keyCode==RIGHT)
    normalTranslation--;
  if(keyCode==UP)
    zTranslation+=5;
  if(keyCode==DOWN)
    zTranslation-=5;
  if(key=='s' || key=='S'){
    save("imagen.png");
  } 
  if(key=='f' || key=='F'){
    if(!conFill)
      conFill=true;
    else
      conFill=false;
    conStroke=false; 
  }
  if(key=='z' || key=='Z'){
    if(!conStroke)
      conStroke=true;
    else
      conStroke=false;
    conFill=false;
  }

}
void draw(){
  background(255);
  lights();
  translate(width/2,height/2,zTranslation);
  rotateX(rotY);
  rotateY(rotX);
  if(conFill){

    //noStroke();
  }
  //box(width/3);
  pushMatrix();
  translate(0,50,width/12);
  for(int i=0;i<myModel.getSegmentCount();i++){
    Segment s=myModel.getSegment(i);
    Face[] f=s.getFaces();
    for(int j=0;j<f.length;j++){ 
      PVector[] vertices=f[j].getVertices();
      PVector[] normals=f[j].getNormals();
      PVector c=centroid(vertices);
      PVector n=faceNormal(normals);
      pushMatrix();
      translate(c.x,c.y,c.z);
      stroke(0);
      if(conStroke){
      if(j>f.length/4 && j<f.length/1.5)
        fill(0,255,0,150);
      else
        fill(150,150);
      }else
        fill(150,150);
      beginShape();
      for(int k=0;k<vertices.length;k++){
        PVector v;
        v=PVector.add(PVector.sub(vertices[k],c),PVector.mult(n,normalTranslation)); 
        vertex(v.x,v.y,v.z);
      }
      endShape(CLOSE);

      popMatrix();
    } 
  }
  popMatrix();
  //myModel.draw();
}
PVector faceNormal(PVector[] faceNormals){
  PVector n=new PVector(0,0,0);
  for(int i=0;i<faceNormals.length;i++){
    n=PVector.add(n,faceNormals[i]);
  }
  n.div(1.0/ (float) faceNormals.length);
  return n;
}
PVector centroid(PVector[] faceVertices){
  PVector c=new PVector(0,0,0);
  for(int i=0;i<faceVertices.length;i++){
    c=PVector.add(c,faceVertices[i]);
  }
  c.div(1.0/(float) faceVertices.length);
  return c;
}




