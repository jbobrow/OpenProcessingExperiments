
void setup(){

  size(800,400);
}

void draw(){
  for(int x=0;x<800;x=x+50){
  myMountain(x,x+50);
  }
  
  for(int y=0;y<100;y=y+10){
    mySun(y,y);
  }
}

void mySun(int a,int b){
  noStroke();


  fill(255,255,mouseX,30);
  ellipse(mouseX,mouseY,a,b);
}
  

void myMountain(int a,int b){

  fill(mouseX,255,0);
  triangle(a,300,a-50,400,b,400);
}


    
