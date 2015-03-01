
PImage ref;
 
void setup() {
  
  size(400,400);
  ref = new PImage (width/2,height/2);

  colorMode (HSB);
}
 
void draw() {
    noStroke();
    image (ref, 0,0, width, height);
    
    fill(random(0, 256),255,255,100);
    ellipse(mouseX+random(-10,10),mouseY+random(-20,10),20+random(20),20+random(20));
    
    fill(random(0, 256),255,255,70);
    ellipse(mouseX+random(-20,10),mouseY+random(-20,10),30+random(20),30+random(20));
    
    fill(random(70, 256),255,255,70);
    ellipse(mouseX+random(-20,10),mouseY+random(-20,10),80+random(20),80+random(20));
    
    if (mousePressed == true) {
    if (mouseButton == LEFT){
    ref= g. get(10,10,width-20,height-20);
    }
    else if (mouseButton == RIGHT){
    ref= g. get(10,10,width-100,height-100);
    }
    } 

}
