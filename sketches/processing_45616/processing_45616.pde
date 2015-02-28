

float x,y,z,angle;




void setup(){
  size (1000,700);
  x=0;
  y=0;
  angle=0;
  z=1;
  background(255);
  smooth();
}

void draw(){

  float ellSize=0;
  for (int z =0; z< width/4;z+=10){
    for (int v = 0;v < height/4;v+=10){
      ellSize= sin(z*v)*10; //tan(z/2*v/2);
      fill(234,23,90);
      rect(x,y,ellSize,ellSize*2);
 
  x=cos(radians(angle))*angle/4+width/2;
  y=sin(radians(angle))*angle/4+height/2;
  ellipse(x,y,ellSize,ellSize); 
  angle++;
  
  fill(x);
  //ellipse(width/2,height/2,350,350);
}
  }
}


