
int mode=1;

void setup(){
  size(600,600,P3D);
  frameRate(60);
}
 
void draw(){
  int abst=30;
  background(0);
  lights();

  if(frameCount%2==0){
    camera(abst,0,500,
           0,0,0,
           0,1,0);
    if(mode==0){
      noFill();
      stroke(155,0,0);
    }
    else{
      noStroke();
      fill(125,0,0);
    }
  }
  
  else{
    camera(-abst,0,500,
           0,0,0,
           0,1,0);
    if(mode==0){
      noFill();
      stroke(0,0,255);
    }
    else{
      noStroke();
      fill(0,0,255);
    }
  }
  rotateY(frameCount*PI/220);
  rotateX(frameCount*PI/360);
  box(150,150,450);
}

void keyPressed(){
  if (mode==1){
    mode=0;
  }
  else{
    mode=1;
  }
}

