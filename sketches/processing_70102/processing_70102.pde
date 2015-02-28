
int a = 100;
int b = 350;
int d = 900;
int value = 800;

String tri="Drawing Triangle";
String stripe1="Drawing Red Stripe";
String stripe2="Drawing White Stripe";

void setup(){
  
  size(1000,1000);
  background(250,228,225);
  
  
}

void draw(){
  
 noStroke();
  smooth();
  
  if (keyPressed) {
    if (key == 'w' || key == 'w') {
      fill(0);
    }
  } else {
    fill(255);
  }
//references the start found here http://www.openprocessing.org/sketch/8175 by Vanessa Wang
beginShape();

     vertex(150,10);
     vertex(190,100);
     vertex(290,100);
     vertex(200,175);
     vertex(265,290);
     vertex(150,215);
     vertex(35,290);
     vertex(100,175);
     vertex(10,100);
     vertex(110,100);
     endShape();//end of the shape
}

  
void mouseDragged(){  
  
  fill(0,0,255);
  beginShape();
  vertex(mouseX,mouseY);
  vertex(a,a);
  vertex(b,b);
  vertex(d,d);
  endShape(CLOSE);
  println(tri);
  
  
}

void keyPressed(){

  fill(255,0,0);
  rect(100,mouseY,850,20);
  println(stripe1);

    
  
}

void keyReleased(){
  fill(255,255,255);
  rect(100,mouseY,850,20);
  println(stripe2);
  
}

