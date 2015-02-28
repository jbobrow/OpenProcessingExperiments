
int x,y;

void setup(){
  size(600,400);
}

void draw(){
  noStroke();
  background(255);
  fill(255,0,0);
  rect (x,y,width/2, height/2);
  if ((mouseX< width/2) && (mouseY < height/2)){
    x=0;
    y=0;
  }else if ((mouseX> width/2) && (mouseY < height/2)){
    x = width/2;
    y =0;
  }else if ((mouseX< width/2) && (mouseY > height/2)){
    x = 0;
    y =height/2;
  }else {
    x = width/2;
    y =height/2;
  } 
}
