
float posX;
float posY;
int ellipseColor = 0;

void setup(){
  size(800,600);
}

void draw(){
  fill(255,100);
  //rect(0,0,width,height);
  
  posX+= (mouseX-posX)*0.5;
  posY+= (mouseY-posY)*0.5;
  
  noStroke();
  fill(ellipseColor);
  ellipse(posX, posY, 50,50);
  }
  

  
void mouseMoved() {
  ellipseColor ++;
}



