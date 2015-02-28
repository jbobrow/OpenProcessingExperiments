
//A2-12: Redo A2-05 using object oriented programming (i.e., define and demonstrate a Pentagon class)

/* Made By: Naghmi Shireen
 Dated: 19 oct, 2010*/
 

 // i have used the concept of spring, and damp from physics
 //my  three pentagons, move like springs, whenever the mouse moves
 
 
int points=5; // if you just change this number the number of corners of pentagons are gona increase accordingly
float centerX, centerY;
float[] xpos=new float[points]; //an array to store x-values of five points of pentagon
float[] ypos=new float[points]; //an array to store y-values of five points of pentagon

float radius=45; // radius of the pentagon

//three variables of Pentagon Class
Pentagon myPentagon1;
Pentagon myPentagon2;
Pentagon myPentagon3;




void setup(){
  size(400,400);
  background(255);
  frameRate(30);
 centerX=width/2; centerY=height/2;
 // all three pentagons have same center position but they have varying radii and 
  myPentagon1=new Pentagon( centerX,centerY,radius, points);
  myPentagon2=new Pentagon( centerX,centerY, radius-20,points);
  myPentagon3=new Pentagon( centerX, centerY,radius+15, points);
 }


void draw(){
  background(100);
  strokeWeight(1);
  noStroke();

  fill(220,90,150,100);
  myPentagon1.drawPentagon();//to create one pentagon
  myPentagon1.movePentagon();// calling move function of class pentagon
  
  fill(120,200,190,80);
  myPentagon2.drawPentagon(); //to create second pentagon
  myPentagon2.movePentagon();// calling move function of class pentagon
  
  fill(180,70,240,100);
  myPentagon3.drawPentagon(); //to create third pentagon
  myPentagon3.movePentagon();// calling move function of class pentagon



}


//method declaration

class Pentagon {
  float cenX;
  float cenY;
  float rad;
  float numNodes;
  float acceX, acceY; // these will accelerate the pentagons towards the mouse position
  float rotAngle=-90; // initial angle is -90, as the screen rotates, with radius, a new point of the pentagon will be marked
  
  Pentagon( float tempCenterX, float tempCenterY, float tempRadius, float tempNodes){
    cenX= tempCenterX;
    cenY=tempCenterY;
    rad=tempRadius;
    numNodes=tempNodes;
  }

void drawPentagon(){

 //this for loop will mark five points of pentagon, depending upon, center point, radius, and acceleration movement
 //every time the pentagon moves these five points willchange their position accordingly
 //float rotAngle=-90;
  for (int i=0; i<numNodes; i++){
    xpos[i] = cenX+cos(radians(rotAngle))*rad+acceX;
    ypos[i] = cenY+sin(radians(rotAngle))*rad+acceY;
    ellipse(xpos[i],ypos[i],20,20);
    rotAngle += 360.0/numNodes;
  }
  
  
  //this set of instruction will now connect those five points[previously marked] through begin and endShape() methods 
  beginShape();
   for (int i=0; i<numNodes;i++){
    vertex(xpos[i],ypos[i]);
   }
   endShape(CLOSE);
}

//method declaration

float dampingFactor=0.9; //damping factor, to slow down the quick spring motion gradually, it will be used when the pentagons will move with mouse movement
float springFactor=0.09; // spring factor, which will make the pentagons move "to and fro" like springs for some time, whenever mouse moves


void movePentagon(){
   
    float newX=mouseX-cenX; //a new positions are stored according to mouse current position
    float newY=mouseY-cenY;

  
  newX*=springFactor; // those new positions are then multiplied by a spring factor
  newY*=springFactor;
  
  acceX+=newX; //then after springing,they are being accelerated
  acceY+=newY;
  
  cenX+=acceX; // and a new target center point is being marked
  cenY+=acceY;
  
  acceX*=dampingFactor; //acceleration is damped a little to make the springing effect slow after some time
  acceY*=dampingFactor;
  
  
}
}
