
PImage ref;

void setup() {
  size(400,400);
  ref = new PImage (width/2,height/2);
  colorMode (HSB);
}

void draw() {
    noStroke();
    fill(random(0, 256),255,255,100);
    image (ref, 0,0, width, height);
    ellipse(mouseX+random(-10,10),mouseY+random(-20,10),20+random(20),20+random(20));
    ellipse(mouseX+random(-30,40),mouseY+random(-30,40),50+random(20),60+random(20));
    fill(random(0, 256),255,255,70);
    ellipse(mouseX+random(-20,10),mouseY+random(-20,10),30+random(20),30+random(20));
    fill(random(70, 256),255,255,70);
    ellipse(mouseX+random(-20,10),mouseY+random(-20,10),80+random(20),80+random(20));
    fill(random(70, 256),255,255,70);
    ellipse(mouseX+random(-20,10),mouseY+random(-20,10),80+random(20),80+random(20));
    ref= get(10,10,width-10,height-10);
}



