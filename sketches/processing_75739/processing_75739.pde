

float xCor;
void setup (){
size(800,600);
xCor=200;

}
void draw (){
  background(mouseX,mouseY,30);
  stroke(23,89,255);
    xCor=xCor+2;
  fill(204,100,80,100);
  ellipse(xCor,height/2,mouseX,mouseY);
}

