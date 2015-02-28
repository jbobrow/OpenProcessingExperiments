
//DORAHAN ARAPGIRLIOGLU
//FUNCTIONS - MODES - TRIG
 
float angle;
float radius;
int mode=0;
//boolean rickjames=false;
 
void setup(){
  size(600,600);
  angle = 0;
  smooth();
  radius=20;
}
 
void draw(){
 /* if (mousePressed){
    rickjames=true;
  } else {
    rickjames=false;
  }
   
  //mouse pressed - mode
  if (rickjames=true){
    mode==1;
  } else {
    mode==0;
  }
   
 \
  if (mousePressed){
    mode=1;
  } else {
    mode=0;
  }
  */
  fill(255,255,255); 
  text ("change modes - mouse click",30,30); 
     
  //FUNCTIONS - MODES
  if (mode==0){
    goldenRatio();
  } else {
    if (mode==1){
      circlesss();
    }
  }
     
 
 
}
 
void goldenRatio(){
  float bgcolor = abs(255*sin(radians(angle)));
  //background(bgcolor);
  fill(300*sin(radians(angle)),random(0,255),random(0,255));
  noStroke();
  float x = radius*cos(radians(angle));
  float y = radius*sin(radians(angle));
   
  radius+=.3;
   
  ellipse(x+width/2,y+height/2,random(200),random(200));
  angle+=137.5;
 
 
}
 
void circlesss(){
    
  float bgcolor = abs(255*sin(radians(angle)));
  //background(bgcolor);
  fill(random(255),random(255),random(255));
  noStroke();
  float x = random(200)*cos(radians(angle));
  float y = 300*sin(radians(angle))*cos(radians(angle/13))*sin(radians(angle*5));
   
  ellipse(x+width/2,y+height/2,random(20),random(20));
  angle+=random(0.4);
   
}
 
void mouseReleased(){
  if (mode==0){
    mode=1;
  } else {
    mode=0;
  }
}


