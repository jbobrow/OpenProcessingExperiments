
int mode = 1;
int direction=1;
int directionx;
int directiony;
import processing.opengl.*;

PImage brain;
PImage oldbrain;
PImage tummy;
float x,y,dX,dY,easing,angle,rad,rotateNum;



 
void setup(){
  size(600,600);
    easing = .02;
       x = 0;
  y = 0;
  angle = 0;
    rad = 1;
  direction = +8;
    rotateNum = 0;

  

      
}
 void draw(){
     dX =mouseX -x;
  dY = mouseY -y;
  x = x + dX*easing;
  y = y + dY*easing;
  
    
     if(mode == 1){
    background(0);
float rectSize = 0;
  for (int x = 0; x < width; x+=10){
    for (int y = 0; y < height; y+=10){
      pushMatrix ();
      fill (random(100),random(100),random(255));
      stroke (148,34,280);
      strokeWeight (.6);
      rectSize = sin (x*y) * tan(mouseX*y);
      rect (x,y,rectSize/6,rectSize*5);
      popMatrix ();
      }
       }
        }


     else if(mode ==2){
    background(0);
    mode = 2;
           brain = loadImage( "brain.jpeg");
  oldbrain = loadImage( "oldbrain.gif");
  image(brain,300,300);
  //translate(width/2,height/2);
    
    
    PImage b;
  b = loadImage("brain.jpeg");
   float s = map(second(),mouseX,mouseY,300,300);
  tint(random(255),random(255),random(255));
  image(b,s,0);
    
       x = cos(radians(angle)) *170 + width/2;
  y = sin(radians (angle)); 
  y = map(y,-1,1,0,255);
  fill(y);
directionx =6;
  directiony =6;

  angle++;
      rotate(radians(2));
      float speedX = abs(mouseX-mouseY);
      image(oldbrain,x,y);
  imageMode(CENTER);
  easing = .5;

  
    
  
 }
  else if(mode ==3){
    
   x=cos(radians(angle))*rad+width/2;
  y=sin(radians(angle))*rad+height/2;
  fill(random(255),random(155),random(55));
  ellipse(x,y,100,100);
  angle+=8;
  rad+=direction;
   
  if(rad>360){
    direction=-5;}
    if(rad<0){
      direction=5;}

  }  

 }void keyPressed(){
  if(key == 'q'){
    mode = 1;
    }
   else if(key == 'w'){
           mode = 2;
           }

 else if(key == 'e'){
           mode = 3;
           
  
  angle ++;
}
 }




