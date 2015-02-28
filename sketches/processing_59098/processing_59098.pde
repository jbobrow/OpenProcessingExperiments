
import arb.soundcipher.*;
import arb.soundcipher.constants.*;



import arb.soundcipher.*;
SoundCipher sc = new SoundCipher(this);
float x;
float y;
float speed = 7;
int diam = 20;
int lmt;

void setup(){
  frameRate(80);
   size(300,300);
}

//void mousePressed(){
//x= mouseY+1;
//y = mouseX+1;
//}

void keyPressed(){
  sc.playNote(key - 40, 100, 0.5);
 if (key == 'o'){
 x = y +random(-3,3);
 y = y+ random(-3,3);
ellipse(x, y, 5, 5);

}
}
void draw(){
ellipse(mouseX,mouseY, random(diam),random(diam));
 sc.instrument(random(80));
  sc.pan(mouseX);
  sc.playNote(random(40) + 60 - mouseY/2, random(50) + 70, 0.2);
}



