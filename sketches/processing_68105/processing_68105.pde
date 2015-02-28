

int a=0;
int x=0, y=0;

void setup(){
  size(400,400);
  smooth();
  stroke(255,255,0);
  background(255);
  frameRate(3);
}

void draw(){
  background(255);
  
    
  if(a==0){
    fill(255,255,0);
    arc(100+x,100+y,100,100,0,2*PI);
    a++;
  }
  else{  
    fill(255,255,0);
    arc(100+x,100+y,100,100,QUARTER_PI,PI+HALF_PI+QUARTER_PI);
    a--;
  }
  
  fill(0,0,0);
  arc(110+x,70+y,10,10,0,2*PI);
  x+=4;
  
}


