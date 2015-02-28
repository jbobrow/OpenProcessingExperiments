


import arb.soundcipher.*;
import arb.soundcipher.constants.*;

// drawing erratic circle at mousex mousey and large central disc


import arb.soundcipher.*;
SoundCipher sc = new SoundCipher(this);
float x;
float y;
float speed = 7;

int diam = 20;
int lmt;
float i = 0;
float pitch = 60;
//static final float[] MINOR_PENTATONIC;



void setup(){
  frameRate(30);
  background(255);
   size(300,300, P3D);
}

void mousePressed(){
x= mouseY+1;
y = mouseX+5;
}

void keyPressed(){
  

  if (key == 'o'){
      stroke(154, 243, 201,200);
      strokeWeight(5);

    ellipse(x, y, 20, 20);
    //stroke(0);

  x = y +random(-3,3);
  y = y* random(-3,3);
  

  
    
}
}

void draw(){
background(255);
x = y +random(-3,3);
y = y+ random(-3,3);
ellipse(x, y, 50, 50);
ellipse(x, y, 40, 40);
ellipse(x, y, 30, 30);
ellipse(x, y, 20, 20);
ellipse(x, y, 15, 15);

ellipse(mouseX,mouseY, 10,10);
stroke(154, 243, 201,200);

strokeWeight(3);
ellipse(mouseX, mouseY, 5, 5);

//noStroke();
for (int i = 0; i <10; i++){
stroke(0,0,0, 255);
strokeWeight(2);
ellipse(150, i+20.0, mouseX, mouseY);
stroke(100,100,100,200);
  sc.instrument(random(115));
sc.playNote(10, 100, 1);

    pitch = sc.pcRandomWalk(pitch*2, 100, sc.MAJOR);

//sc.playNote(10, 10, 1);

}
}


