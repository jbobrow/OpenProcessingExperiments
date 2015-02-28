
import org.openkinect.*;
import org.openkinect.processing.*;
import peasy.*; 
import controlP5.*;
import processing.opengl.*;


Kinect kinect;
PeasyCam cam;
ControlP5 controlP5;
PMatrix3D currCameraMatrix;
PGraphics3D g3;

int skip = 6;

float a = 0;
float deg = 15;


int w = 640;
int h = 480;



float[] depthLookUp = new float[2048];

void setup() {
  size(800,600,OPENGL);
  
  //spotLight(51,102,126,width/2-300,height/2-150,550,-1,0,0,PI/2,2);
  //spotLight(51, 102, 126, 80, 20, 40, -1, 0, 0, PI/2, 2);
  
  g3=(PGraphics3D)g;
  controlP5 = new ControlP5(this);
  controlP5.addButton("SkipAdd",10,100,60,80,20).setId(1);
  controlP5.addButton("SkipMinus",4,100,90,80,20).setId(2);
  controlP5.setAutoDraw(false);

  cam = new PeasyCam(this,225,250,50,500); 
  cam.setMinimumDistance(5);
  cam.setMaximumDistance(800);


  kinect = new Kinect(this);

  kinect.start();
  kinect.enableDepth(true);
  kinect.processDepthImage(false);


  for (int i = 0; i < depthLookUp.length; i++) {
    depthLookUp[i] = rawDepthToMeters(i);
  }
}

void draw() {

  //rotateX(-.5); 
 // rotateY(-.5); 

  background(0);


  //fill(255);
 


  int[] depth = kinect.getRawDepth();


  //int skip = 6;


  translate(width/2-200,height/2-50,550); 
  rotateY(PI);

  for(int x=0; x<w-skip; x+=skip) {
    //fill(250,215,215);
    //beginShape();
    //fill(250,215,215);
    for(int y=0; y<h-skip; y+=skip) {
      int offset = x+y*w;
      int offset2 = (x+skip)+y*w;
      int offset3 = x+(y+skip)*w;
      int offset4 = (x+skip)+(y+skip)*w;


      int rawDepth = depth[offset];
      int rawDepth2 = depth[offset2];
      int rawDepth3 = depth[offset3];
      int rawDepth4 = depth[offset4];
      if(rawDepth > 700 && rawDepth < 2040) {
        rawDepth = 700;
      }
      
      if(rawDepth2 > 700 && rawDepth2 < 2040) {
        rawDepth2 = 700;
      }
      
      if(rawDepth3 > 700 && rawDepth3 < 2040) {
        rawDepth3 = 700;
      }
      
      if(rawDepth4 > 700 && rawDepth4 < 2040) {
        rawDepth4 = 700;
      }
      
      
      PVector v = depthToWorld(x,y,rawDepth);
      PVector v2 = depthToWorld(x+skip,y,rawDepth2);
      PVector v3 = depthToWorld(x+skip,y+skip,rawDepth4);
      PVector v4 = depthToWorld(x,y+skip,rawDepth3);
      //PVector v3 = depthToWorld(x,y,700);
      //PVector v4 = depthToWorld(x+skip,y,700);
      PVector v11 = depthToWorld(x,y,700);
      PVector v22 = depthToWorld(x+skip,y,700);
      PVector v33 = depthToWorld(x+skip,y+skip,700);
      PVector v44 = depthToWorld(x,y+skip,700);
      stroke(255,0,0);
      //fill(255,215,215);
     // pushMatrix();

      float factor = 800;
     // translate(v.x*factor,v.y*factor,factor-v.z*factor);
      if(rawDepth > 1 && rawDepth < 2040 && rawDepth2 > 1 && rawDepth2 < 2040 && rawDepth3 > 1 && rawDepth3 < 2040 &&rawDepth4 > 1 && rawDepth4 < 2040) {
        //fill(142,3,3);
        noFill();
        beginShape();
        vertex (v.x*factor, v.y*factor, v.z*factor);
        vertex (v2.x*factor, v2.y*factor,v2.z*factor);
        vertex (v3.x*factor, v3.y*factor,v3.z*factor);
        vertex (v4.x*factor, v4.y*factor, v4.z*factor);
        vertex (v.x*factor, v.y*factor, v.z*factor);
        endShape ();
        //quad(0,0,1,0,1,1,0,1);
      
//      }else if (rawDepth > 700 && rawDepth < 2000 && rawDepth2 > 700 && rawDepth2 < 2000 &&rawDepth3 > 700 && rawDepth3 < 2000&&rawDepth4 > 700 && rawDepth4 < 2000) {
//        //translate(v.x*factor, v.y*factor, 700);
//        //fill(250,215,215);
//        noFill();
//        beginShape();
//        vertex (v11.x*factor, v11.y*factor, v11.z*factor);
//        vertex (v22.x*factor, v22.y*factor, v22.z*factor);
//        vertex (v33.x*factor, v33.y*factor, v33.z*factor);
//        vertex (v44.x*factor, v44.y*factor, v44.z*factor);
//        vertex (v11.x*factor, v11.y*factor, v11.z*factor);
//        //vertex (v3.x*factor, v3.y*factor, 700);
//        //vertex (v4.x*factor, v4.y*factor,700);
//        
//        endShape ();
//        //quad(0,0,1,0,1,1,0,1);
      }

    }
    //endShape ();
  }
  //a += 0.015f;
  gui();
}

void gui() {
  currCameraMatrix = new PMatrix3D(g3.camera);
  camera();
  controlP5.draw();
g3.camera = currCameraMatrix;
}

void SkipAdd (float theValue) {
 // println("a button event. "+theValue);
  skip++;
}

void SkipMinus (float theValue) {
 // println("a button event. "+theValue);
  skip--;
}


float rawDepthToMeters(int depthValue) {
  if (depthValue < 2047) {
    return (float)(1.0 / ((double)(depthValue) * -0.0030711016 + 3.3309495161));
  }
  return 0.0f;
}

PVector depthToWorld(int x, int y, int depthValue) {

  final double fx_d = 1.0 / 5.9421434211923247e+02;
  final double fy_d = 1.0 / 5.9104053696870778e+02;
  final double cx_d = 3.3930780975300314e+02;
  final double cy_d = 2.4273913761751615e+02;

  PVector result = new PVector();
  double depth =  depthLookUp[depthValue];
  result.x = (float)((x - cx_d) * depth * fx_d);
  result.y = (float)((y - cy_d) * depth * fy_d);
  result.z = (float)(depth);
  return result;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      deg++;
    } 
    else if (keyCode == DOWN) {
      deg--;
    }
    deg = constrain(deg,0,30);
    kinect.tilt(deg);
  }
  else if (key == 's') {
    a += 0.1f;
  }
}




void stop() {
  kinect.quit();
  super.stop();
}

