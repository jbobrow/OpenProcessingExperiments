

int nsprings = 300;
MySpring [] s = new MySpring[nsprings];//array of springs

//elastic motion behavior that stimulates elasticity == reversible deformation under stress


void setup() {
  size(700, 700);
  background(0);
  int rad = 50;
  int inc;
  //loop through new class and assign position and s[i].Rx.\
  for(int i=0; i<nsprings; i++){
   inc=0; 
   s[i] = new MySpring();
   //s[i].xpos = rad*cos(2*PI/nsprings*i)+width/2+inc;
   //s[i].ypos = rad*sin(2*PI/nsprings*i)+height/2+inc;
   s[i].xpos=random(width);
   s[i].ypos=random(height);
   s[i].Rx = s[i].xpos;
   s[i].Ry = s[i].ypos;
   }

 }

 void draw() {
   background(0);
   //loop through and implemt elastic motion IF particular nodes are "released"
   for(int i=0; i<nsprings; i++){
     if(s[i].released)
       s[i].move();//calculations!
     fill(250);
     ellipse(s[i].xpos, s[i].ypos , 5,5);
   }
   //connect to next node in array
   for(int i=0; i<nsprings-1; i++){
     stroke(250);
     line(s[i].xpos, s[i].ypos ,s[i+1].xpos, s[i+1].ypos);
   }
   stroke(250);
   line(s[0].xpos, s[0].ypos ,s[nsprings-1].xpos, s[nsprings-1].ypos);
}
 void mouseDragged() {
   for(int i=0; i<nsprings; i++)
     if(dist(mouseX,mouseY,s[i].xpos,s[i].ypos)<10){//if distance less than 1- btwn mouse and node
       s[i].released = false;
       s[i].xpos = mouseX;
       s[i].ypos = mouseY;
   }
 }
 void mouseReleased(){
   for(int i=0; i<nsprings; i++)
     s[i].released = true;
 }

//--------------------------------------------------------------------------------------------------------

class MySpring{
  float M = 1.8; // Mass
  float K = 1.25; // Spring constant or stiffness DERIVED FROM YOUNG's MODULUS
  //1.25 N/cm elastic
  float D = 0.92; // Damping
  
  float Rx = 100; // Rest position
  float Ry = 100; // Rest position
  float xpos; // Position x
  float ypos; // Position y
  float vx = 0.0; // Velocity x
  float vy = 0.0; // Velocity y
  float a = 0; // Acceleration
  float f = 0; // Force
  boolean released = false;
  
  void move(){
    /*
    INPUT: 
    
    k - spring constant 
    M - mass 
    D - Damping factor
    stress = elastic modulus * strain
    1. set force as function of k = spring constant and TENSION FORCE
    2. a = f/m
    3. v = D*(v+a) so velocity + acceleration * damping factor
    4. update position based on acceleration factor
    */
    
    //xpos
    f = -K * (xpos - Rx); // f=-ky f= force, k = spring constant, y = position of spring
    a = f / M; // f= Ma, a = f/M
    vx = D * (vx + a); //d/t + d/t^2 = d*t + d/t velocityx = function of damping factor times addition of velocity acceleration??
    xpos += vx; // Updated x position as function of vx>>D,a>>f>>M,-K
    //ypos
    f = -K * (ypos - Ry); // f=-ky
    a = f / M; // Set the acceleration, f=ma == a=f/m
    vy = D * (vy + a); // Set the velocity
    ypos += vy; // Updated y position
    
    //to reset back to original position
    if(abs(vx)<0.01 && abs(vy) < 0.01) {
      vx = 0.0;
      vy = 0.0;
      released = false;
  }
  }
}

