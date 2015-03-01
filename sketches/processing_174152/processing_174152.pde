
int x = 0;
int i = 0;
int savedTime;
int totalTime = 14* 1000;
import ddf.minim.*;
Minim minim;
AudioPlayer daft1;


void setup () {
  background(#000001);
  savedTime = millis ();
  minim = new Minim (this);
  daft1 = minim.loadFile ("02. Daft Punk - Aerodynamic.mp3");
  daft1.play();
size (500,500);
strokeWeight(30);
frameRate(30);
}

void draw() {
noCursor ();
   int passedTime = millis() - savedTime;
  if (passedTime > totalTime) {
   x = x + 50;
   i = i + 10;
   float r = random(-50, 50);
 stroke (random (255), random (255), random (265));
 strokeWeight(3.0);
  
pushMatrix();    
translate(100,160);
fill (random(0,255));

triangle(100, 145, 128, 90, 156, 145);
ellipse(200, 200, 60, 60);
ellipse(-04, -04, 60, 60);

fill (random(0,255));
triangle(65, 105, 88, 50, 116, 105);
ellipse (200, 200, 20, 20);
ellipse (-04, -04, 20, 20);

fill (random(0,255));
triangle(30, 65, 48, 10, 76, 65);
ellipse (200, 200, 10, 10);
ellipse (-04, -04, 10, 10);
popMatrix();


  if(mousePressed == true) { 
   ellipse(mouseX, mouseY, 50, 50);
   fill(0);
 i=i+1;
  println(i);
  for (int i = 0; i < 100; i++) 
  fill(random (255), random (255), random (255), i);
  }
  
  


}


}

void mousePressed (){
if (mouseButton ==LEFT) 
background (#FEFFFC);

if (mouseButton == RIGHT)
background (#050505);
}




