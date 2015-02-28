


void setup(){
  size(500,500);
  background(255);
  ellipseMode(CENTER);
  noLoop();
  
}


void draw(){
  strokeWeight(2);
  stroke(224,224,224, 100);
 
  for (int r = 0; r < 2; r++){
  for(int i = 0; i < 36; i++){
    int param = i * 10 + 180;
    for(int x = 0; x < 10; x++){
    if(x <= 5){
    strokeWeight(x * .8);
    stroke(104,164,164, x * 10);
    line(250,350, getX(250,100,param + x), getY(250,100,param + x));
    }else{
      strokeWeight(x * .8);
      stroke(104,164,164, (x- (x - 5)) * 10);
      line(250,350, getX(250,100,param + x), getY(250,100,param + x));
    }
    }
  }


    

  }

  

  
}

float getX(int center, int radius, float deg){
  return center + cos( radians(deg)) * radius;
}
 
 
float getY(int center, int radius, float deg){
  return center + sin( radians(deg)) * radius;
}

