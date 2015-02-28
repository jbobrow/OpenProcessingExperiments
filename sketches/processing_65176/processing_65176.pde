
//copyright Ben Van Citters 2012
 
//import processing.opengl.*;
 
PImage face;
float dims[];
float diag;
void setup()
{
  size(500, 500,P2D);
//  size(screen.width, screen.height,OPENGL);
  noCursor();
  println("loading face" + millis());
  face = loadImage("http://upload.wikimedia.org/wikipedia/commons/d/d9/David_Dewhurst_head_shot.jpg");
  println("done loading face" + millis());
  imageMode(CENTER);
  diag = dist(0,0,height,width);
  println(diag);
}
 
void draw()
{
  float faceDivisorX = 5.0f+20.0f*(sin(millis()/2000.0f)+1.0f)/2.0f;
  float faceDivisorY = 5.0f+26.3f*(sin(millis()/9111.0f)+1.0f)/2.0f;
  PGraphics tmpFace = createGraphics((int)(face.width/faceDivisorX),
                                     (int)(face.height/faceDivisorY),P2D);
  float tmpDivs[] = new float[]{face.width/faceDivisorX,face.height/faceDivisorY};
//  if(tmpDivs[1] < tmpDivs[0])
    dims = new float[]{diag,face.height*diag/face.width};
//  else
//    dims = new float[]{face.width*diag/face.height,diag};
  tmpFace.beginDraw();
  tmpFace.image(face,0,0,tmpFace.width,tmpFace.height);
  tmpFace.endDraw();
  float yPct = .001+mouseY*0.5f/height;
  pushMatrix();
  translate(width/2.0f,height/2.0f);
  rotate(millis()/(5000.0f*yPct));
  scale(1+4*(sin(millis()/(7111.0))+1)/2);
  image(tmpFace,0,0,dims[0],dims[1]);
  popMatrix();
  println("frameRate: " + frameRate);
}


