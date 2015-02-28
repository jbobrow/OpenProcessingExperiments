
class Brain extends ClickableElement
{

  //OBJModel model;

  PImage floatingImage, floatingImageBack;

  float brainHeight = 180.0; // height of brain to scale image

  public Brain(float x, float y, float z, color c, PApplet p)
  {
    super(x,y,z,"brain",c);
    //println("start brain constructor");
    //model = new OBJModel(p, "flatbrain.obj");
    floatingImage = loadImage("brain_front.png");
    floatingImageBack = loadImage("brains.png");

    elementWidth = (brainHeight/floatingImage.height) * floatingImage.width;
    elementHeight = brainHeight;
    elementDepth = 10.0;
    maxDistance = 25.0;
    
    maxZRot = PI/50.0;

    //rotX = -HALF_PI;
    //println("brain height:" + elementHeight + " width:" + elementWidth);
    //println("end brain constructor");
  }

  void update()
  {
    super.update();
    speed -= speedConsumption;
    speed = max(0, speed); // keep speed above zero
  }

  void draw()
  {   
    pushMatrix();
    //noSmooth();
    // angle += random(-0.01,0.01);
    noStroke();
    //ambientLight((selectionColor >>16) &0xFF,(selectionColor >>8) &0xFF, selectionColor &0xFF);
    translate(positionX, positionY, positionZ);//-(elementDepth/2.0));
    rotateX(rotX);
    rotateY(rotY);
    rotateZ(rotZ);
    //scale(90.0);
    //model.drawMode(TRIANGLES);
    //model.draw();
    //rotateX(HALF_PI);
    noFill();
    smooth();
    float tz = (elementDepth/2.0);
    
    beginShape(QUADS);
    texture(floatingImageBack);
    vertex( -elementWidth/2.0, -elementHeight/2.0, tz, 0, 0);
    vertex(elementWidth/2.0, -elementHeight/2.0, tz, floatingImage.width, 0);
    vertex(elementWidth/2.0, elementHeight/2.0, tz, floatingImage.width, floatingImage.height);
    vertex(-elementWidth/2.0, elementHeight/2.0, tz, 0, floatingImage.height);
    endShape();
    
    beginShape(QUADS);
    texture(floatingImage);

    vertex( -elementWidth/2.0, -elementHeight/2.0, tz, 0, 0);
    vertex(elementWidth/2.0, -elementHeight/2.0, tz, floatingImage.width, 0);
    vertex(elementWidth/2.0, elementHeight/2.0, tz, floatingImage.width, floatingImage.height);
    vertex(-elementWidth/2.0, elementHeight/2.0, tz, 0, floatingImage.height);
    endShape();
    noSmooth();
    
    popMatrix();
    if (selected)
    {
      super.drawSelection();
    }
    super.draw();
  }

  //  void doDragEvent()
  //  {
  //    
  //  }

  // this causes some major perfomance issues
  //  void drawOffScreen(PGraphics p)
  //  {
  //    p.pushMatrix();
  //    //noSmooth();
  //    // angle += random(-0.01,0.01);
  //    p.noStroke();
  //    //p.directionalLight(255,255,255,10,10,-10);
  //    p.translate(positionX, positionY, positionZ);//-(elementDepth/2.0));
  //    p.rotateX(rotX);
  //    p.rotateY(rotY);
  //    p.rotateZ(rotZ);
  //    //scale(90.0);
  //    p.model.drawMode(TRIANGLES);
  //    p.model.draw();
  //    //rotateX(HALF_PI);
  //    p.beginShape(QUADS);
  //    p.texture(floatingImage);
  //    float tz = (elementDepth/2.0);
  //    p.vertex( -elementWidth/2.0, -elementHeight/2.0, tz, 0, 0);
  //    p.vertex(elementWidth/2.0, -elementHeight/2.0, tz, floatingImage.width, 0);
  //    p.vertex(elementWidth/2.0, elementHeight/2.0, tz, floatingImage.width, floatingImage.height);
  //    p.vertex(-elementWidth/2.0, elementHeight/2.0, tz, 0, floatingImage.height);
  //    p.endShape();
  //
  //    p.popMatrix();
  //  }
}




