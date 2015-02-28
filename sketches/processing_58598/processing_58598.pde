
int c,d,x,y;
void setup(){
  size(800,800);
  smooth();
  c=0;
  d=0;
  x=0;
  y=0;
}

void draw(){
  fill(mouseY,mouseX,100,10);
  rect(x,y,width,height);
  c++;
  if(c>200){
    d=0;
  }
  if(d>300){
    x=100;
  }
  if(x> 100){
    y= 50;
  }
  if (y>150){
    c = 0;
  }
  noFill();
  strokeWeight(.2);
  stroke(sin(millis()));
  ellipse(width/2,height/2,mouseY,mouseX);
  ellipse(x,y,c,mouseX);
  ellipse(y,x,d,mouseY);
}

void mouseClicked(){
  if(d==0){
    d =100;
  } else {
    d = 400;
  }
}

void mouseDragged(){
  if (c>100){
    d=0;
  }
}
    
    
    


