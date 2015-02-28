
//Press "space-bar" to clear

boolean mouseIsDown = false;
ArrayList history = new ArrayList();
float z;
float H, S, B;
float A=255;
color cl=color(H, S, B,A);
boolean cmrMode=false;
float stkwt=11;
PVector vo,v,d;


void setup() {
    background(230);
  size(800,600, P3D);
  smooth();
//    float fov = PI/3.0; 
//      float cameraZ = (height/2.0) / tan(fov/2.0); 
//      perspective(fov, float(width)/float(height), cameraZ/2.0, cameraZ*2.0);
}


void draw() {
  background(255);
  colorMode(HSB);
strokeWeight(stkwt);
stroke(cl);

  if (cmrMode==true) {

    camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  }
  
 

  for (int p=0; p<history.size(); p++) {
     v = (PVector) history.get(p);
      if(p==0){ vo=v;}
    else if (p>0){
        vo = (PVector) history.get(p-1);
    }
//    line(vo.x,vo.y,vo.z,v.x,v.y,v.z);
point(v.x,v.y,v.z);
//    pushMatrix();
//    translate(v.x, v.y, v.z);
//    fill(0);
//    stroke(0);
//    sphere(10);
//    popMatrix();
  }
  
  
}



void mouseDragged() {

  d = new PVector(mouseX, mouseY, z);
  history.add( d);
}



void mouseClicked() {
  mouseIsDown = true;
   d = new PVector(mouseX, mouseY, z);
  history.add(d);
}

void mouseReleased() {
  mouseIsDown = false;
}




void keyPressed() {

  if (key == ' ') {
history=new ArrayList();
}

  if (keyCode==ALT) {
    cmrMode=true;
  }

  if (key=='w') {
    z=z-5;
  }
  
  if (key=='s') {
    z=z+5;
  }
  
}


void keyReleased() {
  cmrMode=false;
}



