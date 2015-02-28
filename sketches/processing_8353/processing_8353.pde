
//import processing.opengl.*;
//import javax.media.opengl.*;

ArrayList Shrooms = new ArrayList();

float rotx,roty;

void setup() {
  size (600,600,P3D);
  colorMode (HSB, 360,100,100);
  
  for (int i = 0; i < 20; i++)
    Shrooms.add(new shroom(round(random(-1000,1000)),round(random(-1000,1000)),i));
}

void draw () {
  background(0);
  translate(width/2,height-mouseY/2,-mouseY-height);
  rotx += map(mouseX, 0, width,-0.02,0.02);
//  roty += map(mouseY, 0, height,-0.02,0.02);    
  rotateY(rotx);
  rotateZ(PI);
  //  rotateZ(roty);  
  for (int i = 0; i < Shrooms.size(); i++)  {
    shroom s = (shroom) Shrooms.get(i);
    s.display();
  }
}

class shroom {
  int x,y,z;
  int id;
  float tiltX;
  float stemSize=1;
  float capSize;
  float scaler,newScaler,scaleDif;
  float capWave,stemWave;
  float offset,offsetB;

  shroom (int x, int z, int id) {
    offset = random (2,5);
    offsetB = random (1,3);
    scaler = random (5,15);
    newScaler = scaler;
    capSize = scaler * offset;
    stemSize = offset*6 + scaler;   
    this.x = x;
    this.z = z;
    this.id = id;
  }

  void display() {
    if (random(190) >=189) {
      newScaler = random (5,15);
      scaleDif = newScaler - scaler;
    }
    scaleDif /= 2;
    scaler += scaleDif;
    capSize = scaler * offset;
    stemSize = offset*6 + scaler;
    
    stroke (id*7%360,offset*20,75);       
    stem();
    cap();
  }

  void cap() {
    pushMatrix();
    capWave = cos(scaler/5+offset)*scaler; 
    translate(x,y,z); 
    rotateY(radians(frameCount));    
    for (float i = 0; i <= scaler*2; i++) {
      pushMatrix();
      translate(capWave,scaler*scaler,capWave);       
      rotateY(radians(360/(scaler*2)*i));      

      float capX = 0;
      float capY = 0;
      float capZ = 0;
      float xx = capX + capSize*offset/offsetB;
      float yy = capY - capSize*offsetB/5;
      float zz = capZ;
      strokeWeight(2);
      point((capX+xx),(capY+yy)*.6,capZ);
      point((capX+xx)*1.4,(capY+offset*scaler+yy)+scaler,capZ);
      point ((capX+xx)*.3,(capY+offset*scaler+yy)*offset/2,capZ);
       strokeWeight(1);     
      bezier(capX,capY,capZ, (capX+xx)*.3,(capY+yy)*.7,capZ,(capX+xx),(capY+yy)*.6,capZ,xx,yy,capZ);
      bezier(capX,capY+offset*scaler,capZ, (capX+xx)*.3,(capY+offset*scaler+yy)*offset/2,capZ,(capX+xx)*1.4,(capY+offset*scaler+yy)+scaler,capZ,xx,yy,capZ);
      popMatrix();
    } 
    popMatrix();   
  }
  void stem() {
    pushMatrix();
    translate(x,y,z);
    rotateY(radians(frameCount));
    for (float i = 0; i < scaler; i++)  { 

      pushMatrix();
      stemWave = cos(i/5+offset)*scaler;
      translate (stemWave,i*scaler,stemWave);

      rotateX(HALF_PI);
      noFill();
      ellipseMode(CENTER);
      ellipse (0,0,stemSize+stemWave,stemSize+stemWave);
      popMatrix();     
    }
    popMatrix();
  }
}




