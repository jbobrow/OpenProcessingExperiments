

//----------------------------------------------------------
// file:  PG_RetainedSphereViewer_V1.pde  
// info:  View 3d textured sphere from inside in retained mode.
//        This sketch is trying to use minimal code.
//        For more comfortable handling see PG_RetainedSphereViewer_V1.pde.
// note:  Retained mode is only available at processing >= v2.0.
//        For faster picture loading download 'sm_patio.jpg' from
//        http://www.ignorancia.org/uploads/panoramas/patio/sm_patio.jpg
//        and change loadImage(...) to load the panoramic file.   
// vers:  v1.0   2012-08-23    initial version
//----------------------------------------------------------
PImage texmap;
PShape retainedSphere;
float rotationX = 0;
float rotationY = 0;
float velocityX = 0;
float velocityY = 0;
float autoRotation = 260;
//----------------------------------------------------------
void setup()
{ size(800, 600, P3D);
  println(">>> RetainedSphereViewer v1.0 <<<");
  println ("loading panorama picture...");
  texmap = loadImage ("http://www.ignorancia.org/uploads/panoramas/patio/sm_patio.jpg");
//  texmap  = loadImage ("sm_patio.jpg");
  initTexturedSphere(72);    // change sphere detail level 
  retainedSphere = createTexturedSphere (900, texmap);
  //frameRate(333);   // for testing max. display frequence
}
//----------------------------------------------------------
void draw()
{ translate (width/2, height/2, 0);
  autoRotation += 0.02;        // autoRotate [°]
  rotateX (radians(constrain(-rotationX, -90.0, 90.0)));
  rotateY (radians(autoRotation - rotationY));

  shape(retainedSphere);       // draw textured sphere 
  
  rotationX += velocityX;
  rotationY += velocityY;
  velocityX *= 0.98;
  velocityY *= 0.98;
  if (mousePressed) 
  { velocityX += (mouseY - pmouseY) * 0.01;
    velocityY -= (mouseX - pmouseX) * 0.01;
  }
  if (frameCount % 120 == 0) println (round(frameRate) + " fps"); 
}


