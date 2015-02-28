
//Copyright Christopher Henley 2014



void setup(){
  size(400,400);
  background(0);
  noStroke();
}

void draw(){
  fill(0,200,0);
  circle(200,200,100);
  color col=color(200,200,0);
  circle(300,200,50,col);
  noLoop();
}

void circle(float x,float y,float diam){
  ellipse(x,y,diam,diam);
}

void circle(float x,float y,float diam,int c){
  fill(c);
  ellipse(x,y,diam,diam);
}


