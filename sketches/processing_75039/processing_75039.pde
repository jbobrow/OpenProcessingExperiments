
int col=10;
int al=245;
int d=50;
void setup(){
  size(400,400);
}
void draw(){
  stroke(0,-al);
  fill(0,col,0,al);
  ellipse(0,0,d,d);
  fill(col,0,col,al);
  ellipse(0,height,d,d);
  fill(0,col,col,al);
  ellipse(width,0,d,d);
  fill(col,col,0,al);
  ellipse(width,height,d,d);
  fill(col,col,col,al);
  ellipse(width/2,height/2,d,d);
  
  if(mousePressed){
    col=col+1;
    al=al-1;
    d=d+1;
  }
  
  
}
