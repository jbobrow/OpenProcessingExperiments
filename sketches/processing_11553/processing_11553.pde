
// working on this: http://code4k.blogspot.com/2009/10/potatro-and-raymarching-story-of.html

PImage img;
Sphere s;
// move through the screen points

Vector3d cameraCenter;
float screenDistance;
Vector3d rayPosition, lightPos;

void setup(){
  size(300, 300);
  smooth();
  
  img = createImage(width, height, RGB);
  s = new Sphere(new Vector3d(width/2.0, height/2.0, 10.0), 90);
  lightPos = new Vector3d(width/4.0, height/4.0, 5.0);
  cameraCenter = new Vector3d(width/2, height/2, -100);
  screenDistance = 5;
  rayPosition = new Vector3d(cameraCenter);
}

void draw(){
  // update the position of the sphere
  s.center.z = sin(millis()/200.0)*10+15;
  s.center.x = sin(millis()/300.0)*10+width/2.0;
  for(int h = 0;h<height;h++){
      for(int w = 0; w<width;w++){
          Vector3d screenPoint = new Vector3d(w, h, screenDistance);
          rayPosition = new Vector3d(cameraCenter);
          Vector3d ray = screenPoint.sub(cameraCenter);
          ray.normalize();
          // will need to do this in a loop if there is more than one sphere
          float sphereDistance = rayPosition.distance(s.center)-s.radius;
          //println(sphereDistance);
          ray.mult(sphereDistance);
          rayPosition.add(ray);
          if(rayPosition.distance(s.center)-s.radius<0.5){
              //float lightDist = rayPosition.distance(lightPos);
              color black = color(#CCBB51);
              set(w, h, black);
          }else{
              color orange = color(#B23467);
              set(w, h, orange);
          }
      }
  }
}

// wish I didn't have to write this over and over.
class Vector3d{
    float x, y, z;
    Vector3d(float _x, float _y, float _z){
        x = _x;
        y = _y;
        z = _z;
    }
    Vector3d(Vector3d _v){
        x = _v.x;
        y = _v.y;
        z = _v.z;
    }
    float distance(Vector3d _v){
        float xd = x - _v.x;
        float yd = y - _v.y;
        float zd = z - _v.z;
        return sqrt(xd*xd + yd*yd + zd*zd);
    }
    void normalize(){
        Vector3d zeroVector = new Vector3d(0, 0, 0);
        float length = distance(zeroVector);
        x /= length;
        y /= length;
        z /= length;
    }
    void add(Vector3d _v){
        x+=_v.x;
        y+=_v.y;
        z+=_v.z;
    }
    void mult(float _c){
      x*=_c;
      y*=_c;
      z*=_c;
    }
    Vector3d sub(Vector3d _v){
        return new Vector3d(x-_v.x, y-_v.y, z-_v.z);
    }
}

class Sphere{
    Vector3d center;
    float radius;
    Sphere(Vector3d _c, float _r){
        center = _c;
        radius = _r;
    }
}


