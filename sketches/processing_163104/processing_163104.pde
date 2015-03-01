
float delta=3;
float r = 200, maxR=200;
int colortype=0;
void setup(){
  size(600,600,P3D);
  
}

void draw(){
  background(0);
  
  translate(width/2, height/2,0);
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));
  
  if(mousePressed){
    colortype = (int)random(0,7);
  }
  
  maxR=mouseX;
  for(float z=0; z<300;z+=15){
    for(float deg=0; deg<360; deg+=delta){
      switch(colortype){
        case 0:
          stroke(255-r,255-r,255-r);
          break;
        case 1:
          stroke(0+r,255-r,255-r);
          break;
        case 2:
          stroke(255-r,0+r,255-r);
          break;
        case 3:
          stroke(255-r,255-r,0+r);
          break;
        case 4:
          stroke(0+r,0+r,255-r);
          break;
        case 5:
          stroke(255-r,0+r,0+r);
          break;
        case 6:
          stroke(0+r,255-r,0+r);
          break;
        case 7:
          stroke(0+r,0+r,0+r);
          break;
      }        
      strokeWeight(random(1,2));
      float theta = radians(deg);
      float x= r * cos(theta);
      float y = r * sin(theta); 
      point(x,y,z);
      if(r==0){
        r=maxR;
      }
      else{
        r--;
      }
    }
  }
}
