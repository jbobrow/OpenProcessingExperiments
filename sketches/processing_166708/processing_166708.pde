
int rad = 350;
float x = 0;
int dim;
float H = 0;
float S = 80;
float B =80;


void setup(){
  size(400,400);
  colorMode(HSB, 360,100,100);
  
  smooth();
  frameRate(20);
  //ellipseMode(RADIUS);
  
}

void draw(){
  background(0);
  H++;

    for(int i =0; i<200; i=i+20){
    fill(H+i,S,B,20);
    rect(width/80,height/80,i+70,i+70);
  }
    
  for(int i =0;i<150;i=i+10){
  fill(H+50,S,B,50);
  ellipse(i+width/2,i+height/2,i,i);
  
  }
  
  for(int i=0;i<300;i=i+50){
    fill(H,S,B,80);
    ellipse(width/2,height/2,i,i);
  }
 
 
}


