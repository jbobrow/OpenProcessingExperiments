
int x = 200;
int y = 200;
int dice = 0;
int inc = 10;
int curvy = 10;

void setup(){
  size(800,400);
  
}

void draw(){
 
  fill(255,1);
  rect(-1,-1,width+1,height+2);
  noStroke(); 
  fill(random(600),random(600),random(600));
    rect(x,y,curvy,curvy,curvy);
  
  if (x >= 200){
  curvy = int(random(10));
 }
 
  dice = int(random(2));
  if(dice == 0){
      x = x + inc;
  }
  else{
      x = x - inc;
  }
  
  dice = int(random(2));
  if(dice == 0){
      y = y + inc;
  }
  else{
      y = y - inc;
  }

if (x <=0||x >=width){
  x=200;
}
if (y <=0 || y > height){
  y=200;
}
  
}


