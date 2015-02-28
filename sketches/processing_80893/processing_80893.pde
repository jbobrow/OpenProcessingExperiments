
int a=20, r=0, d=0, g=0, b=255,q=200, f=10;

void setup(){
  size(400,400);
  frameRate(20);
  background(222,80,100);
}
void draw(){
  fill(d,g,b,q);
  rect(mouseX,mouseY,20,a,r);
  rect(400-mouseX,mouseY,20,a,r);

}

void mousePressed(){
    a=a+5;
    r=r+10;
}

void keyPressed(){
  b=b-20;
  if (b<20){
    d=d+20;
    g=g+20;
    b=b+20;
  }
}

void mouseDragged(){
  stroke(f,g,b,r);
  line(0,0,mouseX,mouseY);
  line(400,400,400-mouseX,400-mouseY);
}

    

  


