
//import processing.opengl.*;

PFont font;
float rotx = 5*PI/4-0.16,  roty = PI/4,  rotz = PI/2;  // el 0.16 corregeix la perspectiva
float incX=0.01, incY=0.01, incZ=0.01;
float zoomZ = 150;                                    /// en Open GL ha d'esser 400
int nCubs = 15, tamanyCub = 12, distCubs = 20, incColor =16;


///public void init() { 
///  frame.removeNotify();        // Full Screen
///  frame.setUndecorated(true);
///  super.init();                // call PApplet.init() to take care of business  super.init();}
///}
  

void setup(){
  size(800,450, P3D);
  ///size(1440,900, P3D);
  ///frame.setResizable(false);
  smooth();
  frameRate(30);
  font = loadFont("CourierNew36.vlw"); 
  textFont(font,12); 
  textAlign(CENTER);
  fill(255);
  ortho(-width/2, width/2, -height/2, height/2, zoomZ, -zoomZ);
}


void draw(){
  background(0);
  fill(255);
//  text("RGB", 440, 150, 400);
//  text("HSB", 950, 150, 400);
  text("RGB", width/4, 20, 0);
  text("HSB", 3*width/4, 20, 0);
  text("Press '+' and '-' to see inside", width/2, height-48,0);    // en P3D no Funciona
  text("Drag Mouse With Right Button - Rotate X / Y", width/2, height-36,0);
  text("Drag Mouse With Left Button  - Rotate Z", width/2, height-24,0);
  text("Single Click Stops Rotation", width/2, height-12,0);
  stroke(0);
  
  colorMode(RGB);
  cub(-1);  
  colorMode(HSB);
  cub(1);
  if (mousePressed){incX=0;incY=0;incZ=0;}
  rotx += incX;  roty += incY;  rotz += incZ; 
}


void cub(int lPos){
  pushMatrix();
 
  translate(width/2.0 + (width/4.0 * lPos), height/2.0, zoomZ);
  scale((float)width/1000.0); 
  rotateX(rotx);  rotateY(roty);  rotateZ(rotz); 
  translate(-nCubs*distCubs/2,-nCubs*distCubs/2,-nCubs*distCubs/2);        // Trasllada el centre de rotació
 
  int n = 0, desp = 0;
  for(int k=0; k<nCubs; k++){
    for(int j=0; j<nCubs; j++){
      for(int i=0; i<nCubs; i++){
        fill(i*incColor ,j*incColor ,k*incColor);
        box(tamanyCub);
        n++;
        desp = distCubs * (((n%2)*2)-1)/4;
        translate(desp, desp, desp);
        translate(distCubs, 0, 0);
      }
      translate(-nCubs*distCubs,0,0);
      translate(0,distCubs,0);
    }
      translate(0,-nCubs*distCubs,0);
      translate(0,0,distCubs);
  }
  popMatrix();
}


void mouseDragged() {
  float rate = 0.01;

  if(mouseButton == LEFT){
    incX = (mouseY-pmouseY) * rate;
    incY = (mouseX-pmouseX) * rate;
    rotx += incX;
    roty += incY;
  }
  if(mouseButton == RIGHT){
    incZ = ((pmouseY-mouseY) - (mouseX-pmouseX)) * rate / 2;
    rotz+=incZ;
  }
}


void keyPressed(){
   if (key == '+')      {nCubs--; }//zoomZ += 10;}
   else if (key == '-') {nCubs++; }//zoomZ -= 10;}
   zoomZ = min(zoomZ,400);
   zoomZ = max(zoomZ,-110);
}


