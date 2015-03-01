
int rad = 350;
float x = 0;
int dim;
float H = 150;
float S = 90;
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

  for(int i =0;i<150;i=i+10){
  fill(H,S+50,B,50);
  ellipse(i+width/2,i+height/2,i,i);
  
  }
  
  for(int i=0;i<350;i=i+50){
    fill(H,S+75,B,20);
    ellipse(width/2,height/2,i,i);
  }
 
 
}


