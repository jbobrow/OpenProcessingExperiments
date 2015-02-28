
Tail wiggle;

 float x=35;
 float y=360;
float R;
float G;
float B;
float back=0;
float positionY = 0;
float positionX = 0;
int Timer=20;
int Last=0;
float Y = 0; 
float X = 0; 

float MoveY; // variable that changes in the y to move the red predator ellipse
float MoveX; // variable that changes in the x to move the red predator ellipse
float maxSpeed = 7.0; // variable that sets the maximum speed at which creatures can move
float radius = 10.0; // variable that sets the size of the ellipses
int start;
boolean pScared = false;
void setup() {
  start=second();
  wiggle = new Tail(270);
 Last=second();
  size(800, 400);
  background(100);
  MoveX=random(-maxSpeed+maxSpeed, maxSpeed); 
  MoveY=random(-maxSpeed+maxSpeed, maxSpeed);
  X=random(width-radius); 
  Y=random(height-radius); 

 ellipseMode(RADIUS);
   
  noCursor();
   
}
void draw () {
  if (Timer>0) {
    game();
  }
if (Timer<=0) {
  background (230, 0, 0);
  PFont font; 
font = loadFont("Serif-48.vlw");
          
            textFont(font, 60);
  text ("FAIL", 350, 200);
}
}
void game (){
  if (second()!=Last) {
    Last=second();
    Timer-=1;
  }
  background(100);
  
   int timer = second()-start;
  text(timer, 20, 20);
  wiggle.move();
  wiggle.draw();

X+=MoveX;
  Y+=MoveY;
  if (X>width-radius || X<radius) {
    MoveX=-MoveX;
  }
  if (Y>height-radius ||Y<radius) {
    MoveY=-MoveY;
  }
  
  fill(back, 0, 0); 
  ellipse(X, Y, radius, radius); 

}
 
class Tail {
 
  int length = 20;     
  PVector[] nodes = new PVector[length];
  
  float node_space = 2 + 5; 
  float sway_speed = 0.05 + random(10) / 950;
  float theta;
  float count;
   
  Tail (float initTheta) {
    theta = initTheta;
 for (int n = 0; n < length; n++) {
      nodes[n] = new PVector(height/20, height);
    }
  }
 
  void move() {
         
    float thetaMuscle;
    float dx, dy, d;
 

    nodes[0].x = mouseX;
    nodes[0].y = mouseY;
 
   
    count += sway_speed;
    if(mousePressed==true) {
      
      nodes[1].x = nodes[0].x ;
      nodes[1].y = nodes[0].y ;
    } else {
      nodes[1].x = nodes[0].x ;
      nodes[1].y = nodes[0].y -cos(count) ;
    }


    for (int i = 2; i < nodes.length; i++) {
      dx = nodes[i].x - nodes[i - 2].x;
      dy = nodes[i].y - nodes[i - 2].y;
 
      d = sqrt(dx * dx + dy * dy);
      nodes[i].x = nodes[i - 1].x + (dx * node_space) / d;
      nodes[i].y = nodes[i - 1].y + (dy * node_space) / d;
    }
  if (X>=nodes[19].x-20) {
    if (X<=nodes[19].x+20){
      if (Y>=nodes[19].y){
    if (Y<=nodes[19].y+30){
      if (MoveY==MoveY){
 MoveX=-MoveX;
      MoveY=-MoveY;
  }
  }}}
  }
if (X>=nodes[19].x-20) {
    if (X<=nodes[19].x+20){
      if (Y<=nodes[19].y-25){
        if (Y>=nodes[19].y-30){
          if (-MoveY==-MoveY){
           PFont font; 
font = loadFont("Serif-48.vlw");
            background (255);
            textFont(font, 40);
            fill (0);
            text("Victorious", 350, 100);
            
          X=nodes[19].x;
          Y=nodes[19].y;
          
          /*MoveX=nodes[19].x;
          MoveY=nodes[19].y;*/
          noLoop();
        }}}}}
}
  void draw() {
    pushMatrix();
 
    for (int i=1; i<length; i++) {
      stroke(255);
      line(nodes[i].x, nodes[i].y,
      nodes[i].x, nodes[i].y);
    }
    
    fill(0, 0, 0);
    rect(nodes[19].x, nodes[19].y, 30, 15);
 
    popMatrix();
  }
}


