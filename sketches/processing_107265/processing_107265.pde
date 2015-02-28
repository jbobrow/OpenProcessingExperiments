
class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float rad;          //radius of mover
  float mass = 10.0;
  boolean moveTest;    //check ball is moving
  color c = color(175);
  color sc = color(255,0,0);
  
  Mover(float tempRad, boolean tempMoveTest){
    location = new PVector(random(rad/2,width-(rad/2)),random(rad/2,height-(rad/2)),random(-200+(rad/2),rad/2));
    
    moveTest = tempMoveTest;
    if(moveTest){
      velocity = new PVector(random(-2,2),random(-2,2),random(-2,2));
    }else{
      velocity = new PVector(0,0,0);
    }    
    
    acceleration = new PVector(0,0,0);
    rad = tempRad;
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);   //update loc PV with vel PV
    acceleration.mult(0);
  }
  
  void applyForce(PVector force){
    PVector f = force.get();      //makes a copy of the force var coming in
    f.div(mass);              //newton's 2nd law
    acceleration.add(f);      //update accel with force
  }
  
  void display(){
    pushMatrix();
      strokeWeight(1);
      stroke(sc);
      fill(c);
      translate(location.x,location.y,location.z);
      sphereDetail(10);
      sphere(rad);
      sc = color(0,255,0);  //reset stroke colour
      c = color(0,100,0);   //reset colour
    popMatrix();
  }
  
  void checkEdges(){            //if mover goes ouside of screen, bounce
    if(location.x > width-(rad/2) || location.x < 0+(rad/2)){     
      velocity.x *= -1;
    }
    
    if(location.y > height-(rad/2) || location.y < 0+(rad/2)){
      velocity.y *= -1;
    }
    
    if(location.z < -200 || location.z > 0){
     velocity.z *= -1; 
    }
  }
  
  boolean intersect(Mover m){
    float distance = dist(location.x,location.y,location.z,m.location.x,m.location.y,m.location.z);
    if (distance < rad+m.rad){
      return true;
    }else{
      return false;
    }
  }
  
  void highlight(){
    sc = color(255,0,0);
    c = color(200,0,0); 
  }
  
}

//------------------------------------------

class Tank{    
  float tankW;    //width
  float tankH;    //height
  float tankD;    //depth
  color tankC = color(0);     //clear colour?
  color tankCr = color(0);    //tank right face colour
  color tankCl = color(0);    //tank left face colour
  color tankCb = color(0);    //tank back face colour
  color tankCt = color(0);    //tank top face colour
  color tankCz = color(0);    //tank bottom face colour
  
Tank(float tempTankW, float tempTankH, float tempTankD){
  tankW = tempTankW;        //creator 
  tankH = tempTankH;        
  tankD = tempTankD;
}

void intersect(Mover m){
  if(m.location.x > width-(m.rad/2)){
    tankCr = color(0,100,0); 
  }
  if(m.location.x < 0+(m.rad/2)){
    tankCl = color(0,100,0); 
  }
  if(m.location.y > height-(m.rad/2)){
    tankCz = color(0,100,0); 
  }
  if(m.location.y < 0+(m.rad/2)){
    tankCt = color(0,100,0); 
  }
  if(m.location.z < (-200)+(m.rad/2)){
    tankCb = color(0,100,0); 
  }
}

void display(){
  pushMatrix();
  translate(width/2,height/2,tankD);  //keeps tank centred at 0 z depth
  
   strokeWeight(3);
   stroke(0,200,0);

   beginShape(QUADS);    //back face
   fill(tankCb);
   vertex(-tankW,  -tankH,  tankD);
   vertex(tankW,  -tankH,  tankD);
   vertex(tankW,  tankH,  tankD);
   vertex(-tankW,  tankH,  tankD);
   endShape(CLOSE);
        tankCb = tankC;    //reset colour
   
   beginShape(QUADS);    //top face
   fill(tankCt);
   vertex(-tankW,  -tankH,  tankD);
   vertex(tankW,  -tankH,  tankD);
   vertex(tankW,  -tankH,  -tankD);
   vertex(-tankW,  -tankH,  -tankD);
   endShape(CLOSE);
        tankCt = tankC;    //reset colour
   
   beginShape(QUADS);    //bottom face
   fill(tankCz);
   vertex(-tankW,  tankH,  tankD);
   vertex(tankW,  tankH,  tankD);
   vertex(tankW,  tankH,  -tankD);
   vertex(-tankW,  tankH,  -tankD);
   endShape(CLOSE);
        tankCz = tankC;    //reset colour
   
   beginShape(QUADS);    //left face
   fill(tankCl);
   vertex(-tankW, -tankH,  tankD);
   vertex(-tankW, tankH,  tankD);
   vertex(-tankW,  tankH,  -tankD);
   vertex(-tankW, -tankH,  -tankD);
   endShape(CLOSE);
        tankCl = tankC;    //reset colour
   
   beginShape(QUADS);    //right face
   fill(tankCr);
   vertex(tankW, -tankH,  tankD);
   vertex(tankW, tankH,  tankD);
   vertex(tankW,  tankH,  -tankD);
   vertex(tankW, -tankH,  -tankD);
   endShape(CLOSE);
     tankCr = tankC;    //reset colour
      
  popMatrix();  
  }
}

