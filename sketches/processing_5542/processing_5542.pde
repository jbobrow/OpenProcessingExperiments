
import org.jbox2d.util.nonconvex.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.testbed.*;
import org.jbox2d.collision.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.p5.*;
import org.jbox2d.dynamics.*;
Physics physics;

PVector[] punkt= new PVector[4];
PVector[] minPunkt = new PVector [4];
float[] punkterX = new float[4];
float[] punkterY = new float[4];
float[] minPunktX = new float [4];

float mindste1;
float mindste2;
float mindste3;


void setup(){
  size (1000,1000);
  InitScene();
}

void draw(){
  background(255);
}

void mousePressed(){

  for (int i=0; i<4; i++){
    punkt[i] = new PVector (random(width),random(height));
    punkterX[i] = punkt[i].x;
    punkterY[i] = punkt[i].y;
    minPunktX[0] = min (punkterX);
  }
  for (int i = 0 ; i<4;i++){
    if (punkt[i].x == minPunktX[0]){
      minPunkt[0] = punkt[i].get();

    }
  }
  mindste1=-3;
  for (int i = 0 ;i<4;i++){
    if (punkt[i].x!= minPunkt[0].x){
      if ((minPunkt[0].y-punkt[i].y)/abs(dist(minPunkt[0].x,minPunkt[0].y,punkt[i].x,punkt[i].y))>mindste1){
        mindste1=(minPunkt[0].y-punkt[i].y)/abs(dist(minPunkt[0].x,minPunkt[0].y,punkt[i].x,punkt[i].y));
        minPunkt[1] = punkt[i].get();
      }
    }
  }
  mindste2=-3;
  for (int i = 0 ;i<4;i++){
    if (punkt[i].x!= minPunkt[0].x && punkt[i].x!= minPunkt[1].x){
      if ((minPunkt[0].y-punkt[i].y)/abs(dist(minPunkt[0].x,minPunkt[0].y,punkt[i].x,punkt[i].y))>mindste2){
        mindste2=(minPunkt[0].y-punkt[i].y)/abs(dist(minPunkt[0].x,minPunkt[0].y,punkt[i].x,punkt[i].y));
        minPunkt[2] = punkt[i].get();
      }
    }
  }
  for (int i = 0 ;i<4;i++){
    if (punkt[i].x!= minPunkt[0].x && punkt[i].x!= minPunkt[1].x && punkt[i].x!= minPunkt[2].x){

      minPunkt[3] = punkt[i].get();

    }
  }
CreateObjects();
}

void InitScene()
{
  physics = new Physics(this, width, height-100,0,-9.82,width*2,height*2,width+30,height+100,20);
  physics.setDensity(0.2);
  physics.setRestitution(0.5);
}

void CreateObjects()
{
physics.createPolygon(minPunkt[0].x,minPunkt[0].y,minPunkt[3].x,minPunkt[3].y,minPunkt[2].x,minPunkt[2].y,minPunkt[1].x,minPunkt[1].y);
}


