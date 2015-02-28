
import nervoussystem.obj.*;
float objHeight = 0; //Z value of current rectangular prism
int type = 0; //0 is rectangular prism, 1 is sphere
float lastHeight = 0; //Z value of last object
float lwidth = 50; 
float llength = 50;
float shift = 3; //Z shift for overlap 
float cirR = 0; //spherical radius of current object
int instance = 0; //number of objects created, number of current instance
int lastType = 0; //type of last object


void setup() {
  size(400, 400, P3D);
  translate(200, 200, 0);
  reload();
}

void reload() {
  instance++;
  scale(.5);
  int numObjs = int(random(3, 20));
  lwidth = 50;
  llength = 50;
  lastHeight = 0;
  type = 0;
  lastType = 0;
  beginRecord("nervoussystem.obj.OBJExport", "filename" + instance +".obj"); 
  for (int i = 0; i< numObjs; i++) {
    if (type == 1) { //sphere
      if (lastType == 1) { 
        cirR =  random(cirR -2, cirR +2);
      } else {
        cirR =  random((lwidth+llength)/2 -2, (lwidth+llength)/2 +2);
      }
      translate(0, 0, ((lastHeight/2)+cirR-shift));
      drawCircleShape(cirR);
      lastHeight = 2*cirR;
    } 
    else { //rectangular prisms
      objHeight = (int)random(3, 20);
      if (lastType == 1) {
        lwidth = random((lastHeight/2), lastHeight - lastHeight/3);
        llength = random(lastHeight/2, lastHeight - lastHeight/3);
      } else {
        lwidth = random((lwidth/2), (objHeight+lwidth)/2 +1);
        llength = random(llength/2, (objHeight+llength)/2 +1);
      }
      translate(0, 0, ((lastHeight+objHeight)/2) - shift);
      drawRectShape(lwidth, llength, objHeight, random(-200, 200)/100);
      lastHeight = objHeight;
    }
    shift = random(lastHeight/10,lastHeight/3);
    lastType = type;
    type = int(random(0, 2)); //this function floors
    println(type); 
  }

  endRecord();
  println("recorded object file");
}


void draw() {
  translate(200,200,0); //center of the screen
  if (mousePressed) {
    background(200);
    reload();
  }
}


void drawCircleShape(float rad1) {
  pushMatrix();
  rotateX(PI/2); //to rotate so hole in center of sphere facing down.
  sphere(rad1);
  popMatrix();
} 

/*void drawRectShape( float dim1, float dim2, float dim3, float rot1, float rot2, float rot3) {
  pushMatrix();
  rotateZ(rot1);
  rotateX(rot2);
  rotateY(rot3);
  box(dim1, dim2, dim3);
  popMatrix();
}*/ //extraneous: boxes are created with flipped faces, not suitable for 3d printing.

void drawRectShape( float dim1, float dim2, float dim3, float rot1) {
  pushMatrix();
  rotateZ(rot1);
  newBox(dim1, dim2, dim3);
  popMatrix();
}

void newBox(float w, float l, float h){ //redefines the box function for new face orientation.
  w = w/2;
  l = l/2;
  h = h/2;
  beginShape(QUADS);
  vertex(w, l, -h);
  vertex(w, -l, -h);
  vertex(-w, -l, -h);
  vertex(-w, l, -h);
  
  vertex(w, l, h);
  vertex(-w, l, h);
  vertex(-w, -l, h);
  vertex(w, -l, h);
  
  vertex(w, l, -h);
  vertex(w, l, h);
  vertex(w, -l, h);
  vertex(w, -l, -h);
  
  vertex(-w, -l, -h);
  vertex(w, -l, -h);
  vertex(w, -l, h);
  vertex(-w, -l, h);
  
  vertex(-w, l, -h);
  vertex(-w, -l, -h);
  vertex(-w, -l, h);
  vertex(-w, l, h);
  
  vertex(-w, l, -h);
  vertex(-w, l, h);
  vertex(w, l, h);
  vertex(w, l, -h);
  
  endShape(CLOSE);
}
