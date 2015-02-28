
import ddf.minim.*;
AudioPlayer player;
Minim minim;

void setup() {
  background(0);
  size(500, 600);
  smooth();
  noCursor();
  frameRate(1000);
  minim = new Minim(this);


  
}






float a=mouseX-50;
float b=mouseX+30;
float c=0;
float d=0;
float e=0;
float f=0;


void draw() {
  background(0);
fill(255);
stroke(0);
beginShape();
vertex(a, mouseY-50);
vertex(mouseX, mouseY-10);
vertex(b, mouseY-30);
vertex(mouseX+20, mouseY+10);
vertex(mouseX+25, mouseY+50);
vertex(mouseX-20, mouseY+50);
vertex(mouseX-30, mouseY+10);
vertex(a, mouseY-50);
endShape(CLOSE);

if (keyPressed && key=='g') {
 
  fill(237, 29, 77);
  stroke(0);
  ellipse(mouseX, mouseY+25, 10, 10);
  stroke(0);
  line(mouseX-20, mouseY+10, mouseX-10, mouseY+10);
  line(mouseX+3, mouseY+10, mouseX+13, mouseY+10);
  
a=mouseX-40;
b=mouseX+20;
c=c+1;

noStroke();
fill(237, 0, 255);
ellipse(mouseX+c, mouseY+25, 10, 10);
stroke(d, e, f);
line(mouseX+3+c, mouseY+25, mouseX+3+c, mouseY);
triangle(mouseX+3+c, mouseY, mouseX+3+c, mouseY+5, mouseX+9+c, mouseY);
 
}

if (keyPressed && key=='f') {
 
  fill(237, 29, 77);
  stroke(0);
  ellipse(mouseX, mouseY+25, 10, 10);
  stroke(0);
  line(mouseX-20, mouseY+10, mouseX-10, mouseY+10);
  line(mouseX+3, mouseY+10, mouseX+13, mouseY+10);
  
a=mouseX-40;
b=mouseX+20;
c=c+1;

noStroke();
fill(254, 255, 0);
ellipse(mouseX+c, mouseY+25, 10, 10);
stroke(d, e, f);
line(mouseX+3+c, mouseY+25, mouseX+3+c, mouseY);
triangle(mouseX+3+c, mouseY, mouseX+3+c, mouseY+5, mouseX+9+c, mouseY);
 
}

if (keyPressed && key=='e') {
 
  fill(237, 29, 77);
  stroke(0);
  ellipse(mouseX, mouseY+25, 10, 10);
  stroke(0);
  line(mouseX-20, mouseY+10, mouseX-10, mouseY+10);
  line(mouseX+3, mouseY+10, mouseX+13, mouseY+10);
  
a=mouseX-40;
b=mouseX+20;
c=c+1;

noStroke();
fill(28, 211, 26);
ellipse(mouseX+c, mouseY+25, 10, 10);
stroke(d, e, f);
line(mouseX+3+c, mouseY+25, mouseX+3+c, mouseY);
triangle(mouseX+3+c, mouseY, mouseX+3+c, mouseY+5, mouseX+9+c, mouseY);
 
}

if (keyPressed && key=='d') {
 
  fill(237, 29, 77);
  stroke(0);
  ellipse(mouseX, mouseY+25, 10, 10);
  stroke(0);
  line(mouseX-20, mouseY+10, mouseX-10, mouseY+10);
  line(mouseX+3, mouseY+10, mouseX+13, mouseY+10);
  
a=mouseX-40;
b=mouseX+20;
c=c+1;

noStroke();
fill(232, 9, 24);
ellipse(mouseX+c, mouseY+25, 10, 10);
stroke(d, e, f);
line(mouseX+3+c, mouseY+25, mouseX+3+c, mouseY);
triangle(mouseX+3+c, mouseY, mouseX+3+c, mouseY+5, mouseX+9+c, mouseY);
 
}

if (keyPressed && key=='c') {
 
  fill(237, 29, 77);
  stroke(0);
  ellipse(mouseX, mouseY+25, 10, 10);
  stroke(0);
  line(mouseX-20, mouseY+10, mouseX-10, mouseY+10);
  line(mouseX+3, mouseY+10, mouseX+13, mouseY+10);
  
a=mouseX-40;
b=mouseX+20;
c=c+1;

noStroke();
fill(35, 23, 227);
ellipse(mouseX+c, mouseY+25, 10, 10);
stroke(d, e, f);
line(mouseX+3+c, mouseY+25, mouseX+3+c, mouseY);
triangle(mouseX+3+c, mouseY, mouseX+3+c, mouseY+5, mouseX+9+c, mouseY);
 
}

if (keyPressed && key=='b') {
 
  fill(237, 29, 77);
  stroke(0);
  ellipse(mouseX, mouseY+25, 10, 10);
  stroke(0);
  line(mouseX-20, mouseY+10, mouseX-10, mouseY+10);
  line(mouseX+3, mouseY+10, mouseX+13, mouseY+10);
  
a=mouseX-40;
b=mouseX+20;
c=c+1;

noStroke();
fill(133, 11, 216);
ellipse(mouseX+c, mouseY+25, 10, 10);
stroke(d, e, f);
line(mouseX+3+c, mouseY+25, mouseX+3+c, mouseY);
triangle(mouseX+3+c, mouseY, mouseX+3+c, mouseY+5, mouseX+9+c, mouseY);
 
}



if (keyPressed && key=='a') {
 
  fill(237, 29, 77);
  stroke(0);
  ellipse(mouseX, mouseY+25, 10, 10);
  stroke(0);
  line(mouseX-20, mouseY+10, mouseX-10, mouseY+10);
  line(mouseX+3, mouseY+10, mouseX+13, mouseY+10);
  
a=mouseX-40;
b=mouseX+20;
c=c+1;


noStroke();
fill(245, 126, 35);
ellipse(mouseX+c, mouseY+25, 10, 10);
stroke(d, e, f);
line(mouseX+3+c, mouseY+25, mouseX+3+c, mouseY);
triangle(mouseX+3+c, mouseY, mouseX+3+c, mouseY+5, mouseX+9+c, mouseY);
 
}
 
 
 
if (keyPressed==false) {
 stroke(0);
line(mouseX-5, mouseY+25, mouseX+5, mouseY+25);

fill(255);
ellipse(mouseX-15, mouseY+10, 10, 10);
ellipse(mouseX+8, mouseY+10, 10, 10);
fill(0);
ellipse(mouseX-14, mouseY+10, 5, 5);
ellipse(mouseX+9, mouseY+10, 5, 5);

a=mouseX-50;
b=mouseX+30;

}

  
}



void keyPressed() {
  
  if (key=='a'){
  player= minim.loadFile("a69.mp3", 1024);
  player.play(); 
  }
  
  if (key=='b'){
  player= minim.loadFile("b71.mp3", 1024);
  player.play(); 
  }
  
  if (key=='c'){
  player= minim.loadFile("c60.mp3", 1024);
  player.play(); 
  }
  
  if (key=='d'){
  player= minim.loadFile("d62.mp3", 1024);
  player.play(); 
  }
  
  if (key=='e'){
  player= minim.loadFile("e64.mp3", 1024);
  player.play(); 
  }
  
  if (key=='f'){
  player= minim.loadFile("f65.mp3", 1024);
  player.play(); 
  }
  
  if (key=='g'){
  player= minim.loadFile("g67.mp3", 1024);
  player.play(); 
  }
  
    c=0;
    
}



  

