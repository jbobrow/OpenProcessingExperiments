
int a = 100;
int colour = 0;
 
void setup(){
  size(500,500);
  background(255);
}
 
void draw(){
  if (mousePressed &&(mouseButton == LEFT)){
    fill(200, 40);
  }else if (mousePressed && (mouseButton == RIGHT)){
      fill(0, 80);
  }else{
      fill(250,40);
  }

  ellipse(mouseX, mouseY, a, a);
}


