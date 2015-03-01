

  float x,y;
  int box = 10;
  int crange = 15;
  float r,g,b;
  
  
void setup(){
  size(640,360);
  background(0);
  
  frameRate(60);
  
  x= random(box,width-box);
  y= random(box,height-box);
  r= random(0,255);
  g= random(0,255);
  b= random(0,255);

}

void draw(){
  
  x= constrain(random(x-box,x+box),box,width-box);
  y= constrain(random(y-box,y+box),box,height-box);
  r= constrain(random(r-crange,r+crange),0,255);
  g= constrain(random(g-crange,g+crange),0,255);
  b= constrain(random(b-crange,b+crange),0,255);
    
  noStroke();
  fill(r,g,b,200);
  
  println(r,g,b); 
  
  ellipse(x,y,15,15); 
}


