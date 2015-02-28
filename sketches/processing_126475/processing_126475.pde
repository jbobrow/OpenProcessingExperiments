
void setup(){
  size(360,360);
  background(0);
  fill(255);
  textSize(24);
  text("Welcome to the Drawer. ^^",10,120);
  text("Press S to save your drawing.",10,150);
  text("Press E to erase the board.",10,180);
  
}

void draw(){
  if(mousePressed == true){
    stroke(255);
    strokeWeight(14);
    point(mouseX,mouseY);
  }
  if(keyPressed == true){
    if(key == 's'){
      save("Sketch.png");
    }
    if(key == 'e'){
      background(0);
    }
  }
}
