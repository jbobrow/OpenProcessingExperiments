
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;
//GL gl;
//PGraphicsOpenGL pgl;
//boolean click = false;
//import processing.opengl.*;
//import javax.media.opengl.*;
public String rmode = "P3D";
public float factor = 1.5;
public float shf=0f;
public float bam=0f;
public boolean viewpeasy = false;
void setup(){

  shf= .75;
 
size(255,255,P3D);

  frameRate(3000);
  lights();
  // hint (DISABLE_DEPTH_TEST);
  hint(DISABLE_OPENGL_2X_SMOOTH);
  hint(ENABLE_OPENGL_4X_SMOOTH);
//  if (rmode == "OPENGL"){
//    pgl = (PGraphicsOpenGL) g;
//    gl = pgl.gl;
//    gl.glHint (gl.GL_LINE_SMOOTH_HINT, gl.GL_NICEST);
//    gl.glEnable (gl.GL_LINE_SMOOTH); 
//  }
  if (rmode == "P3D"){
    smooth(); 
  }
  if(rmode=="P3D")strokeWeight(1.3);
  if(rmode=="OPENGL")strokeWeight(1.6);
  if(viewpeasy)cam = new PeasyCam (this,width);
}
public float depth = 255*factor;
void draw(){

  if(viewpeasy )  {

    cam = new PeasyCam (this,width);

    translate(-width/2,-height/2);
  }
  //if (!viewpeasy)cam = null;
  background(-1);
  boolean fs = false;
  if (fs==true){
    translate(width/2,height/2,-depth/2);
    stroke(1,41);
    noFill();
    // noSmooth();
    sphere(23);
    // smooth();
    translate(-width/2,-height/2,depth/2);

    stroke(1);
  }
  square();
  dl2(width/2,25,width/2,height-25);
  translate(0,0,-depth);
  dl3z(mouseX,mouseY,depth);
  square();
  dl2(width/2,25,width/2,height-25);

  dl3z(width/2,height-25,depth);
  dl3z(width/2,25,depth);

  dl3z(25,25,depth);
  dl3z(width-25,25,depth);
  dl3z(25,height-25,depth);
  dl3z(width-25,height-25,depth);
  dl3z(width/2,mouseY,depth);
  if (mousePressed)atsq(mouseX,mouseY,30,30);
  if(!mousePressed)atsq(mouseX,mouseY,33,33);
  _dl3(width/2,25,width/2,mouseY);
  dl3z(mouseX,mouseY,depth/2);
  translate(0,0,depth);
  if (mousePressed)atsq(mouseX,mouseY,30,30);
  if(!mousePressed)atsq(mouseX,mouseY,33,33);

  translate(width/2,height/2,-depth/2);
  // noStroke();
  noFill();
  stroke(1,41);
  // noSmooth();
  sphere(23);
  // smooth();
  translate(-width/2,-height/2,depth/2);
  noFill();
  stroke(1);

}

void square(){
  dl2(25,25,width-25,25);
  dl2(25,height-25,25,25);
  dl2(width-25,25,width-25,height-25);
  dl2(25,height-25,width-25,height-25); 

}

void dl(float x1,float y1,float x2,float y2){
  float angle = atan2(y2-y1,x2-x1);
  float currentX = x1;
  float currentY = y1;
  while(abs(currentX-x2) > abs(cos(angle))){

    pointx(currentX,currentY);
    currentX += cos(angle);
    currentY += sin(angle);
  }
}


//EDIT: this is more of the graph way of doing it - it is (as far as i can tell) faster but not as accurate


//Copy code
void dl3z(float x1,float y1,float deep){
  for (float z =0;z<deep;z+=1){
    // translate(x1,y1,z);
    pointz(x1,y1,z);
    //translate(x1,y1,-z); 
  }

}

void dl2z(float x1,float y1,float x2,float y2){
  float dx = x2-x1;
  float dy = y2-y1;
  if(dx == 0){
    for(float i = min(y1,y2);i<max(y1,y2);i+=1){
      translate(0,0,-i);
      pointx(x1,x1);//i
      translate(0,0,i); 
    }
    return;
  }
  float k = dy/dx;
  float m = y1 -x1*k;
  for(float i = min(x1,x2);i<max(x1,x2);i+=1/max(1,abs(k))){
    translate(0,0,-i);
    // pointx(i,k*i+m);
    pointx(i,k);
    translate(0,0,i);
  }
}


void dl2(float x1,float y1,float x2,float y2){
  float dx = x2-x1;
  float dy = y2-y1;
  if(dx == 0){
    for(float i = min(y1,y2);i<max(y1,y2);i+=1){
      point(x1,i); 
    }
    return;
  }
  float k = dy/dx;
  float m = y1 -x1*k;
  for(float i = min(x1,x2);i<max(x1,x2);i+=1/max(1,abs(k))){
    pointx(i,k*i+m); 
  }
}

void pointx(float x,float y){

  if(rmode=="P3D")  point(x,y); 
  if(rmode=="OPENGL") line(x,y,x+1,y);
}
void pointz(float x,float y,float z){

  if(rmode=="P3D")point(x,y,z); 
  if(rmode=="OPENGL")line(x,y,z,x,y,z+1);
}

void atsq(float x,float y, float w,float h){
  float c1 = x-w/2;
  float c2= y-h/2;
  dl2(c1,c2,c1+w,c2);
  dl2(c1,c2,c1,c2+h);
  dl2(c1+w,c2,c1+w,c2+h);
  dl2(c1,c2+h,c1+w,c2+h);

}

void _dl2(float x1,float y1,float x2,float y2){
  float dx = x2-x1;
  float dy = y2-y1;
  if(dx == 0){
    for(float i = min(y1,y2);i<max(y1,y2);i+=1){
      pointz(x1,i,i*factor); 
    }
    return;
  }
  float k = dy/dx;
  float m = y1 -x1*k;
  for(float i = min(x1,x2);i<max(x1,x2);i+=1/max(1,abs(k))){
    pointz(i,k*i+m,(k*i+m)*factor); 
  }
}

void _dl3(float x1,float y1,float x2,float y2){
  bam = 0;
  float dx = x2-x1;
  float dy = y2-y1;
  if(dx == 0){
    for(float i = min(y1,y2);i<max(y1,y2);i+=1){
      bam +=shf;
      pointz(x1,i,i+bam); 
    }
    return;
  }
  bam=0;

  float k = dy/dx;
  float m = y1 -x1*k;
  for(float i = min(x1,x2);i<max(x1,x2);i+=1/max(1,abs(k))){
    bam +=shf;
    pointz(i,k*i+m,(k*i+m)+bam); 
  }
}

void keyPressed(){
  if (key=='v'){
    viewpeasy= !viewpeasy; 
    //setup();
  }
}




