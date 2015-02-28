
Circle[] circles;

void setup(){
  size(800,800);
  smooth();
  background(160,160,160);
  strokeWeight(2);
  //colorMode(HSB,360,100,100,100);
  circles=new Circle[100];
  for(int i=0;i<circles.length;i+=5){
    circles[i]=new Circle(random(width),random(height),random(-5,5),random(-5,5));
  }
}

void draw(){
  fill(75,24,4,1);
  rect(0,0,width,height);
  stroke(64,32,1,99);
  fill(160,160,160,80);
  for(int i=0;i<circles.length;i+=5){
  circles[i].move();
  circles[i].displayC();
  if(mousePressed){
    fill(160,160,160);
  rect(0,0,width,height);}
  }
}

  class Circle{
    float x,y,speedX,speedY,dir,dir2,angle,angle2;
    Circle(float _X,float _Y,float _speedX,float _speedY){
      x=_X;
      y=_Y;
      dir=0;
      dir2=1;
      angle=0;
      angle2=1;
      speedX=_speedX;
      speedY=_speedY;
    }
    
    void move(){
      dir+=dir2;
      angle+=angle2;
      x+=speedX/2*cos(radians(angle/2));
      y+=speedY/2*sin(radians(angle*cos(radians(angle/2))));
    }
    void displayC(){
      dir+=dir2;
      float ellsize = (mouseX-x)/2;
      float ellsize2 = (mouseY-y)/2;
      ellipse(x,y,ellsize/2/dir*2,ellsize2/2/dir*2);
      if(dir>200){
        dir2=-1;}
        if(dir<0){
          dir2=1;}
          

    }
  }

