
/**
 * Lamp.
 * by Jean Pierre Charalambos.
 * 
 * This class is part of the Luxo example.
 *
 * Any object that needs to be "pickable" (such as the Caja), should be
 * attached to its own InteractiveFrame. That's all there is to it.
 *
 * The built-in picking proscene mechanism actually works as follows. At
 * instantiation time all InteractiveFrame objects are added to a mouse
 * grabber pool. Scene parses this pool every frame to check if the mouse
 * grabs a InteractiveFrame by projecting its origin onto the screen.
 * If the mouse position is close enough to that projection (default
 * implementation defines a 10x10 pixel square centered at it), the object
 * will be picked. 
 *
 * Override InteractiveFrame.checkIfGrabsMouse if you need a more
 * sophisticated picking mechanism.
 *
 * Press 'h' to toggle the mouse and keyboard navigation help.
 */

import processing.core.*;
import remixlab.proscene.*;

public class Lamp {
  InteractiveFrame [] frameArray;
  
  Lamp() {
    frameArray = new InteractiveFrame[4];
    for (int i=0; i<4; ++i) {
      frameArray[i] = new InteractiveFrame(scene);
      // Creates a hierarchy of frames
      if (i>0) frame(i).setReferenceFrame(frame(i-1));
    }
    
    // Initialize frames
    frame(1).setTranslation(0, 0, 8); // Base height
    frame(2).setTranslation(0, 0, 50);  // Arm length
    frame(3).setTranslation(0, 0, 50);  // Arm length
    frame(1).setRotation(new Quaternion(new PVector(1.0f,0.0f,0.0f), 0.6f));
    frame(2).setRotation(new Quaternion(new PVector(1.0f,0.0f,0.0f), -2.0f));
    frame(3).setRotation(new Quaternion(new PVector(1.0f,-0.3f,0.0f), -1.7f));
    
    // Set frame constraints
    WorldConstraint baseConstraint = new WorldConstraint();
    baseConstraint.setTranslationConstraint(AxisPlaneConstraint.Type.PLANE, new PVector(0.0f,0.0f,1.0f));
    baseConstraint.setRotationConstraint(AxisPlaneConstraint.Type.AXIS, new PVector(0.0f,0.0f,1.0f));
    frame(0).setConstraint(baseConstraint);
    
    LocalConstraint XAxis = new LocalConstraint();
    XAxis.setTranslationConstraint(AxisPlaneConstraint.Type.FORBIDDEN,  new PVector(0.0f,0.0f,0.0f));
    XAxis.setRotationConstraint   (AxisPlaneConstraint.Type.AXIS, new PVector(1.0f,0.0f,0.0f));
    frame(1).setConstraint(XAxis);
    frame(2).setConstraint(XAxis);
    
    LocalConstraint headConstraint = new LocalConstraint();
    headConstraint.setTranslationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new PVector(0.0f,0.0f,0.0f));
    frame(3).setConstraint(headConstraint);
  }
  
  public void draw() {
    // Luxo's local frame
    pushMatrix();
    frame(0).applyTransformation(scene.parent);
    setColor( frame(0).grabsMouse() );
    drawBase();
    
    pushMatrix();//not really necessary here
    frame(1).applyTransformation(scene.parent);
    setColor( frame(1).grabsMouse() );
    drawCylinder();
    drawArm();
    
    pushMatrix();//not really necessary here
    frame(2).applyTransformation(scene.parent);
    setColor( frame(2).grabsMouse() );
    drawCylinder();
    drawArm();
    
    pushMatrix();//not really necessary here
    frame(3).applyTransformation(scene.parent);
    setColor( frame(3).grabsMouse() );
    drawHead();
    
    // Add light
    spotLight(155, 255, 255, 0, 0, 0, 0, 0, 1, THIRD_PI, 1);
    
    popMatrix();//frame(3)
    
    popMatrix();//frame(2)
    
    popMatrix();//frame(1)
    
    //totally necessary
    popMatrix();//frame(0)
  }
  
  public void drawBase() {
    drawCone(0, 3, 15, 15, 30);
    drawCone(3, 5, 15, 13, 30);
    drawCone(5, 7, 13, 1, 30);
    drawCone(7, 9, 1, 1, 10);
  }
  
  public void drawArm() {
    translate(2, 0, 0);
    drawCone(0, 50, 1, 1, 10);
    translate(-4, 0, 0);
    drawCone(0, 50, 1, 1, 10);
    translate(2, 0, 0);
  }
  
  public void drawHead() {
    drawCone(-2, 6, 4, 4, 30);
    drawCone(6, 15, 4, 17, 30);
    drawCone(15, 17, 17, 17, 30);
  }
  
  public void drawCylinder() {
    pushMatrix();
    rotate(HALF_PI, 0, 1, 0);
    drawCone(-5, 5, 2, 2, 20);
    popMatrix();
  }
  
  public void drawCone(float zMin, float zMax, float r1, float r2, int nbSub) {
    translate(0.0f, 0.0f, zMin);
    DrawingUtils.cone(scene.parent, nbSub, 0, 0, r1, r2, zMax-zMin);
    translate(0.0f, 0.0f, -zMin);
  }

  public void setColor(boolean selected) {
    if (selected)
      fill(200, 200, 0);
    else
      fill(200, 200, 200);
  }
  
  public InteractiveFrame frame(int i) {
    return frameArray[i];
  }
}

