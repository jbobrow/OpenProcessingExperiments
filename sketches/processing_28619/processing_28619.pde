




void setup(){
  size(400,400);
  smooth();
    background(255, 204, 0);
}

void draw(){

  noFill();

stroke(155,155,155,10);

bezier(0,mouseX,-mouseY,mouseY,mouseX,mouseY,width,mouseX);






}


