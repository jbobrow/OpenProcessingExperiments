
void setup(){
size(400,400);
background(140);
}
int p=0;
void draw(){
  basichead();
  mouth();
}
void mouseDragged(){
  p+=10;}
  
  void mouseReleased(){
  p=0;}
  
  void basichead(){
    background(125,125,p-150);
    fill(0);
    ellipse(mouseX-20,10+p,15,15);
    fill(0,255,55,p-70);
    ellipse(mouseX,0+p,130,100+p);
  }
  
  void mouth(){
    strokeWeight(2);
    fill(0);
  arc(mouseX, 35+p, 60, p, 0, PI);
  }
  
  void released(){}
