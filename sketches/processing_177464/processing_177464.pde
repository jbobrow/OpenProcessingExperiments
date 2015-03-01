
/* The Water and it's importance: My goal to this End Project 
is to draw attention to the problem of lack of water. 
The human being has acted as if the water will never finish. 
The water is not durable and not renewable as well. 
We need to be aware of this.
I put a photo taken by my mother. 
This place is next to where I was born. 
To the sound I picked sound effects from GarageBand. 
When the mouse is dragged the image flashes 
in different colors. My intention with this 
is that those who see the image be aware that it can disappear. 
There are also white geometric shapes that arise 
from the center of the image. These shapes represent the end of the water.*/
//Music
//Import "Minim"
import ddf.minim.*;

//Global variables to music
Minim minim;
AudioPlayer aguas;

//Image
PImage agua;

//Music and Image together
void setup() {
size(960, 638);
colorMode(HSB, width, height, 50);
background(random(width), random(height), random(50));
agua = loadImage("agua.jpg");
minim = new Minim(this);
aguas = minim.loadFile("aguas.mp3");
aguas.play();

}
void draw() {
  image(agua, 0, 0); 
  if(mousePressed);
  pushMatrix();
  translate(width/2, height/2);
  //map(value, start1, stop1, start2, stop2);
  int circleResolution = (int)map(mouseY+100, 0, height, 2, 10);
  int radius = mouseX-width/2;
  float angle = TWO_PI/circleResolution;
  //style
  strokeWeight(1);
  stroke(#FAF13F);
  
  beginShape();
  for (int i=0; i<=circleResolution; i++) {
    float x = 0 + cos(angle*i) * radius;
    float y = 0 + sin(angle*i) * radius;
    vertex(x, y);}
  
  endShape();
  popMatrix();
  
}
//keyPressed()
void keyPressed(){
if (key=='s' || key=='S') saveFrame("screenshot.png");

}
//mouseDragged()
void mouseDragged() {
 background(random(width), random(height), random(100));
}


