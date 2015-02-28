
//*credit Nidhi Malhotra: http://www.openprocessing.org/sketch/33838

int posx;
int posy;
 
void setup(){
  size(400, 536);
  PImage img = loadImage("bg.JPG");
  image(img, 0, 0);
}
 
void draw(){
  loadPixels();
  color pixel = get(mouseX,mouseY);
  //pixels[i]= pixel;
  noStroke();
  fill(pixel);
 
  if(mousePressed == true) {
    posx=mouseX-(mouseX%25);
    posy=mouseY-(mouseY%25);
    rect(posx,posy,25,25);
  }
}

