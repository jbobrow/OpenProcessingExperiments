

void setup() {
  size(400,400);
  background (150);
  colorMode (HSB);
}

void draw() {
    noStroke();
    background (20);
    fill(random(0, 256),255,255,100);
    ellipse(mouseX+random(-10,10),mouseY+random(-20,10),20+random(20),20+random(20));
    ellipse(mouseX+random(-30,40),mouseY+random(-30,40),50+random(20),60+random(20));
    fill(random(0, 256),255,255,70);
    ellipse(mouseX+random(-20,10),mouseY+random(-20,10),30+random(20),30+random(20));
    fill(random(70, 256),255,255,70);
    ellipse(mouseX+random(-20,10),mouseY+random(-20,10),80+random(20),80+random(20));
    fill(random(70, 256),255,255,70);
    ellipse(mouseX+random(-20,10),mouseY+random(-20,10),80+random(20),80+random(20));
 
}



