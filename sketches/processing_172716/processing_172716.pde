
void setup(){
  size(760,760);
  background(random(250),random(250),random(255));
}
int a=0;
void draw(){
  strokeWeight(10);
  stroke(random(0),random(0),random(255));
  for(int a = 0; a<1000; a = a+1)
  {
    point(a,0);
    point(0,a);
    point(a,760);
    point(760,0);
  }
  int c=0;
  while(c<760){
    strokeWeight(5);
    point(0+c,0+c);
    c=c+2;
  }

}
void keyPressed(){
  background(donothing(255),random(255),random(255));
}
void mousePressed(){
  fill(255);
  strokeWeight(1);
  stroke(random(255),random(255),random(255));
  ellipse(mouseX,mouseY,50,50);
  ellipse(mouseY,mouseX,50,50);
}

float donothing(int v)
{ 
  if( v<800)
  {
    return v;    
  }
  else return(random(255));
}




  

