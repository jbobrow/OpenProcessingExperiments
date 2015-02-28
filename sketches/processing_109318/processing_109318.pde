
int imgIndex;
float posX;
float posY;
 
void setup() {
  size(860, 860);
  posX = 2;
  posY = 4;
  
}
 
void draw() {
   
  float c;
  c=map(posX,0,600,0,255);
  fill((c)%400, (mouseX)%60, mouseX%90,70);
 
  noStroke();
  rect(posX, posY, 70  , 70);
  posX=posX+10;
  if (posX>width+1) {
    posX=0;
    posY=posY+50;
  }
 
  if (posY>height+1) {
    posY=0;
  }
  stroke((c)%255, (mouseX)%400, (mouseY)%255, mouseY%600);
  line(pmouseX, pmouseY, mouseX, mouseY);
  triangle(pmouseX, pmouseY, mouseX, mouseY, posX, posY);
}
 
void mouseReleased() {
 
  save("captura"+imgIndex+".jpg");
  imgIndex++;
}



