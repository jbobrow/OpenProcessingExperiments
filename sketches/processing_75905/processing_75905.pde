
float x,y,angle;

void setup(){
  size(600,600);
  x=0;
  y=0;
  angle=0;
}

void draw(){
  if(angle>0 && angle<90){
    background(255,0,0);
  }else if(angle>90 && angle<180){
    background(0,255,40);
  }else if (angle>180 && angle<270){
    background(255,248,0);
  }else if(angle>270 && angle< 360){
    background(0,45,255);
  }else if(angle>360){
    angle=0;
  }
  fill(255);
  ellipse(300,300,280,280);
  fill(0,70,185);
  ellipse(300,300,150,150);
  fill(5,5,5);
  ellipse(300,300,50,50);
  
  x=200*cos(radians(angle));
  y=200*sin(radians(angle));
  fill(255);
  ellipse(x+width/2,y+height/2,150,150);
  angle++;
  x=200*cos(radians(angle));
  y=200*sin(radians(angle));
  fill(0,70,185);
  ellipse(x+width/2,y+height/2,60,60);
  x=200*cos(radians(angle));
  y=200*sin(radians(angle));
  fill(5,5,5);
  ellipse(x+width/2,y+height/2,20,20);
  angle++;
  println(mouseX);
  println(mouseY);
}

