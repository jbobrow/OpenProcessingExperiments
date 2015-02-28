

float spin = 0.0;

SinWave sinW1;
SinWave sinW2;  //time=0
CosWave cosW1;
CosWave cosW2;  //time=0;
TanWave tanW1;
TanWave tanW2;  //time=0;

float frequency = 0.01;
float time1 = PI/2;
float time2 = 0;
float amplitude = 10;
float offset = 0;

float ang;
float posX;
float posY;
float posZ;

float posX2;
float posY2;
float posZ2;

ArrayList<Tetrahedron> triS;

float noiseVal;
float noiseScale=0.02;

int octaves;
float falloff;
float time;

//Camera
float xmag, ymag = 0;
float newXmag, newYmag = 0; 
float averagePosX = 0;


void setup() {
  noCursor();
  
  size(1000, 800, P3D);
  sinW1 = new SinWave(time1, frequency, amplitude, offset);
  sinW2 = new SinWave(time2, frequency, amplitude, offset);
  cosW1 = new CosWave(time1, frequency, amplitude, offset);
  cosW2 = new CosWave(time2, frequency, amplitude, offset);
  tanW1 = new TanWave(time1, frequency, amplitude, offset);
  tanW2 = new TanWave(time2, frequency, amplitude, offset);

  triS = new ArrayList<Tetrahedron>();
}




void draw() {
  background(255/23);
  //lights();
  noFill();
  stroke(255);

  rotateX(-PI/2);
  noiseDetail(octaves, falloff);
  
//  camera(width/2.0, height/2.0, (height/2.0)/tan(PI*30.0 / 180.0), 
//         width/2.0, height/2.0, 0, 
//         0, 1, 0);
  


  posX = sinW1.run();
  posY = cosW2.run();
  posZ = cosW1.run();
  
  posX2 = cosW1.run();
  posY2 = sinW2.run();
  posZ2 = cosW2.run();


  spin = 0.05*tanW1.run();

  if(triS.size()>0){
    //averagePosX = 0;
    for(int i=0; i<triS.size(); i++){
      Tetrahedron t = triS.get(i);
      
      if(i%2 == 0)
        t.update(t.x+posX, t.y+posY, t.z+(noise(time)*posZ), spin);
      else
        t.update(t.x+posX2, t.y+posY2, t.z+(noise(time)*posZ2), spin);

      t.display();
      
    }
  }


  // show frame rate
  pushMatrix();
  pushStyle();
  fill(255);
  textSize(13);
  rotateX(PI/2);
  text(int(frameRate), 30, 30);
  text("mouseClick to generate tetrahedrons", 30, 50);
  text("NOISE: up to increase Octaves, right to increase FallOff", 30, 70);
  popStyle();
  popMatrix();
  

}

void mousePressed(){
  
  newTri();

}

void newTri(){
  
  Tetrahedron t = new Tetrahedron();
  triS.add(t);
  
}

void keyPressed() {

  switch(keyCode) {
  case UP:
    octaves++;
    break;
  case DOWN:
    octaves--;
    break;
  case RIGHT:
    falloff+=.1;
    break;
  case LEFT:
    falloff-=.1;
    break;
  }

  octaves = constrain(octaves, 1, 25);
  falloff = constrain(falloff, 0.01, 1.05);
  
  println("OCTAVES: " + octaves + "\t\tFALLOFF: " + falloff);
}



class Tetrahedron {

  PShape t;
  PShape t1, t2, t3, t4;
  
  float x, y, z;
  float scale=5;
  float angleY;


  Tetrahedron() {
    t = createShape(GROUP);
    
    t1 = createShape();
    t1.beginShape();
    t1.vertex(-3, 0, 0);
    t1.vertex(3, 0, 0);
    t1.vertex(0, 0, -4);
    t1.endShape(CLOSE);

    t2 = createShape();
    t2.beginShape();
    t2.vertex(-3, 0, 0);
    t2.vertex(0, 4, -1.7);
    t2.vertex(3, 0, 0);
    t2.endShape(CLOSE);
    
    t3 = createShape();
    t3.beginShape();
    t3.vertex(3, 0, 0);
    t3.vertex(0, 4, -1.7);
    t3.vertex(0, 0, -4);
    t3.endShape(CLOSE);
    
    t4 = createShape();
    t4.beginShape();
    t4.vertex(-3, 0, 0);
    t4.vertex(0, 0, -4);
    t4.vertex(0, 4, -1.7);
    t4.endShape(CLOSE);

    t.addChild(t1);
    t.addChild(t2);
    t.addChild(t3);
    t.addChild(t4);
    
    x = random(width/2-200, width/2+200);
    y = random(height/2-200, height/2+200);
    z = random(-200,200);
  }
  

  
  void update(float _x, float _y, float _z) {
    x = _x;
    y = _y;
    z = _z;
  }

  void update(float _x, float _y, float _z, float _angleY) {
    x = _x;
    y = _y;
    z = _z;
    angleY = _angleY;
  }
  
  void setZ(float _z) {
    z = _z;
  }
  
  void setAngle(float _angleY) {
    angleY = _angleY;
  }

  void display() {
    pushMatrix();

    translate(x, y, z);
    rotateY(angleY);
    scale(scale);

    shape(t);
    popMatrix();
  }
}



class Wave{
  
  float time, frequency, amplitude, offset;

  Wave(float _time, float _frequency, float _amplitude, float _offset){
    time = _time;
    frequency = _frequency;
    amplitude = _amplitude;
    offset = _offset;
  }
  
  float run(){
    time += frequency;
    return sin( time ) * amplitude + offset;
  }

}

class SinWave {
  float time, frequency, amplitude, offset;

  SinWave(float _time, float _frequency, float _amplitude, float _offset){
    time = _time;
    frequency = _frequency;
    amplitude = _amplitude;
    offset = _offset;
  }
  
  float run() {
    time += frequency;
    return sin( time ) * amplitude + offset;
  }
  
}

class CosWave{
  float time, frequency, amplitude, offset;

  CosWave(float _time, float _frequency, float _amplitude, float _offset){
    time = _time;
    frequency = _frequency;
    amplitude = _amplitude;
    offset = _offset;
  }
  
  float run() {
    time += frequency;
    return cos( time ) * amplitude + offset;
  }
  
}

class TanWave {
  float time, frequency, amplitude, offset;

  TanWave(float _time, float _frequency, float _amplitude, float _offset){
    time = _time;
    frequency = _frequency;
    amplitude = _amplitude;
    offset = _offset;
  }
  
  float run() {
    time += frequency;
    return tan( time ) * amplitude + offset;
  }
  
}

