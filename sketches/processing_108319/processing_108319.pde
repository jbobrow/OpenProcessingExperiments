
int imgIndex;
float posX;
float posY;

void setup() {
  size(600, 600); 
  posX = 0;
  posY = 0;
 
}

void draw() {
  
  float c;
  c=map(posX,0,600,0,255);
  fill((c)%255, (mouseX)%255, mouseX%150,70);

  noStroke(); 
  rect(posX, posY, 50, 50);
  posX=posX+10;
  if (posX>width+1) {
    posX=0;
    posY=posY+50;
  }

  if (posY>height+1) {
    posY=0;
  }
  stroke((c)%255, (mouseX)%255, (mouseY)%255, mouseY%150);
  line(pmouseX, pmouseY, mouseX, mouseY);
  triangle(pmouseX, pmouseY, mouseX, mouseY, posX, posY);
}

void mouseReleased() {

  save("captura"+imgIndex+".jpg");
  imgIndex++;
}



