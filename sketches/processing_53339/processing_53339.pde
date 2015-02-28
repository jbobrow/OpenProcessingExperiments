
int x;
boolean loopState = true;

void setup(){
  size(800,300);
  smooth();
  x = 2;
  strokeWeight(x);
}

void draw(){
  for(int i = 0;i<width;i+=x){
    stroke(random(255),0,0,random(255));
    line(i,0,i,99);
  }
  for(int j = 0;j<width;j+=x){
    stroke(0,random(255),0,random(255));
    line(j,100,j,199);
  }
  for(int k = 0;k<width;k+=x){
    stroke(0,0,random(255),random(255));
    line(k,200,k,height);
  }
}

void mousePressed(){
  if(loopState){
    noLoop();
    loopState = false;
  }else{
    loop();
    loopState = true;
  }
}
