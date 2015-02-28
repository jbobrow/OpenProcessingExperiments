

/**
 *
 *    Deformed Sphere by Kof, 2012
 *
 */


////////////////////////////////////////////////

int shakeNum = 100;
ArrayList ms;
Sphere one;
PImage grid;
////////////////////////////////////////////////

void setup(){
  size(500,400,P3D);

  grid = loadImage("grid.png");
  one = new Sphere(new PVector(width/2,height/2,0),100,color(255));

  ms = new ArrayList();


  for(int i = 0 ; i < shakeNum ; i ++){
    ms.add(new MicroShake(i,random(1,2),random(4,200)));
  }
  // as always
  noiseSeed(19);

  colorMode(HSB);
}


////////////////////////////////////////////////

void draw(){
  background(0);
  int x = (int)random(3);
  int y = (int)random(3);

  blend(grid,0,0,width,height,-x,-y,width+x,height+y,ADD);

  for(int i = 0 ; i < ms.size();i++){
    MicroShake tmp = (MicroShake)ms.get(i);
    tmp.shake();
  }
  one.draw();
}


////////////////////////////////////////////////

/*
 * camera shaker class
 */

class MicroShake{

  float amp;
  float speed;
  int id;

  MicroShake(int id,float _amp,float _speed){
    amp = _amp;
    speed = _speed;
  }

  void shake(){
    translate(
        (0.5-noise((id*1.0+frameCount)/speed,0,0))*amp,
        (0.5-noise(0,(id*1.0+frameCount)/speed,0))*amp,
        (0.5-noise(0,0,(id*1.0+frameCount)/speed))*amp
        );
  }

}

/*
 * deformed sphere class
 *
 */

////////////////////////////////////////////////
class Sphere{
  PVector pos;
  float radius;
  float density;
  color c;

  Sphere(PVector _pos, float _rad,color _c){
    pos = new PVector(_pos.x,_pos.y,_pos.z);
    radius = _rad;
    density = 6.0;
    c = _c;
  }

  void draw(){

    
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    
    float d = noise(frameCount/300.0)*3000.0;
    density = noise(frameCount/313.0)*5.0+3.0;

    rotateX(frameCount/30.0);
    rotateY(frameCount/900.0);
    for(float f = -180 ; f < d; f += density){
      for(float ff = -90 ; ff < 90; ff += density){
        
        c = color(map(f,0,d,0,60),200,180);
        stroke(c,40);
        float x = cos(radians(f))*radius*cos(radians(ff));
        float y = sin(radians(f))*radius*cos(radians(ff));
        float z = sin(radians(ff))*radius;
        float deform = noise((frameCount+lerp(f,ff,noise((frameCount+ff)/222.0)))/300.0)*1.33;

        strokeWeight(map(abs(modelZ(x,y,z)),100,0,1,4));


        point(x*deform,y*deform,z*deform);
        
      }
    }

    axis();
    popMatrix();

  }

  void axis(){
    stroke(255,20);
    strokeWeight(3);
    line(-200,0,0,200,0,0);
    line(0,-200,0,0,200,0);
    line(0,0,-200,0,0,200);

  }

}

