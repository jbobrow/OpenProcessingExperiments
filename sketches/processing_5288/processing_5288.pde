
class Birth{
  float i;
  int x;
  int y;
  float d_i;
  float d_x;
  float d_y;
  float speed;
  Birth(float xi){
   i=-round(xi);
  x=round(xi);
  speed=xi/100;
  y=-6;
  }
  void move(){
  i++;
  fill(255);
  noStroke();
  if(i<100){
    ellipse(x,y+i/10,15-i/30,5+i/30);
  }else if (y+i*5-500+speed*(i-100)>280){
    d_i++;
    d_x=d_i;
    d_y=5*sin(d_x/5);
    if (d_x<46){
      fill(255);
      ellipse(x+d_x,280+d_y+d_i/6,4,4);
      ellipse(x-d_x,280+d_y+d_i/6,4,4);
    }
    
  }else{
    ellipse(x,y+i*5-500+speed*(i-100),2+i/100,5+i/10);
  }
 
  }
}

