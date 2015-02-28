
//Original code by  luis2048 of forums.processing.org
//Re-processed by Owaun Scantlebury


import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;
float rot_x = 0;
float rot_y = 0;
public int frate = 45;
public int maxfrate = 255;
public int minfrate = 5;
public boolean viewtrails = false;
void setup(){
  size(255,255,P3D);
  loadPixels();
  stroke(255);
  frameRate(frate);
  // cam = new PeasyCam (this,width);
  strokeWeight(2);
//  smooth();
  background(0);
}

void draw(){
  //
  frameRate(frate);
if (!viewtrails) background(0);
if (viewtrails){
 fill(0,height-frate);
 rect(0,0,width,height);
}
  for (int x=0;x<frate;x++){
    set(5,height-x,-1);
  }

  draw_3D_line(-15,-15,-15, 15,-15,-15);
  draw_3D_line( 15,-15,-15, 15, 15,-15);
  draw_3D_line( 15, 15,-15,-15, 15,-15);
  draw_3D_line(-15, 15,-15,-15,-15,-15);

  draw_3D_line(-15,-15, 15, 15,-15, 15);
  draw_3D_line( 15,-15, 15, 15, 15, 15);
  draw_3D_line( 15, 15, 15,-15, 15, 15);
  draw_3D_line(-15, 15, 15,-15,-15, 15);

  draw_3D_line(-15,-15, 15,-15,-15,-15);
  draw_3D_line( 15,-15, 15, 15,-15,-15);
  draw_3D_line( 15, 15, 15, 15, 15,-15);
  draw_3D_line(-15, 15, 15,-15, 15,-15);
  rot_x+=.04;
  rot_y+=.02;
  // updatePixels();
}


void draw_3D_line(int x1, int y1, int z1, int x2, int y2, int z2) {
  float x_p[] = {
    x1, x2  };
  float y_p[] = {
    y1, y2  };
  float z_p[] = {
    z1, z2  };
  int scrX[]={
    0,0  };
  int scrY[]={
    0,0  };

  for (int i=0; i<2; ++i) {
    float rotX1 = -x_p[i] * sin(rot_x) + y_p[i] * cos(rot_x);
    float rotY1 = -x_p[i] * cos(rot_x) * sin(rot_y) - y_p[i] * sin(rot_x) * sin(rot_y) - z_p[i] * cos(rot_y);
    float rotZ1 = -x_p[i] * cos(rot_x) * cos(rot_y) - y_p[i] * sin(rot_x) * cos(rot_y) + z_p[i] * sin(rot_y);
    scrX[i] = (int)(800 * (rotX1 / (rotZ1 + 256)) + 150);
    scrY[i] = (int)(800 * (rotY1 / (rotZ1 + 256)) + 100);
  }

  //draw_line(scrX[0],scrY[0],scrX[1],scrY[1]);
  //line(scrX[0],scrY[0],scrX[1],scrY[1]); 
  dl2(scrX[0],scrY[0],scrX[1],scrY[1]); 
}


void draw_line(int x1, int y1, int x2, int y2) {
  int deltax = abs(x2 - x1);
  int deltay = abs(y2 - y1);
  int x = x1;
  int y = y1;
  int xinc1;
  int xinc2;
  int yinc1;
  int yinc2;
  int den;
  int num;
  int numadd;
  int numpixels;

  if (x2>=x1) {
    xinc1 = 1; 
    xinc2 = 1;
  } 
  else {
    xinc1 = -1; 
    xinc2 = -1;
  }

  if (y2>=y1) {
    yinc1 = 1; 
    yinc2 = 1;
  } 
  else {
    yinc1 = -1; 
    yinc2 = -1;
  }

  if (deltax>=deltay) {
    xinc1 = 0;
    yinc2 = 0;
    den = deltax;
    num = deltax / 2;
    numadd = deltay;
    numpixels = deltax;
  } 
  else {
    xinc2 = 0;
    yinc1 = 0;
    den = deltay;
    num = deltay / 2;
    numadd = deltax;
    numpixels = deltay;
  }

  for (int curpixel=0; curpixel<=numpixels; curpixel++) {
    // point(x,y);
    pixpoint(x,y,2);
    num += numadd;
    if (num >= den) {
      num -= den;
      x += xinc1;
      y += yinc1;
    }
    x += xinc2;
    y += yinc2;
  }
}

void dl2(float x1,float y1,float x2,float y2){
  float dx = x2-x1;
  float dy = y2-y1;
  if(dx == 0){
    for(float i = min(y1,y2);i<max(y1,y2);i+=1){
      //   pointx(x1,i); 
      pixpoint (x1,i,1); 
    }
    return;
  }
  float k = dy/dx;
  float m = y1 -x1*k;
  for(float i = min(x1,x2);i<max(x1,x2);i+=1/max(1,abs(k))){
    //  pointx(i,k*i+m); 
    pixpoint(i,k*i+m,1);
  }
}

void ppointx(float x,float y){

  // if(rmode=="P3D")  
  //point(x,y); 
  //set((int)x,(int)y,-1);
  pixels[(int)x+width*(int)y]=-1;
  pixels[((int)x+1)+width*(int)y]=-1;
  pixels[((int)x)+width*((int)y+1)]=-1;
  pixels[((int)x+1)+width*((int)y+1)]=-1;
  //if(rmode=="OPENGL") line(x,y,x+1,y);
}

void pointx(float x,float y){

  // if(rmode=="P3D")  
  point(x,y); 
  //set((int)x,(int)y,-1);
  // pixels[(int)x+width*(int)y]=-1;
  // pixels[((int)x+1)+width*(int)y]=-1;
  //   pixels[((int)x)+width*((int)y+1)]=-1;
  //  pixels[((int)x+1)+width*((int)y+1)]=-1;
  //if(rmode=="OPENGL") line(x,y,x+1,y);
}

void pixpoint(float x,float y, float s){
  pixels[(int)x+width*(int)y]=-1;
  if(s==2){
    pixels[((int)x+1)+width*(int)y]=-1;
    pixels[((int)x)+width*((int)y+1)]=-1;
    pixels[((int)x+1)+width*((int)y+1)]=-1;  
  }

}

void keyPressed(){
  if (keyCode == UP && frate < maxfrate)frate++;
  if(keyCode == DOWN && frate > minfrate) frate--;
  
  if (key=='v')viewtrails=!viewtrails;

}

void mouseDragged(){
  if(height-mouseY>minfrate)frate = height-mouseY; 
}


