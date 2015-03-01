
void setup() {
  size(600,600);
  colorMode(RGB, height, height, height);
  noStroke();
  background(0);

}

void draw(){
  colorMode(RGB, height, height,height);
    //if(mouseX>100 && mouseX<400);{
    //if(mouseY>100 && mouseY<400);{
  fill(mouseX, width-100,height-100);
  rect(100,100,400,400);
    //}
  //}
}


