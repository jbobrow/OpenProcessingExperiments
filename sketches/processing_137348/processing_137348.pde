
int pmouseX;
int pmouseY;

void setup(){
  size(480, 240);
  smooth();
}

void draw() {
  //background(255);

  if (mousePressed){ //change the color when I click the mouse

     line(mouseX,mouseY,pmouseX ,pmouseY );
      pmouseX = mouseX;
      pmouseY = mouseY;
    
    stroke(random(0,255),random(0,255),random(0,255),120);
    strokeWeight(random(1,10));
  }
}
