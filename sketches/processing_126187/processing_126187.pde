
PImage img;
PFont f;
void setup () {
  size(640,480);
  img=loadImage("Bacteria.jpg");
    imageMode(CENTER);
    f=createFont("Bombing", 24);
    textFont(f);
    textAlign(CENTER,CENTER);
}
void draw (){
  background(97,101,0);
  
  translate(width/2,height/2-50);

  float zoom=map(mouseX,0,width,0.1,3.5);
  scale(zoom);
  image(img,15,0);
  text("MedShow 2014",0,35);
}


