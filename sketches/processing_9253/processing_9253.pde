
void setup(){
  smooth();
  size(600,600);
  background (10);
}

void draw(){
  if(mousePressed && (mouseButton == LEFT)){
    strokeWeight(1);
    stroke(200,80);
    line(mouseX,mouseY,mouseX,height-mouseY);
  } 
  if(mousePressed && (mouseButton == RIGHT)){
    strokeWeight(1);
    stroke(200,80);
    line(mouseX,mouseY,width-mouseX,mouseY);
  }
    if(keyPressed) { //Borrar todo
      background (10);
    }

}

