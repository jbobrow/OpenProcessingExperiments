
int a = 0;

void setup(){
  size(400, 400);
  smooth();
}

void draw(){
  noStroke();
  fill(0, 80);
  rect(0, 0, width, height);
  
  if(mousePressed){
    a = a + 1;
  }else{
    a = 0;
  }
  
  fill(a, a+30, a-140);
  ellipse(mouseX, mouseY, a, a);
}

