
int x = 0;
int y = 0;

void setup(){
  size(800,600);
  
}

void draw(){
  
int rotate = 0;

while(rotate<375)
  {
  noFill();
  stroke(0, 0, 0);
  bezier(400-rotate, 0, 200-rotate, 300-rotate, 100+rotate, 100-rotate, 0, 300-rotate);
  bezier(800-rotate, 0, 500-rotate, 600-rotate, 100+rotate, 300-rotate, 0, 600-rotate);
  bezier(600+rotate, 0, 300+rotate, 100+rotate, 600+rotate, 500-rotate, 0, 800-rotate);
  rotate = rotate + 10;
  }
  
while(x<800){
  noStroke();
  fill(random(0,255),random(0,255));
  rect(0+x, 0, 10 , 600);
  x = x + 15;
  }
  
}


