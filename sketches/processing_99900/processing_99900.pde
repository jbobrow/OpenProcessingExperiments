
// Boxcloud, by Jan Wolski (inspiration by Aiko Tsukahara's "Space apartment")

ArrayList<Cube> cubes;
int frame = 0;
static final int CUBE_SIZE = 15;
int dragStartX = 0;
float mouseRot = 0.0;
float tmpMouseRot = 0.0;

void setup() {
  size(800, 600, P3D);
  frameRate(30);
  cubes = new ArrayList<Cube>();
  
  randCube(2);
  randCube(10);
  randCube(10);
  
}

void draw() {
  background(0);
  
  translate(width/2, height/2, 200);

  directionalLight(255,255,255,2,4,-7);
  ambientLight(70,70,70);

  rotateZ(-1);
  rotateY(1);
  rotateX(.5);
  rotateZ(mouseRot + tmpMouseRot);
  
  for(Cube c:cubes){
    c.draw();
  }
  
  if(frame%2 == 0 && cubes.size() <1000) growCube();
  frame++;
}

void mousePressed(){
  dragStartX = mouseX;
}

void mouseDragged(){
  tmpMouseRot = (dragStartX - mouseX)/50.0;
}

void mouseReleased(){
  mouseRot += tmpMouseRot; 
  tmpMouseRot = 0.0;
}

void growCube(){
  Cube incoming = null;
  while(incoming == null){
    incoming = cubes.get((int)random(cubes.size())).createNeighbor();
  }
  cubes.add(incoming);
}

void randCube(int extents){
  Cube candidate = null;
  while(candidate == null){
    candidate = new Cube(new PVector(CUBE_SIZE*(-extents+(int)random(extents*2)), CUBE_SIZE*(-extents+(int)random(extents*2)), CUBE_SIZE*(-extents+(int)random(extents*2))));
    for(Cube c:cubes){
      if(c.intersectsWith(candidate)){
        candidate = null;
        break;
      }
    }
  }
  cubes.add(candidate);
}

class Cube{
  PVector center;
  
  Cube(PVector c){
    center = c;
  }
  
  Cube createNeighbor(){
    PVector offset;
    
    switch ((int) random(6)) {
            case 0:  offset = new PVector(CUBE_SIZE,0,0);
                     break;
            case 1:  offset = new PVector(-CUBE_SIZE,0,0);
                     break;
            case 2:  offset = new PVector(0,CUBE_SIZE,0);
                     break;
            case 3:  offset = new PVector(0,-CUBE_SIZE,0);
                     break;
            case 4:  offset = new PVector(0,0,CUBE_SIZE);
                     break;
            case 5:  offset = new PVector(0,0,-CUBE_SIZE);
                     break;
            default: offset = new PVector(0,0,0);
    }
    
    Cube tmpCube = new Cube(PVector.add(center, offset));
    for(Cube c:cubes){
      if(c.intersectsWith(tmpCube)){
        //println("cube at " + tmpCube.center + " rejected");
        return null;
      }
    }
    
    if(offset.x == 0){
      if((int) random(2) == 0){
        offset.x = CUBE_SIZE/2f;
      }else{
        offset.x = -CUBE_SIZE/2f;
      }
    }
    if(offset.y == 0){
      if((int) random(2) == 0){
        offset.y = CUBE_SIZE/2f;
      }else{
        offset.y = -CUBE_SIZE/2f;
      }
    }
    if(offset.z == 0){
      if((int) random(2) == 0){
        offset.z = CUBE_SIZE/2f;
      }else{
        offset.z = -CUBE_SIZE/2f;
      }
    }
    
    tmpCube = new Cube(PVector.add(center, offset));
    
    for(Cube c:cubes){
      if(c.intersectsWith(tmpCube)){
        //println("cube at " + tmpCube.center + " rejected");
        return null;
      }
    }
    return tmpCube;
  }
  
  boolean intersectsWith(Cube other){
    if(abs(this.center.x-other.center.x) >= CUBE_SIZE) return false;
    if(abs(this.center.y-other.center.y) >= CUBE_SIZE) return false;
    if(abs(this.center.z-other.center.z) >= CUBE_SIZE) return false;
    return true;
  }
  
  void draw(){
    pushMatrix();
    translate(center.x, center.y, center.z);
    noStroke();
    box(CUBE_SIZE);
    popMatrix();
  }
}


