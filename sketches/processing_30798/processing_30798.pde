


// spinning lines
// s.monslow  2011
int w,h;
float space,i;

void setup(){
  size(400,400);
  smooth();
}


void draw(){
 
  fill(0,11);
  rect(0,0,width,height);
  w = width;
  h = height;
  translate(width/2,height/2);
  stroke(255);
  for  (int x=0;x<w;x+=1+space){
    rotate(i);
    line(x,0,x,h);
    rotate(i);
    line(x,0,x,h);
    rotate(i);
    line(0,x,w,x);

  }
i+=0.01;
    space = mouseX/4;
}
                
                
