
//dan 05:12 10/10/2011

int ellipseSize=1;
float rom=0;
float x;
float y;
void setup(){
size(400,400);
}

void draw() {
  smooth();
  background(231,242,213,10);
  strokeWeight(ellipseSize*random(0.1,0.12));
  stroke(5,242,155,60);
  fill(5,242,155,80);
  if(mousePressed) ellipseSize++;
  pushMatrix();
  translate(width/2,height/2);
  rotate(ellipseSize);
  ellipse(5,5,ellipseSize,ellipseSize);
  popMatrix();
  rom=random(1,5);
  fill(124,5,242);
  for(int i=0;i<=ellipseSize/5;i++) {
    x=width/2+random(-ellipseSize/2,ellipseSize/2);
    y=width/2+random(-ellipseSize/2,ellipseSize/2);
    if(dist(x,y,width/2+5,height/2+5)< ellipseSize/2){
    ellipse(x,y,rom,rom);
  }
  }
}
