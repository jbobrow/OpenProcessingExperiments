
float x = 100;
float y = 100;
void setup(){
  size(600,600);
  noStroke();
  noLoop();
  
  y=height*0.5;
  x=width*0.5;
}

  
void draw(){
  background(0);
  ellipse(300,300,x,y);
  x=x-1;
  if(x<0){
    x=width;
  }
  y=y-1;
  if (y<0){
    y=height;
  }
  
}
void mousePressed(){
  loop();
  fill(random(0,255),random(0,255),random(0,255));
  //fill(255);
  
}
