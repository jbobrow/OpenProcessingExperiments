
/* @pjs preload="Wolf.png";  */
void setup() {
  /* @pjs preload="Wolf.png";  */

  size(400,400);
  PImage Wolf= loadImage ("Wolf.png");
  colorMode (HSB);
}
 
void draw() {
    noStroke();
    fill(random(0, 256),255,255,100);
    background (random (30),255,255);
    ellipse(mouseX+random(-10,10),mouseY+random(-20,10),20+random(20),20+random(20));
    ellipse(mouseX+random(-30,40),mouseY+random(-30,40),50+random(20),60+random(20));
    
    fill(random(0, 256),255,255,70);
    ellipse(mouseX+random(-20,10),mouseY+random(-20,10),30+random(20),30+random(20));
    
    fill(random(70, 256),255,255,70);
    ellipse(mouseX+random(-20,10),mouseY+random(-20,10),80+random(20),80+random(20));
    
    fill(random(70, 256),255,255,70);
    ellipse(mouseX+random(-20,10),mouseY+random(-20,10),80+random(20),80+random(20));
    
    /* @pjs preload="Wolf.png";  */

    tint (random(70, 256),255,255,70);
    PImage Wolf= loadImage ("Wolf.png");
    translate (-200, -200);
    image (Wolf, mouseX+random(-3,-1),mouseY+random(-2,3));
}



