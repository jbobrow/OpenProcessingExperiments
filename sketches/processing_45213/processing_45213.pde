
PImage spiderweb;
PImage leafpattern2;

void setup(){
  size(700,600);
  spiderweb = loadImage("spiderweb.jpeg");
  leafpattern2 = loadImage("leafpattern2.jpg");
}

void draw(){
   tint(mouseX,mouseY,300,300);
   image(leafpattern2,mouseX,0,700,600);
   tint(mouseX,mouseY,0,50);
   image(spiderweb,mouseX,mouseY,700,600);
 

}



