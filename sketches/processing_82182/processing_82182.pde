
public static int CIRCLE_WIDTH = 20;
public static int CIRCLE_HEIGHT = 20;
PImage img1,img2;
    
void setup() {
     background(255);
     size(523,829);
     img1 = loadImage("Asian2_aft.png");
     img2 = loadImage("Asian2_bef.png");
     image(img1,0,0);
    // image(img1,213,168);
}
    void draw() {
    if(mousePressed)  //from//https://forum.processing.org/topic/erasing-effect-from-one-image-to-another
          copy(img2,
             constrain(mouseX-CIRCLE_WIDTH/2,0,width),
             constrain(mouseY-CIRCLE_HEIGHT/2,0,height),
             CIRCLE_WIDTH,CIRCLE_HEIGHT,
             constrain(mouseX-CIRCLE_WIDTH/2,0,width),
             constrain(mouseY-CIRCLE_HEIGHT/2,0,height),
             CIRCLE_WIDTH,CIRCLE_HEIGHT);
    }

