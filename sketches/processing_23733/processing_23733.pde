

public static int ELLIPSE_WIDTH = 40;
public static int ELLIPSE_HEIGHT = 40;

PImage img1,img2, c;
void setup() {
  size(650,433);
    c = loadImage("eraser.png");
      cursor(c, 20/2, 20/2);
  img1 = loadImage("1.jpg");
  img2 = loadImage("7.jpg");
  image(img1,0,0);
}
void draw() {
  smooth();
if(mousePressed) 
      copy(img2, 
              constrain(mouseX-ELLIPSE_WIDTH/2,0,width), 
              constrain(mouseY-ELLIPSE_HEIGHT/2,0,height), 
             ELLIPSE_WIDTH,ELLIPSE_HEIGHT, 
              constrain(mouseX-ELLIPSE_WIDTH/2,0,width), 
              constrain(mouseY-ELLIPSE_HEIGHT/2,0,height), 
              ELLIPSE_WIDTH,ELLIPSE_HEIGHT);
}

