
class gravity_dive{
  float x=random(width);
  float y=random(height);
  float theta=random(TWO_PI);
  float tc=random(-0.01,0.01);
  float rad=random(0.5,2);
  
  gravity_dive(){
    //nothing
  }
  
  void trail(){
    if(random(100)>99){
      rad+=0.001;
    }else{
      rad-=0.001;
    }
    
    theta+=tc;
    x+=rad*cos(theta);
    y+=rad*sin(theta);
    
    while (x<0) {
      x+=width;
    } 
    while (x>=width) {
      x-=width;
    }
    while (y<0) {
      y+=height;
    } 
    while (y>=height) {
      y-=height;
    }
  }
}

