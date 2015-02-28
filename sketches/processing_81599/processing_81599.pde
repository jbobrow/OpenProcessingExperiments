
import ddf.minim.*;//declare
PImage img;
PImage img2;
PImage img3;
AudioPlayer tri;
AudioPlayer cowbell;

Minim minim;
 
void setup(){
   size (470,500);
  img=loadImage("triangle.JPG");
  img2=loadImage("stick.png");
  img3=loadImage("cowbell.png");
  minim=new Minim(this);
  tri=minim.loadFile("triangle.mp3");
}

void draw(){
 image(img, 0, 0);
 image(img2, mouseX-50, mouseY-50,100,100);
 if (mousePressed==true) {
   tri.play();
 }
}

