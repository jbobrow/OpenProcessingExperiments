
int counter;

void setup (){
   size(500,500);
  background(0,0,255);
}
void draw(){
  strokeWeight(3);
  stroke(0);
  fill(#F7E623);
  ellipse(250,250,150,150);
  fill(255);
  ellipse(200,200,60,60);
  ellipse(300,200,60,60);
  fill(#F7E623);
  arc(width/2, height/2+10,50,50,0,PI);
}

