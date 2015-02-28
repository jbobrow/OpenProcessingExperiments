
void setup(){
  size(500,500);
  background(200,50,100);
  fill(random(250),random(250),random(250));
}
void draw(){
  rect(mouseX,mouseY,25,50);
  mouseX=500-mouseX;
  rect(mouseX,mouseY,25,50);
  if (keyPressed && key == ' '){
    background(random(250),random(250),random(250));
    fill(random(250),random(250),random(250));
}
}


