
import com.onformative.leap.LeapMotionP5;
import com.leapmotion.leap.Hand;
import processing.opengl.*;
import processing.video.*;

 
//回転角度
float a;

LeapMotionP5 leap;
float rotX;float rotY;
PVector posSphere;

Capture cam;


private float LEAP_WIDTH = 200.0f; // in mm
private float LEAP_HEIGHT = 500.0f; // in mm
private float LEAP_DEPTH = 200.0f; // in mm
 
 
//立方体の数
int NUM = 250;     
float offset = PI/NUM;
//色のグラデーションを格納する配列
//color[] colors = new color[NUM];
 
void setup() { 
    size(400,400,P3D); 
    noStroke();
    //colorMode(HSB,360,100,100,100);
    leap = new LeapMotionP5(this);
    cam = new Capture(this, width,height);
    cam.start();
    frameRate(30);
    
    /*for(int i=0; i<NUM; i++) {
    colors[i] = color(i*cam.width,cam.height,100,25);
    }*/
}


float toScreenX(float x) {
    float c = width / 2.0f;
    if (x > 0.0) {
      return lerp(c, width, x / LEAP_WIDTH);
    } else {
      return lerp(c, 0.0f, -x / LEAP_WIDTH);
    }
}

float toScreenY(float y) {
  return PApplet.lerp(height, 0.0f, y / LEAP_HEIGHT);
}


 
void draw() {     
    background(0);
    lights();
    posSphere = new PVector(width/2,height/2,-10);
    //座標を中心に
    translate(width/2, height/2, -20);
 
    //leapmove
  
    if(leap.getHandList().size()==1){
    Hand hand = leap.getHandList().get(0);
    PVector handNorm = new PVector(hand.palmNormal().getX(), hand.palmNormal().getY(), hand.palmNormal().getZ());
    PVector handDir = new PVector(hand.direction().getX(), hand.direction().getY(), hand.direction().getZ());

    float posX = toScreenX(hand.sphereCenter().getX());
    float posY = toScreenY(hand.sphereCenter().getY());
    float posZ = toScreenX(hand.sphereCenter().getZ());

    posSphere = new PVector(posX,posY,posZ/*hand.sphereCenter().getZ()*/);
    
    float roll = hand.palmNormal().roll()*.2;
    float pitch = hand.direction().pitch()*.2;
    float yaw = hand.direction().yaw()*.25;
    if(hand.direction().getY()<0.45){
      rotateX(2*PI-(float)Math.toDegrees(yaw) / (float)Math.toDegrees(pitch));
      rotateY((float)Math.toDegrees(pitch) / 2*PI-(float)Math.toDegrees(yaw));
      rotateZ(2/PI+(float)Math.toDegrees(pitch) / 2*PI-(float)Math.toDegrees(roll));
      
      // rotY = 2*PI-(float)Math.toDegrees(yaw);
      //rotX = (float)Math.toDegrees(pitch);
    }
    
//import
     float handX = map(leap.getPosition(hand).x,-350,350,0,width);
     float handY = map(leap.getPosition(hand).y,-300,450,0,height);
     println("X="+handX);
     println("Y="+handY);
    

  if (cam.available() == true) { 
     cam.read();
     cam.loadPixels();
     
  // int X = int(handX);
   //int Y = int(handY);
   
   /* for(int i=0; i<NUM; i++) {
    colors[i] = color(X,Y,100,25);
    }*/
  
    int loc = int(handX + handY*cam.width);
    color c = cam.pixels[loc];
    
    ambientLight(random(255),random(255) , 31);
    directionalLight(handX,handY,255,-1,0,150);
    pointLight(63, 127, 255, handX, handY, 255);
    spotLight(100, 100, 100, handX, handY, 200, 0, 0, -1, PI, 2);
    
    //float br = brightness(c);
    fill(c);
    println(c);

  }
  
 
  
    //少しずつ回転角度をずらしながら、立方体を描画
    for(int i=0; i<NUM; i++) {
    pushMatrix();
    rotateY(a+offset*i);
    rotateX(a/2+offset*i);
    rotateZ(a/3+offset*i-10);
    box(width/2);
    //translate(posSphere.x,posSphere.y,posSphere.z);
    //rotateX(rotX);
    //rotateY(rotY);
    //scale(50);
    popMatrix();
    }
     }
   }
    /*for(int i=0; i<NUM; i++) {
    colors[i] = color(i*2+100,70,100,25);
    }*/




      


   

