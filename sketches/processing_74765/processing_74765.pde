
int bord=30;
int d=80;
int ed=10;
int dir=3;
int dir1=-3;
int x,y,x1,y1;

void setup(){
  size (400,400);
  x=width/2;
  x1=width/2;
}
void draw(){
  background(0);
  strokeWeight(3);
  stroke(0,255,255,95);
  line(x,bord,x1,bord+d);
  line(x1,bord+d,x,bord+d*2);
  line(x,bord+d*2,x1,bord+d*3);
  line(x1,bord+d*3,x,bord+d*4);
  
  noStroke();
  fill(0,200,200,95);
  ellipse(x,bord,ed,ed);
  ellipse(x1,bord+d,ed,ed);
  ellipse(x,bord+d*2,ed,ed);
  ellipse(x1,bord+d*3,ed,ed);
  ellipse(x,bord+d*4,ed,ed);
  
  if(mousePressed){
    x=x+dir;
    x1=x1-dir;
    if(x>width-width/3 || x<width/3){
      dir=-dir;
      
    }
  }

}
