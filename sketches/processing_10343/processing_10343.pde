
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam camera;

ArrayList move = new ArrayList();
   



int fastness = 1;
int blurness = 56;

int cameraZ;
int numoflifes = 2;
int t = 1;
void setup(){
  frameRate(32);
  size(800,800,P3D);
  cameraZ = height/2;
  smooth();
  camera = new PeasyCam(this,width/2,height/2,0,int((height/2.0)/tan(PI*60.0/360)));
//    float xc = random(-50,50);
//    float yc = random(-50,50);
//    float zc = random(-50,50);
//    float t=sqrt(sq(zc)+sq(yc)+sq(xc));
//    xc = 0;
//    yc = -1;
//    zc = 0;
//    int r =int(random(0,255));
//    int g =int(random(0,255));
//    int b =int(random(0,255));
//    move.add(new mover(400,height,0,xc,yc,zc,fastness,blurness,1,r,g,b));
//  
  background(0);
}
void draw(){

 background(0);
  noStroke();
  
//perspective(PI/3.0, width/height, cameraZ/10.0, cameraZ*10.0);
 float dirY = (mouseY / float(height) - 0.5) * 2;
  float dirX = (mouseX / float(width) - 0.5) * 2;
  directionalLight(222, 244, 255, -dirX, -dirY, -1);//processing.org dir light
  fill(0,0,0,255); // use black with alpha 10

  rectMode(CORNER);
 

  //background(0);
  for(int i = 0; i< move.size(); i++){
    mover movey = (mover) move.get(i);
    
    movey.update();
    if((movey.dead == true)){
      move.remove(0);
      print("t");
    }
  }
   saveFrame("worksmovie-####.tif"); 
   //background(0,0,0,255);
}
void mouseClicked(){
      float xc = mouseX-(height/2);
    float yc = -(height-mouseY);
    float zc = random(-50,50);
    float t=sqrt(sq(zc)+sq(yc)+sq(xc));
    xc = xc/t;
    yc = yc/t;
    zc = 0;

    int r =int(random(0,255));
    int g =int(random(0,255));
    int b =int(random(0,255));
    move.add(new mover(400,height,0,xc,yc,zc,t/300,blurness,1,r,g,b,ceil(random(1,4))));
    t = t+1;
}

