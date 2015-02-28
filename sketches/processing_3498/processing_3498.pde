
float g,x=37,y=200;
int w=500;
void setup(){
  size(500,500);
  smooth();
  strokeWeight(1);
  background(255);

}
void draw(){


  noFill();
  rect(0,0,w,w);
  translate(w/2,w/2);
  rotate(28);
  g=map(mouseX,0,w,1,30);
  for(int i=0;i<=100;i++){
    rotate(g);
    stroke(255,100);
    fill(mouseY,0,25,10);
    ellipse(mouseY,mouseX,x,y);
    fill(100,0,mouseX,10);
    ellipse(x,y,mouseX,mouseY);

  }
} 




