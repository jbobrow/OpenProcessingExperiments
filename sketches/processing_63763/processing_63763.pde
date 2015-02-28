
float geschw;//geschwindigkeit des cursors

void setup(){
  size(500,500);
  smooth();
  noCursor();
  background(0);
}

void draw(){
  noStroke();
  fill(random(255),random(255),random(255));
  ellipse(mouseX,mouseY,geschw*4+10,geschw*4+10);
  
  geschw = abs(pmouseX -mouseX);
  
  //wenn die linke maustaste gedrückt wird 2 zusäzliche kreise
  if(mousePressed){
    ellipse(mouseX+10,mouseY+10,geschw*4+10,geschw*4+10);
    ellipse(mouseX-10,mouseY-10,geschw*4+10,geschw*4+10);
  }
    if (keyPressed && key == ENTER){
      fill(0);
      rect(0,0,500,500);
    }  
}
