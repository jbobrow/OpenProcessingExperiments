
// Simple Motion Physics II
int shapes=100;
float[] w=new float[shapes];
float[] h=new float[shapes];
float[] x=new float[shapes];
float[] y=new float[shapes];
float[] xSpeed=new float[shapes];
float[] ySpeed=new float[shapes];
float[] gravity=new float[shapes];
float[] damping=new float[shapes];
float[] friction = new float[shapes];
float wind;
boolean record;

//controlsraterectsareborn
float shapeCount;
float birthRate=10;
//controlwidthofspraywhenrectsareborn
float sprayWidth=5;
float springing = .01;
  float deltaX;
  float deltaY;

void setup() {
  size(400, 600);
  //noStroke();
  stroke(0, 50);
  //initialize arrays with random values

}
void draw() {
  //fadebackground
  fill(255, 50);
  rect(0, 0, width, height);
  fill(0, 50);
  // shapeCount births rects over time
  
  deltaX = -(pmouseX - mouseX);
  deltaY = -(pmouseY - mouseY);
  
  deltaX *= 0.2;
  deltaY *= 0.2;
  

  
  for (int i=0; i<shapeCount; i++) {
    ellipse(x[i], y[i], w[i], h[i]);
    x[i]+=xSpeed[i];
    
    ySpeed[i]+=gravity[i];
    y[i]+=ySpeed[i];
    //collisiondetection
    if (y[i]>=height-h[i]) {
      y[i]=height-h[i];
      // bounce
      ySpeed[i]*=-1.0;
      //slowdownverticalmotion on ground collision
      ySpeed[i]*=damping[i];
      //slowdownlateralmotionongroundcollision
      xSpeed[i]*=friction[i];
    }
    if (x[i]>=width-w[i]) {
      x[i]=width-w[i];
      xSpeed[i]*=-1.0;
    }
    if (x[i]<=0) {
      x[i]=0;
      xSpeed[i]*=-1.0;
      xSpeed[i]*= damping[i];
    }
  }
  if (shapeCount<shapes) {
    shapeCount+=birthRate;
  }
  
  if (record == true){
  // saveFrame("1/output-####.gif"); 
  }
}

void keyPressed(){
 if(record == false){
   record = true;
 }else{
   record = false;
 }
}

void mouseReleased(){
 start(); 
}

void start(){
   for (int i=0; i<shapes; i++) {
     y[i] = mouseY;
    x[i]= mouseX;
    w[i]=5;
    h[i]=w[i];
    xSpeed[i]=random(deltaX-3, deltaX+3);
    ySpeed[i] = random(deltaY-3, deltaY+3);
    gravity[i]=.1;
    damping[i]=random(.4, .7);
    friction[i]=random(.65, .95);
  } 
}



