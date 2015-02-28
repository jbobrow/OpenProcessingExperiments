
/**  superCad Language taken from
  *  Example by Guillaume LaBelle
  *     for superCAD exporter
  */
  
//\/\/\superCadStuff/\/\/\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\
import superCAD.*;//imports the library
String cadSoftware, ext; //is a variable to choose object file type
boolean record = false; //turns BeginRaw on and off
//\/\/\/\/\/\/\/\/\/\/\/\/\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\

//rotation variables
float thetaX = 0;
float thetaY = 3;

//mouse control variables
float xmag, ymag = 0;
float newXmag, newYmag = 0; 

void setup(){
  size(500,500,P3D);
}

void draw(){
  background(0, 100,100);
  //\/\/\superCadStuff/\/\/\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\  
  //You call the renderer like:
  //    superCAD.AutoLISP --> .lsp
  //    superCAD.PovRAY   --> .pov
  //    superCAD.Rhino    --> .rvb
  //    superCAD.SketchUP --> .rb
  //    superCAD.Maya     --> .mel
  //    superCAD.ObjFile  --> .obj
  //    superCAD.ArchiCAD --> .gdl
  if(record)
    beginRaw("superCAD."+cadSoftware, "output."+ext);  
  //\/\/\/\/\/\/\/\/\/\/\/\/\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\

  lights();
  
  
  //mouse location variables
  float sc = dist(pmouseX, pmouseY, mouseX, mouseY);
  translate (mouseX,mouseY);
  scale (20);
  
  //mouserotation
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
  
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { xmag -= diff/4.0; }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { ymag -= diff/4.0; }
  
  rotateX(-ymag); 
  rotateY(-xmag); 
  
  
  //rotateX(thetaX);
 // rotateY(thetaY);
  //thetaX = thetaX+.03;
  //thetaY = thetaY-.03;
  
  beginShape(QUADS);
  noStroke();
  
  fill(255,100,100);
  vertex(-1,  1,  1);
  vertex( 1,  1,  1);
  vertex( 1, -1,  1);
  vertex(-1, -1,  1);
  
  fill(100, 255,100);
  vertex( 1,  1,  1);
  vertex( 1,  1, -1);
  vertex( 1, -1, -1);
  vertex( 1, -1,  1);

  fill (100, 100, 250);
  vertex( 1,  1, -1);
  vertex(-1,  1, -1);
  vertex(-1, -1, -1);
  vertex( 1, -1, -1);

  fill (255, 100, 255);
  vertex(-1,  1, -1);
  vertex(-1,  1,  1);
  vertex(-1, -1,  1);
  vertex(-1, -1, -1);

  fill (255, 255, 100);
  vertex(-1,  1, -1);
  vertex( 1,  1, -1);
  vertex( 1,  1,  1);
  vertex(-1,  1,  1);

  fill (100, 250, 250);
  vertex(-1, -1, -1);
  vertex( 1, -1, -1);
  vertex( 1, -1,  1);
  vertex(-1, -1,  1);
  endShape();
  
  //\/\/\superCadStuff/\/\/\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\
  if (record) {
  endRaw();
  record = false;
  }
  //\/\/\/\/\/\/\/\/\/\/\/\/\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\
}

//\/\/\superCadStuff/\/\/\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\
void keyPressed() {

  switch(key){
  case 'r': 
    cadSoftware = "Rhino"; 
    ext = "rvb"; 
    break;
  case 's': 
    cadSoftware = "SketchUP"; 
    ext = "rb";
    break;
  case 'a': 
    cadSoftware = "AutoLISP"; 
    ext = "lsp";
    break;
  case 'p': 
    cadSoftware = "PovRAY"; 
    ext = "pov";
    break;
  case 'm': 
    cadSoftware = "Maya"; 
    ext = "mel";
    break; 
  case 'o': 
    cadSoftware = "ObjFile"; 
    ext = "obj";
    break;       
  case 'c': 
    cadSoftware = "ArchiCAD"; 
    ext = "gdl";
    break;       
  }
  record = true;
}
//\/\/\/\/\/\/\/\/\/\/\/\/\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\

