
int s=0;
float x=0;
float y=0;
float z=0; 
float v = 5; 

void setup(){
  size(700,500);
  fill(255);
  frameRate(8);
  smooth();
}

void draw(){
  background(0);  
  x+=v;
  if(z>725){
  x=0;}
  
  if(s==0){
    fill(255,255,0);
    arc(x,250,100,100,0.47,5.81);
    fill(0);
    arc(x,223,10,10,0,TWO_PI);
    
    fill(157,39,193);
    arc(y=x-120,260,80,80,0.47,5.81);
    fill(0);
    arc(y=x-120,240,7,7,0,TWO_PI);
    
    fill(33,187,732);
    arc(z=x-215,270,50,50,0.47,5.81);
    fill(0);
    arc(z=x-215,260,3,3,0,TWO_PI);
    s=1;
  }
  else{
    fill(255,255,0);
    arc(x,250,100,100,0,TWO_PI);
    fill(0);
    arc(x,223,10,10,0,TWO_PI);
    
    fill(157,39,193);
    arc(y=x-120,260,80,80,0,TWO_PI);
    fill(0);
    arc(y=x-120,240,7,7,0,TWO_PI);
    
    fill(33,187,232);
    arc(z=x-215,270,50,50,0,TWO_PI);
    fill(0);
    arc(z=x-215,260,3,3,0,TWO_PI);
    s=0;
  }
  

}