//------------------------------------------

class Timer{
  int savedTime;   //when the timer started
  int totalTime;    //how long timer should last
  int rtTemp;      //remaining time counter
  
  Timer(int tempTotalTime){
     totalTime = tempTotalTime; 
  }
  
  void start(){            //start timer
     savedTime = millis();    //update var w/ current time
  }
  
  boolean isFinished(){      //check timer has finished
     int passedTime = millis()-savedTime;  //subtract start time from current
     if(passedTime > totalTime){
       return true;
     }else{
       return false;
     }
  }
  
  int timeRemaining(int rtTremp){
    int rt = rtTemp;
    rt = totalTime - millis();
    return rt;
  }
}

//------------------------------------------
  
class Arrows{

Arrows(){    //turns out you CAN have an empty constructor. :\
  
}
  
void drawTriangles(){
  stroke(flashC);      //stroke colour
  strokeWeight(2);
  c = color(0,100,0,0);  //clear flash
  
 pushMatrix(); 
  pushMatrix();        //draw up/down arrows
  translate(25,height/2);
  rotateY(PI/2);
  scale(2);
    pushMatrix();
      translate(0,20);  //up arrow
      rotate(PI);
      beginShape();    
      fill(flashU);
      vertex(0,0);
      vertex(6,0);
      vertex(6,5);
      vertex(8,5);
      vertex(0,10);
      vertex(-8,5);
      vertex(-6,5);
      vertex(-6,0);  
      endShape(CLOSE);
        flashU = c;
    popMatrix();
  
    rotate(PI);    //rotate 180 degs
    pushMatrix();
      translate(0,20); 
      rotate(PI); 
      beginShape();    //Down arrow
      fill(flashD);
      vertex(0,0);
      vertex(6,0);
      vertex(6,5);
      vertex(8,5);
      vertex(0,10);
      vertex(-8,5);
      vertex(-6,5);
      vertex(-6,0);  
      endShape(CLOSE);
        flashD = c;
    popMatrix();
  popMatrix();
  
  translate(width/2,175);  //locate arrows
  rotateX(PI/2);              //rotate onto 'ground' plane
  scale(2);                   //scale arrows
    
  pushMatrix();
    translate(0,20);  //south arrow
    rotate(PI);
    beginShape();    
    fill(flashS);
    vertex(0,0);
    vertex(6,0);
    vertex(6,5);
    vertex(8,5);
    vertex(0,10);
    vertex(-8,5);
    vertex(-6,5);
    vertex(-6,0);  
    endShape(CLOSE);
      flashS = c;
    popMatrix();
  
  rotate(PI/2);    //rotate 90degs
  pushMatrix();
    translate(0,20);  
    rotate(PI);
    beginShape();    //west arrow
    fill(flashE);
    vertex(0,0);
    vertex(6,0);
    vertex(6,5);
    vertex(8,5);
    vertex(0,10);
    vertex(-8,5);
    vertex(-6,5);
    vertex(-6,0);  
    endShape(CLOSE);
      flashE = c;
   popMatrix();
   
  rotate(PI/2);    //rotate another 90degs
  pushMatrix();
    translate(0,20);  
    rotate(PI);
    beginShape();    //north arrow
    fill(flashN);
    vertex(0,0);
    vertex(6,0);
    vertex(6,5);
    vertex(8,5);
    vertex(0,10);
    vertex(-8,5);
    vertex(-6,5);
    vertex(-6,0);  
    endShape(CLOSE);
      flashN = c;
   popMatrix();
   
  rotate(PI/2);    //rotate yet another 90degs
  pushMatrix();
    translate(0,20);  
    rotate(PI);
    beginShape();    //east arrow
    fill(flashW);
    vertex(0,0);
    vertex(6,0);
    vertex(6,5);
    vertex(8,5);
    vertex(0,10);
    vertex(-8,5);
    vertex(-6,5);
    vertex(-6,0);  
    endShape(CLOSE);
      flashW = c;
   popMatrix();
  popMatrix(); 
  }
}    //close class

