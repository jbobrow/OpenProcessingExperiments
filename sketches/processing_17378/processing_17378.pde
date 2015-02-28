
raySphere[] spheres;
float spring = 0.1;
float damping = 0.0;
float gravity = 0.0;
float depth = 200;
int magnification = 1;
PVector mouseSmoothed;
float smoothingFactor = 0.2;
PVector mid;
void setup(){
//  size(200*magnification,150*magnification);
  size(400,300);
  depth *= magnification;
  mid = new PVector(width/2,height/2,depth/2);
  spheres = new raySphere[3];
  for(int i=0;i<spheres.length;i++){
    spheres[i] = new raySphere(i);
  }
  mouseSmoothed = new PVector(width/2,height/2);
}
void draw(){
  if(frameCount%10==0){println(
    "frameRate = "+nf(frameRate,2,3)+" fps");}
  physics();
  Orient ori = new Orient();
  mouseSmoothed.x += (mouseX-mouseSmoothed.x)*smoothingFactor;
  mouseSmoothed.y += (mouseY-mouseSmoothed.y)*smoothingFactor;
  ori.spin(new PVector(
    -(mouseSmoothed.y-height/2)/height*PI,0,0));
  ori.spin(new PVector(
    0,(mouseSmoothed.x-width/2)/width*TWO_PI,0));
  for(int j=0;j<height/magnification;j++){
    for(int i=0;i<width/magnification;i++){
      PVector dir = new PVector(i-width/2,
        j-height/2,width);
      dir.normalize();
      ray r = new ray(new PVector(
        i*magnification,j*magnification,-width*3/4),dir);
      r.location = PVector.add(ori.toWorld(PVector.sub(
        r.location,mid)),mid);
      r.direction = ori.toWorld(r.direction);
      float closest = 1000000;
      color closestValue = colorFromBackground(r.direction);
      for(int k=0;k<spheres.length;k++){
        colorReport c = spheres[k].colorFromRay(new ray(r));
        if(c.isColor){
          if(c.depth<closest){
            closest = c.depth;
            closestValue = c.colour;
          }
        }
      }
      set(i,j,closestValue);
    }
  }
  PImage frame = new PImage();
  frame = get();
  image(frame,0,0,width*magnification,height*magnification);
}
void physics(){
  for(int i=1;i<spheres.length;i++){
    for(int j=0;j<i;j++){
      PVector dx = PVector.sub(
        spheres[j].location,spheres[i].location);
      float combinedRad = spheres[j].radius+spheres[i].radius;
      if(abs(dx.x)<combinedRad){
        if(abs(dx.y)<combinedRad){
          if(abs(dx.z)<combinedRad){
            if(dx.mag()<combinedRad){
              float restore = (combinedRad - dx.mag())*spring;
              dx.normalize();
              float dampen = dx.dot(PVector.sub(
                spheres[j].velocity,spheres[i].velocity))*damping;
              dx.mult(restore - dampen);
              spheres[i].force.sub(dx);
              spheres[j].force.add(dx);
            }
          }
        }
      }
    }
  }
  for(int i=0;i<spheres.length;i++){
    boolean dampen = false;
    if(spheres[i].location.x<0){
      spheres[i].force.x -= spheres[i].location.x*spring;
      dampen = true;
    };
    if(spheres[i].location.x>width){
      spheres[i].force.x -= (spheres[i].location.x-width)*spring;
      dampen = true;
    };
    if(spheres[i].location.y<0){
      spheres[i].force.y -= spheres[i].location.y*spring;
      dampen = true;
    };
    if(spheres[i].location.y>height){
      spheres[i].force.y -= (spheres[i].location.y-height)*spring;
      dampen = true;
    };
    if(spheres[i].location.z<0){
      spheres[i].force.z -= spheres[i].location.z*spring;
      dampen = true;
    };
    if(spheres[i].location.z>depth){
      spheres[i].force.z -= (spheres[i].location.z-depth)*spring;
      dampen = true;
    };
//    if(dampen){spheres[i].velocity.mult(0.9);}
//    PVector dx = PVector.sub(mid,spheres[i].location);
//    if(dx.mag()>width/2){
//      float restore = spring*(dx.mag()-width/2);
//      dx.normalize();
//      dx.mult(restore);
//      spheres[i].force.add(dx);
//    }
    spheres[i].update();
  }
}
class raySphere{
  int catalog;
  PVector location;
  PVector velocity;
  PVector force;
  float radius;
  raySphere(int cat){
    location = new PVector(random(0,width),
      random(0,height),
      random(0,depth));
    float Vo = 1;
    velocity = new PVector(random(-Vo,Vo),
      random(-Vo,Vo),
      random(-Vo,Vo));
    force = new PVector();
    radius = random(64,128);
    catalog = cat;
  }
  void update(){
    velocity.add(force);
    force = new PVector(0,gravity);
    location.add(velocity);
    if(frameCount%15==0){
      velocity.normalize();
      velocity.mult(2);
    }
  }
  colorReport colorFromRay(ray r){
    PVector dx = PVector.sub(location,r.location);
    float adjacent = dx.dot(r.direction);
    colorReport c = new colorReport(false);
    if(adjacent>0){
      PVector opposite = PVector.sub(dx,PVector.mult(
        r.direction,adjacent));
      if(opposite.mag()<radius){
        float adjacent2 = radius*sin(acos(opposite.mag()/radius));
        if(adjacent2<adjacent){
          float depth = adjacent-adjacent2;
//          depth *= 0.9995;
          r.location.add(PVector.mult(
            r.direction,depth));
          dx = PVector.sub(location,r.location);
          dx.normalize();
          float normalComp = dx.dot(r.direction);
          r.direction.sub(PVector.mult(dx,2.0*normalComp));
          r.direction.normalize();
          float closest = 1000000;
          color closestValue = colorFromBackground(r.direction);
          for(int i=0;i<spheres.length;i++){
            if(i!=catalog){
              colorReport c2 = 
                spheres[i].colorFromRay(new ray(r));
              if(c2.isColor){
                if(c2.depth<closest){
                  closest = c.depth;
                  closestValue = c2.colour;
                }
              }
            }
          }
          c = new colorReport(closestValue,depth);
        }
      }
    }
    return c;
  }
}
class ray{
  PVector location;
  PVector direction;
  ray(PVector loc,PVector dir){
    location = new PVector(loc.x,loc.y,loc.z);
    direction = new PVector(dir.x,dir.y,dir.z);
  }
  ray(ray r){
    location = new PVector(
      r.location.x,r.location.y,r.location.z);
    direction = new PVector(
      r.direction.x,r.direction.y,r.direction.z);
  }
}
class colorReport{
  color colour;
  boolean isColor;
  float depth;
  colorReport(color c,float d){
    colour = c;
    isColor = true;
    depth = d;
  }
  colorReport(boolean isColor){
    isColor = isColor;
    colour = color(0);
    depth = 0;
  }
}
color colorFromBackground(PVector v){
//  v.normalize();
  return color(int(constrain(v.x,0,1)*255),
    int(constrain(v.y,0,1)*255),
    int(constrain(v.z,0,1)*255));
}


