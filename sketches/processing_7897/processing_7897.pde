
int legNum=8;
Leg[] leg = new Leg[legNum];
PFont font;

void setup() {
  size(800,600,P3D);
  smooth();
  fill(255, 100);
  font = createFont("arial",12,true);
  textFont(font);
  textAlign(CENTER);
  
  for (int i=0; i<legNum; i++) {
    leg[i]= new Leg(width/2+50*(i-1),height/2,300,i*TWO_PI/legNum,0.1+i*0.5); 

  }
}

void draw() {
  background(0);
  camera(mouseX,mouseY,850, 450,0,-30, 0,0,-0.5);
 /* 
  // Orange point light on the right
  pointLight(255, 255, 255, // Color
             200, -150, 0); // Position

  // Blue directional light from the left
  directionalLight(0, 102, 255, // Color
                   1, 0, 0); // The x-, y-, z-axis direction

  // Yellow spotlight from the front
  spotLight(255, 255, 109, // Color
            0, 40, 200, // Position
            0, -0.5, -0.5, // Direction
            PI / 2, 2); // Angle, concentration
  */          
  for (int i=0; i<legNum; i++) {

    leg[i].drawLeg();

  }
  /*
  stroke(255,100);
  for (int i=1; i<legNum; i++) {

    line(leg[i].joints[leg[i].jointsNum-1].x,leg[i].joints[leg[i].jointsNum-1].y,leg[i].joints[leg[i].jointsNum-1].z,
    leg[i-1].joints[leg[i-1].jointsNum-1].x,leg[i-1].joints[leg[i-1].jointsNum-1].y,leg[i-1].joints[leg[i-1].jointsNum-1].z);
  }
  */
}

class Leg {
  int jointsNum = 6;
  PVector[] joints = new PVector[jointsNum];
  PVector driver,target,ankle;
  float driverAngle,randomness,rotation;

  float armLength= 30;

  Leg(float xin, float yin, float zin, float _rotation, float _randomness) {
    for (int i=0; i<jointsNum; i++) {
      joints[i] = new PVector(0,0,0);
    }
    ankle = new PVector(xin,yin,zin);
    driver = new PVector(xin,yin,zin);
    target = new PVector(xin,yin,zin);
    rotation = _rotation;
    randomness = _randomness;  
  }

  void drawLeg() {
    pushMatrix();
    translate((ankle.x-joints[jointsNum-1].x)/30,
              (ankle.y-joints[jointsNum-1].y)/30,
              (ankle.z-joints[jointsNum-1].z)/30);
              
    //rotate(rotation);
    //driver.add(noise(-0.5,0.5),noise(-0.5,0.5),noise(-0.5,0.5));


    if (random(10)>9.8) target.set(random(width),random(height),random(800));

    driver.x += (target.x-driver.x)/100;
    driver.y += (target.y-driver.y)/100;
    driver.z += (target.z-driver.z)/100;

    //driverAngle += noise(randomness);
    //driver.add(5*cos(driverAngle),5*sin(driverAngle),0);

    joints[0]=driver.get();

    pushMatrix();
    translate(joints[0].x,joints[0].y,joints[0].z);
    fill(255,150,0);
    noStroke();
    box(5);
    //sphere(5);
    popMatrix();

    for (int i=1; i<jointsNum; i++) {
      float angleZ = atan2(joints[i].y-joints[i-1].y,joints[i].x-joints[i-1].x);
      float angleY = atan2(joints[i].z-joints[i-1].z,joints[i].x-joints[i-1].x);
      float angleX = atan2(joints[i].y-joints[i-1].y,joints[i].z-joints[i-1].z);

      joints[i].x = joints[i-1].x + armLength*cos(angleZ);
      joints[i].y = joints[i-1].y + armLength*sin(angleZ);
      joints[i].z = joints[i-1].z + armLength*cos(angleX);

      stroke(255);
      line(joints[i].x,joints[i].y,joints[i].z,joints[i-1].x,joints[i-1].y,joints[i-1].z);
      pushMatrix();
      translate(joints[i].x,joints[i].y,joints[i].z);
      //rotateX(angleX);
      //rotateY(angleY);
      rotateZ(angleZ);
      rotateY(angleY);
      rotateX(angleX);
      noStroke();
      
      fill(255,100);
      //text("Fuck",0,0);
      box(5);
   
      //box(5);

      popMatrix();
    }

    popMatrix();
  }
}









