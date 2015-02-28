
void setup(){
  size(500, 500);
  smooth();
  background(255);
  noStroke();
  frameRate(30);

}

void draw(){
  fill(255);
  rect(0,0,height,width);
  translate(mouseX,mouseY);
  rotate(radians(frameCount%(360)));
  fill(0);
  
  for(int i=0;i<100;i+=10){
    ellipse(i,-i*i/100,10,10);
    ellipse(-i,i*i/100,10,10);
    ellipse(i*i/100,i,10,10);
    ellipse(-i*i/100,-i,10,10);
    rotate(radians(frameCount%(360)));
    ellipse(-i*i/100-i,i,10,10);
    ellipse(i*i/100+i,-i,10,10);
    ellipse(-i*i/100-i,i,10,10);
    ellipse(i*i/100+i,-i,10,10);
  }
}
