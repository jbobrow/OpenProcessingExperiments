
float radius=100;
float x;
float y;

void setup(){
  size(500,500);
  smooth();
  background(255);
  strokeWeight(2);
   noLoop();//comment out
}

void draw(){
    translate(width/2,height/2);
    for (float ang=0;ang<=360;ang+=5){//change ang increment
    //radius+=1.5; 
    float rad=radians(ang);
  
  x=radius*cos(rad);
  y=radius*sin(rad);
  point(x,y); 
  radius=radius-.05; //works better with looping.  
  }
  
}
