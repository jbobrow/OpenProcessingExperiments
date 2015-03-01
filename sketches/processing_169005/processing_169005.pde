


float x;
float y;
float t;



void setup(){
  size(500,300);
  background(255);
  //frameRate();
}

void draw(){
  
  // background(255);
  fill(255,150);
  rect(0,0,500,300);
  
  for(int i = 0; i<500; i++){
    
  y = 50*sin(0.05*x)*cos(t) + 150;
  point(x,y);
  
  x++;

  }
  
  if(x>500){
    x=0;
  }
  
  t += 0.2;
}

