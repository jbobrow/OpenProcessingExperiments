

int nbEllipses = 10;
int smallestDiameter = 100;
float diameterIncrement = 20;
int controlPointOffset;


PImage leaf;
PImage fruit;
PImage bird; 
PImage back;
int change; 

float x, y;
ArrayList positionHistory = new ArrayList();
AngleMeter angleMeter = new AngleMeter(smallestDiameter/2.0);

void setup() {
  size(600,450);
  controlPointOffset = 10;
  back = loadImage("back.jpg");
  noStroke();
 noCursor();
  smooth(); 
  change = 0;
  while(positionHistory.size()<nbEllipses*4){ 
    positionHistory.add(new float[]{
      width/2,height/2,0    }
    );
 
  }
}

void draw() {  
  background(back);
  
  if(change==2){

diameterIncrement = diameterIncrement+0.01;
}
  if(change==3){

diameterIncrement = diameterIncrement-0.01;
if(diameterIncrement<5){
diameterIncrement = 5;}
}
  
    leaf = loadImage("leaf.png");
  fruit = loadImage("fruit.png");
  bird = loadImage("bird.png");
     
   positionHistory.remove(positionHistory.size()-1);
  x = 0.9 * x + 0.1 * mouseX;
  y = 0.9 * y + 0.1 * mouseY;
  angleMeter.drag(x,y);
  positionHistory.add(0,new float[]{
    x,y,angleMeter.angle  }
  );
  
if(mousePressed){
  change = change + 1; 
   
  if(change==1){
  cursor(leaf);
  controlPointOffset = 10;
   }
if(change==2){
cursor(fruit);
controlPointOffset = 10;
}
if(change==3){
cursor(bird);
controlPointOffset = 300;
}
if(change>=4){
      change=0;           
 }
 
 
}


  drawEllipses();
}

void drawEllipses(){
  for(int i = 0; i<nbEllipses; i++){
    int positionIndex = 2* (nbEllipses-1  - i);
    float [] position = (float[])positionHistory.get(positionIndex);
    float majorAxis = smallestDiameter + diameterIncrement * (nbEllipses -1 -i);
    drawEllipse(position, majorAxis, i%2==0 ? #72F502:#FFEA00);
  
 
  }  
}

void drawEllipse(float [] x_y_angle, float majorAxis, int fillColor){  
  fill(fillColor);
  pushMatrix();
  translate(x_y_angle[0],x_y_angle[1]);
  rotate(x_y_angle[2]);
  ellipse(-controlPointOffset, 0, majorAxis, majorAxis * 0.8);
  fill(0);
  ellipse(-controlPointOffset+20, -20, majorAxis * 0.05, majorAxis * 0.05);
   ellipse(-controlPointOffset-20, -20, majorAxis * 0.05, majorAxis * 0.05);
    fill(255);
 triangle(-controlPointOffset-17, 37, -controlPointOffset-20, 0,-controlPointOffset+6, 6);
 triangle(-controlPointOffset+20, 37, -controlPointOffset+20, 18,-controlPointOffset+6, 20);
  fill(#FA9332);
  ellipse(-controlPointOffset, 6, majorAxis * 0.7, majorAxis * 0.5);
  rect(-controlPointOffset-1, -47, 2, 10);
ellipse(-controlPointOffset, -48, majorAxis * 0.1, majorAxis * 0.07);

  popMatrix();
  

  
}


class AngleMeter{
  float [] draggedPoint = new float[2];
  float angle; 
  float distance;
  AngleMeter(float distance){
    this.distance = distance;
  }
  void drag(float x, float y){
    float dx = x - draggedPoint[0];
    float dy = y - draggedPoint[1];
    angle = atan2(dy, dx);  
    draggedPoint[0] = x - (cos(angle) * distance);
    draggedPoint[1] = y - (sin(angle) * distance);
  }
}


