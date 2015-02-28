
// author: thomas diewald
// date: 21.06.2013
//
// camera-controlled RGB-Transformation.
// each image-pixel (r,g,b) is transformed by the viewports modelview matrix.
//
// Peasycam Controls for 3d navigation
//   LMB ... orbit
//   MMB ... pan
//   RGM ... zoom
//
// SPACE ... toggle image/3d-viewport
// 'r'   ... reset auto-rotation
// 'a'   ... toggle auto-rotation



import java.util.Locale;
import peasy.PeasyCam;


PeasyCam cam;
PImage img_src, img_dst;
float rx=0, ry=0, rz=0; // for auto-rotation

boolean SHOW_IMAGE = true;
boolean AUTO_ANIMATE = true;

public void setup() {
  size(512, 512, P3D);
  
  cam = new PeasyCam(this, 300);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(500);
  
  img_src = loadImage("data/lena.png");
  img_dst = createImage(img_src.width, img_src.height, ARGB);
  
  textFont(createFont("MonoSpaced", 12));
  textMode(SCREEN);
}


public void draw(){

  background(255);
  gizmo(100);

  
  // modelview matrix
  PMatrix3D mat = (((PGraphics3D)g).modelview).get();
  if( !mousePressed && AUTO_ANIMATE){
    rx += .01f;
    ry += .02f;
    rz += .005f;
  }
  
  mat.rotateX(rx);
  mat.rotateY(ry);
  mat.rotateZ(rz);


  // transform RGB
  img_src.loadPixels();
  img_dst.loadPixels();

  final int[] pxsrc = img_src.pixels;
  final int[] pxdst = img_dst.pixels;

  for(int i = 0; i < pxsrc.length; i++){
    // get rgb (source image)
    final int argb = pxsrc[i];
    final int r = (argb>>16)&0xFF;
    final int g = (argb>> 8)&0xFF;
    final int b = (argb>> 0)&0xFF;
    
    // transform rgb -> rgb_
    int r_ = (int)(mat.m00*r +  mat.m01*g +  mat.m02*b +  mat.m03);
    int g_ = (int)(mat.m10*r +  mat.m11*g +  mat.m12*b +  mat.m13);
    int b_ = (int)(mat.m20*r +  mat.m21*g +  mat.m22*b +  mat.m23);
    
    // clamp rgb_
    if( r_ < 0 ) r_ = 0; else if( r_ > 255 ) r_ = 255;
    if( g_ < 0 ) g_ = 0; else if( g_ > 255 ) g_ = 255;   
    if( b_ < 0 ) b_ = 0; else if( b_ > 255 ) b_ = 255;   
    
    // set rgb_ (destination image)
    pxdst[i] = 0xFF000000 | r_<<16 | g_<<8 | b_;
  }

  img_dst.updatePixels();
 
  
  
  
  // display dst-image | 3d-viewport
  cam.beginHUD();
  {
    if( SHOW_IMAGE ){
      image(img_dst, 0, 0);
    }  else {
      fill(0);
      String fps = String.format(Locale.ENGLISH, "fps: %6.3f\n\n", frameRate);
      String r0  = String.format(Locale.ENGLISH, "%8.3f, %8.3f, %8.3f, %8.3f\n", mat.m00,mat.m01,mat.m02,mat.m03);
      String r1  = String.format(Locale.ENGLISH, "%8.3f, %8.3f, %8.3f, %8.3f\n", mat.m10,mat.m11,mat.m12,mat.m13);
      String r2  = String.format(Locale.ENGLISH, "%8.3f, %8.3f, %8.3f, %8.3f\n", mat.m20,mat.m21,mat.m22,mat.m23);
      String r3  = String.format(Locale.ENGLISH, "%8.3f, %8.3f, %8.3f, %8.3f\n", mat.m30,mat.m31,mat.m32,mat.m33);
      String txt = fps+r0+r1+r2+r3;
      text(txt, 20, 20);
    }
  }
  cam.endHUD();
 
}


void gizmo(float s){
  strokeWeight(1);
  stroke(255,0,0); line(0,0,0, s,0,0);
  stroke(0,255,0); line(0,0,0, 0,s,0);
  stroke(0,0,255); line(0,0,0, 0,0,s);
}

public void keyPressed(){
  if( online && key == ESC ) key = 0;
}
public void keyReleased(){
  if( online && key == ESC ) key = 0;
  
  if( key == ' ') SHOW_IMAGE = !SHOW_IMAGE;
  
  if( key == 'a') AUTO_ANIMATE = !AUTO_ANIMATE;
  
  if( key == 'r') rx = ry = rz = 0;
  
  if( !online && key =='s'){
    save("data/lena_rgb_camera_transformation.png");
  }
}


