
float [] xC; //x position of cricle 
float [] yC; //y position of cricle
int S; //ball size
int N; //number of ball
int R; //RGB = color
int G;
int B;
float speed; //movement
float [] xSpeed; //drop
float [] ySpeed;
float gravity;
boolean fall = false;

void setup(){
  size (400, 400);//campus
  smooth();
  S = 30;
  N = 100;
  R = 180;
  G = 225;
  B = 150;
  speed = 0; //stay at the start point
  gravity = 0.5;
  
  xC = new float[N];
  yC = new float[N];
  
  xSpeed = new float[N];
  ySpeed = new float[N];
  
  for (int i = 0; i< S; i++){
    xC[i] = random(width);
    yC[i] = random(height);
    
    xSpeed[i] = 0;
    ySpeed[i] = 0;
    
  }
}

void draw(){
  background(255, 233, 121);
  strokeWeight(4);
  stroke(R - 100, G, B);
  fill(R-mouseX/2, G-mouseY/2, B);
  
  for (int i = 0; i< N; i++){
    ellipse(xC[i], yC[i], S, S);
    
    if(fall==true){
      yC[i]+= ySpeed[i];
      ySpeed[i]+= gravity; }
      
    if(yC[i]>= height-S){
      ySpeed[i]*=-.7;}
  } 
  
  if(mouseX >= width/2 && mouseY >= height/2){
    for  (int i = 0; i< N; i++){
      xC[i] = random(width);
      yC[i] = random(height);
      }
  }
 if(mouseX <= width/2 && mouseY <= height/2){
   for  (int i = 0; i< N; i++){
     xC[i]--;
     yC[i]--;
      }   
  }
}

void mousePressed(){
  fall = true;
}
