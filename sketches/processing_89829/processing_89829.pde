
int i=0,j=1;
void setup(){
  size(200,200);
  background(0);
}

void draw(){
  rectMode(CENTER);
  rect(100,100,20,20);
  if((mouseX-width/2>10||width/2-mouseX>10)||(mouseY-height/2>10||height/2-mouseY>10))
  dlrq(30,40);
}

void dlrq(int x,int y){
  i=i+j;
  rectMode(CORNER);
  rect(i,i,x,y);
  ellipseMode(CORNER);
  ellipse(i,i,x,y);
  line(i,i,x+i,y+i);
  if(i<0||i>width-x||i>height-y)
  j=-j;
}

