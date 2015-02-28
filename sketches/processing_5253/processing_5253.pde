
int x=0;
int speed=1;
int y=0;
int speed2=3;
int r;
int trans=50;
void setup(){
  size(600,400);
  smooth();
}

void draw(){

  fill(0,0,0,trans);
  noStroke();
  rect(0,0,width,height);
  noFill();
  
  x=x+ speed;
  y=y+speed2;
  
 if((x>width)|| (x<0)){

    speed=speed*-1;
  }

  if((y>height)|| (y<0)){

    speed2=speed2*-1;
  }
  if(mousePressed){
    r=r+1;
  }

  else{
    r=r-1;
  }
  
  
  if(mousePressed){
    trans=trans-1;
  }
  else{
    trans=trans+1;
  }

  stroke(140,r/2,r/4);
  line(x,y,0,height);
  line(width,0,x,y);
  bezier(0,0,x,y,x,y,width,0);
  bezier(0,height,x,y,x,y,width,height);
  bezier(0,height/2,x,y,x,y,width,height/2);
  bezier(0,height,x,y,x,y,0,0);
  bezier(width,0,x,y,x,y,width,height);

  r=constrain(r,200,254);
  trans=constrain(trans,10,49);
}



