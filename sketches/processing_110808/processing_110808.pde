
// Windmill Sketch 

//mouse controls speed of windmill along x-axis

float r = 0; 
float speed = 0; 
float slowdownSpeed = 0.1;


int ellSize= 8;
int drops = 10;
float [] xpos= new float[drops];
float [] ypos= new float[drops];
float [] xspeed= new float[drops];
float [] yspeed= new float[drops];


void setup() {
  size(400, 400);
  for(int i=0; i<10; i++) {
    xpos[i]= random(ellSize, width-ellSize);
    ypos[i]=random(ellSize, height-ellSize);
    xspeed[i]=random(2, 4);
    yspeed[i]=random(2, 4);
  }
  //mapX=map(x,100,300,-50,50);
  //mapY=map(y,400,500,-50,50);
}


void draw() {

  
 
  
  PImage windmillBackground = loadImage("resizedwindmillbg.jpg");
  image(windmillBackground, 0, 0);
  //background(windmillBackground);
  
  //rectMode(CENTER);
  pushMatrix();
  translate(width/2, (height/2)); 
  fill(255);
  rect(-5, 0, 9, 180);
  rotate(radians(r+=speed)); 
  //println(r);
  //println(speed);
  triangle(0, 0, 0, -20, -70, - 70); 
  triangle(0, 0, 0, 20, 70, 70);
  popMatrix();
  

  stopWindmill();
  
  
  if(speed==0){
  for(int i=0; i<drops; i++){
    xpos[i] +=xspeed[i];
    ypos[i] +=yspeed[i];
      if(xpos[i] < ellSize/2 || xpos[i] > width-ellSize/2){
       xspeed[i]*=-1;
      }
      if(ypos[i] < ellSize/2 || ypos[i] > height-ellSize/2){
      yspeed[i]*=-1;
      }
  }
    for(int i=0; i<drops; i++){
       ellipse(xpos[i], ypos[i], ellSize,ellSize);
    }
  }
  
  else if(speed>0){
  for(int i=0; i<drops; i++){
    xpos[i] +=xspeed[i];
    ypos[i] +=yspeed[i];
    

      if(xpos[i] < ellSize/2 || xpos[i] > width-ellSize/2){
       xspeed[i]*=-1;
      xpos[i] = random(0,2)+1;
      }
      if(ypos[i] < ellSize/2 || ypos[i] > height-ellSize/2){
      yspeed[i]*=-1;
      ypos[i] =random(0,400)+1;
      }
  }
    for(int i=0; i<drops; i++){
       ellipse(xpos[i], ypos[i], ellSize,ellSize);
    }
  }
  
  else if(speed<0){
  for(int i=0; i<drops; i++){
    
    xpos[i] +=xspeed[i];
    ypos[i] +=yspeed[i];
      if(xpos[i] < ellSize/2 || xpos[i] > width-ellSize/2){
       xspeed[i]*=-1;
       xpos[i] = random(width-4,width-2)+1;
    
      }
      if(ypos[i] < ellSize/2 || ypos[i] > height-ellSize/2){
      yspeed[i]*=-1;
      ypos[i] =random(0,400)+1;
      }
  }
    for(int i=0; i<drops; i++){
       ellipse(xpos[i], ypos[i], ellSize,ellSize);
    }
  }
  
}



void mouseMoved() {
  speed = (mouseX-pmouseX);
  speed = map(speed, -100, 100, -50, 50);
}


void stopWindmill() {
  if (speed >= slowdownSpeed) {
    speed = speed - slowdownSpeed;
  } 
  else if (speed<=-(slowdownSpeed)) {
    speed = speed + slowdownSpeed;
  }
  else {
    speed = 0;
  }
}



