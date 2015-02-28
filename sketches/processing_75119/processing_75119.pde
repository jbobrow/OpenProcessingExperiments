
import netscape.javascript.*;

PImage MyImage;
float opacity = 0;

void setup() {
MyImage=loadImage("plankton.jpeg");
//size(MyImage.width, MyImage.height/2);
size(612,340);
image(MyImage,0,0);
smooth(); 
}


void draw() {
  for (int x=2; x<width-2; x++)
for(int y=2; y<height-2; y++) {
  color c = get(x,y);
  int xx = x+int(random(-20,20));
  int yy = y+int(random(-10,10));
  set(xx,yy,c);
  fill(c);
  noStroke();
  rect(xx-10,yy-10,4,4);
  //rect(xx-10,yy-10,6,6);
 }
  
  if (opacity<255) {
    opacity += 0.5;
  }
  tint(255,opacity);
  image(MyImage ,-25,-75);
}

