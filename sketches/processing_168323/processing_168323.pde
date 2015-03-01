
/**************

  Collapse 4
  Zoombeani
  Rev 8-Oct-2014
  Org 3-Sep-2014
  
  Note: Using Bees & Bombs/ Dave Whyte's render model "//~~~"

***************/

//~~~
int[][] result;
float t;

/*void setup() {
  setup_();
  result = new int[width*height][3];
}
 
void draw() {
  if (mode==0) {          //Fine tune with mouse
    t = mouseX*1.0/width;
    draw_();
  } else if(mode==1) {    //Preview animation loop
    draw_();              //(Implemented by Zoombeani,
    t+=0.0025;            //idea courtesy of metaglitch)
    if(t>1.){
      t=0;
    }
  } else if(mode==2) {    //Preview animation loop with motion blur
    draw_();              //(Implemented by Zoombeani,
    //t+=0.05;            //idea courtesy of metaglitch)
    //if(t>1.){
      //t=0;
    //}
    for (int i=0; i<width*height; i++)
      for (int a=0; a<3; a++)
        result[i][a] = 0;
 
    for (int sa=0; sa<samplesPerFrame; sa++) {
      t = map(frameCount-1 + sa*shutterAngle/samplesPerFrame, 0, numFrames, 0, 1.);
      draw_();
      loadPixels();
      for (int i=0; i<pixels.length; i++) {
        result[i][0] += pixels[i] >> 16 & 0xff;
        result[i][1] += pixels[i] >> 8 & 0xff;
        result[i][2] += pixels[i] & 0xff;
      }
    }
 
    loadPixels();
    for (int i=0; i<pixels.length; i++)
      pixels[i] = 0xff << 24 |
        int(result[i][0]*1.0/samplesPerFrame) << 16 | 
        int(result[i][1]*1.0/samplesPerFrame) << 8 | 
        int(result[i][2]*1.0/samplesPerFrame);
    updatePixels();
    if(t>=1.){
      frameCount=0;
    }
  } else {                //Render frames to gif
    for (int i=0; i<width*height; i++)
      for (int a=0; a<3; a++)
        result[i][a] = 0;
 
    for (int sa=0; sa<samplesPerFrame; sa++) {
      t = map(frameCount-1 + sa*shutterAngle/samplesPerFrame, 0, numFrames, 0, 1);
      draw_();
      loadPixels();
      for (int i=0; i<pixels.length; i++) {
        result[i][0] += pixels[i] >> 16 & 0xff;
        result[i][1] += pixels[i] >> 8 & 0xff;
        result[i][2] += pixels[i] & 0xff;
      }
    }
 
    loadPixels();
    for (int i=0; i<pixels.length; i++)
      pixels[i] = 0xff << 24 |
        int(result[i][0]*1.0/samplesPerFrame) << 16 | 
        int(result[i][1]*1.0/samplesPerFrame) << 8 | 
        int(result[i][2]*1.0/samplesPerFrame);
    updatePixels();
   
    saveFrame("f###.gif");
    if (frameCount==numFrames){
      exit();
    }
  }
}
 
int samplesPerFrame = 16;
int numFrames = 90;
float shutterAngle = 1.;

int mode = 1; //0  for fine tune with mouse
              //1  for preview animation
              //2  for preview animation with motion blur
              //3  for render to gif
//~~~
*/

float tt, sh, st;
float tall;
float p1=.18,p2=.36,p3=.54,p4=.72,p5=.8,p6=.84,p7=.89,p8=.93,p9=.96;

//void setup_(){
void setup(){
  size(500,500,P3D);
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  strokeCap(ROUND);
  rectMode(CENTER);
}

//void draw_(){
void draw(){
  background(0,0,80,100);
  t+=0.0025;            //idea courtesy of metaglitch)
    if(t>1.){
      t=0;
    }
  pushMatrix();
  translate(width/2., height/2.);

  strokeWeight(8);

  if(t<p1){          //A dot emerges
    st=map(sin(map(t,0,p1,0,PI/2.)),0,1,0,8);
    strokeWeight(st);
    point(0,0);
  }else if(t<p2){    //A line grows from the dot
    strokeWeight(8);
    tall=map(sin(map(t,p1,p2,0,PI/2.)),0,1,0,500./2.*.8/sqrt(3));
    line(0,tall,tall,0,-tall,tall);
  } else if(t<p3){  //The line becomes the nearest edge of the square
    perspective();
    tall=500./2.*.8/sqrt(3);
    rotateY(map(sin(map(t,p2,p3,0,PI/2.)),0,1,PI/2.,0));
    rect(0,0,2.*tall,2.*tall);
  } else if(t<p4){  //Switch to orthographic projection and rotate to make a cube visible
    rotate(map(sin(map(t,p3,p4,0,PI/2.)),0,1,0,PI/6.));
    ortho();
    tall=500.*.8/sqrt(3);
    rotateY(atan(sin(map(sin(map(t,p3,p4,0,PI/2.)),0,1,0,PI/4.))));
    rotateX(map(sin(map(t,p3,p4,0,PI/2.)),0,1,0,PI/4.));
    box(tall,tall,tall);
  } else if(t<p5){  //Hold cube view
    ortho();
    rotate(PI/6.);
    rotateY(atan(sin(PI/4.)));
    rotateX(PI/4.);
    box(tall,tall,tall);
  } else if(t<p6){  //Reverse: cube to square
    ortho();
    tall=500.*.8/sqrt(3);
    rotate(map(cos(map(t,p5,p6,0,PI/2.)),1,0,PI/6.,0));
    rotateY(atan(sin(map(sin(map(t,p5,p6,PI/2.,0)),1,0,PI/4.,0))));
    rotateX(map(cos(map(t,p5,p6,0,PI/2.)),1,0,PI/4.,0));
    box(tall,tall,tall);
  } else if(t<p7){  //Sqaure to line
    perspective();
    tall=500./2.*.8/sqrt(3);
    rotateY(map(cos(map(t,p6,p7,0,PI/2.)),1,0,0,PI/2.));
    rect(0,0,2.*tall,2.*tall);
  } else if(t<p8){  //Line to dot
    tall=map(cos(map(t,p7,p8,0,PI/2.)),1,0,500./2.*.8/sqrt(3),0);
    line(0,tall,tall,0,-tall,tall);
  } else if(t<p9){  //Dot to nothing
    st=map(cos(map(t,p8,p9,0,PI/2.)),1,0,8,0);
    strokeWeight(st);
    point(0,0);
  }
  
  popMatrix();
}
