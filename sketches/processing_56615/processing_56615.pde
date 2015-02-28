
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/56615*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

void setup() { 
  size(300, 300, P3D);
}
void draw() { 
  background(0);
  atom(mouseX, mouseY, round(width*.5), 7); // atom(positionX,positionY,atomScale,ringCount);
}
float pxobject, pyobject, yobject, xobject;
void atom(float xobjectin, float yobjectin, int atomScale, int ringCount) { 
  float easing = 0.1, dx_s = xobjectin - xobject, dy_s = yobjectin - yobject;
  if (abs(dx_s) > 1) { 
    xobject += dx_s * easing;
  } 
  if (abs(dy_s) > 1) { 
    yobject += dy_s * easing;
  } 
  float vxobject=abs(xobject - pxobject), vyobject=abs(yobject - pyobject);
  pxobject=xobject; 
  pyobject=yobject;
  pushMatrix(); 
  translate(xobject, yobject, 0); 
  scale( 1+abs(vxobject)*.03-abs(vyobject)*.03, 1+abs(vyobject)*.03-abs(vxobject)*.03); 
  rotateZ(frameCount*.001); 
  rotateX(frameCount*.005); 
  rotateY(frameCount*.005); 
  scale( 1.+((abs(vxobject)*.01)-(abs(vyobject)*.01)), 1.+((abs(vyobject)*.01)-(abs(vxobject)*.01)));
  for (float i=0;i<ringCount;i++) { 
    strokeWeight(3); 
    stroke(255, 255-45*i, 45*i, 255); 
    noFill(); 
    ellipse(0, 0, atomScale*1.4*i*.1, atomScale*1.4*i*.1);
    strokeWeight(0); 
    fill(45*i, 255, 255-45*i, 255); 
    translate(atomScale*.5*i*.1, atomScale*.5*i*.1); 
    sphereDetail(round((1+((abs(vxobject)*.01)-(abs(vyobject)*.01)))*atomScale*.1*i*.1)); 
    sphere( (1+((abs(vxobject)*.01)-(abs(vyobject)*.01)))*atomScale*.1*i*.1);
    scale( 1.-((abs(vxobject)*.02)+(abs(vyobject)*.01)), 1.-((abs(vyobject)*.02)+(abs(vxobject)*.01))); 
    translate(-atomScale*.5*i*.1, -atomScale*.5*i*.1); 
    rotateZ(-frameCount*.015*i); 
    rotateX(PI*.5); 
    rotateZ(frameCount*.015*i); 
    scale( -1.+((abs(vxobject)*.02)-(abs(vyobject)*.01)), -1.+((abs(vyobject)*.02)-(abs(vxobject)*.01)));
  } 
  popMatrix();
}



