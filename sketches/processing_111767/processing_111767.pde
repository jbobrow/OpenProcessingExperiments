
float x=0;
float y=0;
float z=0;




void setup(){
  size(600,600);
  frameRate(60);
  smooth();
  background(255);
}

void draw(){
  
  float r = random(0,255);
  float g = random(0,255);
  float b = random(0,255);
  float a = random(200,255);
  color c= color(r,g,b,a);
  
  fill(0,10);
  rect(0,0,width,height);
 
  noFill();
  
  x=x+0.6;
  y=sin(x);
  z=random(2.00);
  
  stroke(c);
  strokeWeight(z);
  
  ellipse(width/2,height/2,y*600 ,y*600);
  ellipse(width/4,height/4,y*400 ,y*400);
  ellipse(width/4,height*3/4,y*400 ,y*400);
  ellipse(width*3/4,height*3/4,y*400 ,y*400);
  ellipse(width*3/4,height/4,y*400 ,y*400);
}
