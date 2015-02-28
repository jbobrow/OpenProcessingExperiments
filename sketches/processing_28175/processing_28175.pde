
/*
This is a mouse effect of creating firework on the sky 
and enjoy the view create. 
There are effect like the laser light,
(follow your mouse, there is one on the left and one on the right of the building)
colourful firework (big one on the sky),
and little sparkling firework (little one on the sky near the buildings.
The hands of the bear and rabbit move follow the height of your mouse.
The cat help to take photo of the memorable moment.

I draw the background by myself.
Enjoy~^^

*/
void setup(){
size(637,475);
smooth();  
PImage night;
night = loadImage("firework2back.png");
image(night, 0, 0);


PFont font;
textSize(30);
font = loadFont("GiddyupStd-48.vlw"); 
textFont(font, 32); 
textSize(60);
text("Click", 200, 100);
text("to have firework", 300, 200); 
textSize(20);
text("Wow!!", 240, 380);
}


int light = 180;
int hand = 10;
int angle2=0;
int center=6;
int colr=10;
float angle1 = 0.0;
float scalar = 4;
float speed = 0.5;
float circlesize= 2;


void draw(){
  loop();
  PImage night;
    // Fade the background every 10 frames
    if (frameCount % 10 == 0) {
  night = loadImage("firework2back.png");
      tint(255,100); 
  image(night, 0, 0);

 noStroke();

// following is a fail of moving the bear's hand. I use the mapping at last.
/*if(mouseY<200){
fill(0);
ellipse (340,400,30,10);
translate (0,hand);

hand=hand-1;
if (hand>10){
  hand=0;

}
}*/


/* The following inspired by tutorial example of mapping
*/
//bear's hand
float b = map(mouseY, 0,height,405-5,405+5);
fill(0);
ellipse(337, b, 35, 15);

//rabbit's hand
float r = map(mouseY, 0,height,430-2,430+2);
fill(0);
ellipse(235, r, 25, 8);

  }
  
//  firework 1
/* This is a firework in the middle layer, modify from the example from the test book "Getting Started withProcessing" page104,
which is about a spiral pattern.

float angle = 0.0;
float offset = 60;
float scalar = 2;
float speed = 0.05;
void setup() {
size(120, 120);
fill(0);
smooth();
}
void draw() {
float x = offset + cos(angle) * scalar;
float y = offset + sin(angle) * scalar;
ellipse( x, y, 2, 2);
angle += speed;
scalar += speed;
} */

if (mousePressed){
 if(mouseY> 210 & mouseY<280){
 
float x = mouseX + cos(angle1) * scalar;
float y = mouseY + sin(angle1) * scalar;
//by changing offset to mouseX & Y I make it follow the mouse movement

fill(255);
ellipse( x, y, circlesize, circlesize);
//Added one more variable call circlesize
angle1 += speed;
scalar += speed;
}
}
else {
  angle1=0.0;
scalar = 4;
  }
  
  
  
  
  
//firework2
/*This is the main attraction of this mouse effect,
I intent to let the audience to draw the firwork on the sky by themselves.
It will be a mouse follow effect, and keep repeating until stop pressing 
the mouse.

I changed the code from the website. http://www.openprocessing.org/visuals/?visualID=8380

void draw() {
  if (mousePressed == true) {
    angle += 10;
    float val = cos(radians(angle)) * 20.5;
    for (int a = 0; a < 360; a += 75) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      fill(227,15,150);
      ellipse(mouseX + xoff, mouseY + yoff, val, val);
    }
    fill(227,203,16);
    ellipse(mouseX, mouseY, 4, 4);
  }
}
*/

if (mousePressed & mouseY<210) {//As I want to limit the firework to the sky.
    angle2 += 10;
  if (angle2 > 150) { //150 is the biggest circle layer before it get back to 20.
     angle2 =20; 
     /*to loop the firework. This is the biggest different with the origanal code,
     which will let it repeat the explosion*/
     
  } 
  
    float val = cos(radians(angle2)) * angle2;
    //by mutiply a variable- angle2, the size of the firework increase significantly
    for (int a = 0; a < 360; a += 75) {

      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      fill(random(20,255),random(150,200),random(255));
      //fill with random color
      ellipse(mouseX + xoff, mouseY + yoff, val, val);
}
  

      fill(random(20,255),random(150,200),random(255));
    ellipse(mouseX, mouseY, 5, 5);
    
  }

  


  
 /*This is the light of the buildings 
 Move the mouse across the image and change the colour of lighting
 This is a nice try. It worked. However it is a bit distrating audience 
 attention therefore I comment it out.


  fill(255,light,0);
 rect (228,312,4,6);
  rect (228,332,7,8);
  rect (230,350,5,5);
   rect (220,300,6,5);
    //building1
    rect (151,351,6,6);
    rect (165,338,5,5);
//building4&5
fill(light-2,100,200);
    rect (278,343,8,7);
    rect (296,337,8,7);
fill(light+10,light*0.8+20,150);
    rect (339,296,16,12);
    rect (360,337,8,7);
*/


}




/* laser light that fpllow mouse.
Inspired by week 5 tutorial example, the use of rotate.
I made this by myself. */
void mouseMoved() {
  loop();
  light = light + 2;
  if (light > 240) {
    light = 180;
  }
  int Y= mouseY;
  int X= mouseX;


//light right, use mouseX & Y to restrict the laser active area so that it won't affect the firework
if (X>400 & Y<300){
  for( int i=0; i<10;i++){
    stroke(200,X-300,10,5);
strokeWeight(i);
//rotate(PI/6);
line(500,370,X,Y+100);
  }
}

//light left
if (X<250 & Y<300){
  for( int i=1; i<10;i++){
    stroke(X,200,Y,5);
strokeWeight(i);
//rotate(PI/6);
line(190,370,X,Y+100);
  }
  }
}//mmove


//take photo
/*
Inspired by the code of the website
http://www.openprocessing.org/visuals/?visualID=9775
void keyPressed() {
  if (key =='c' || key == 'C') {
    save ("flower_maker_v1.png");
  }
}

However I change it to mouse click.
And I think I can freeze the screen for a while by stop the loop.
*/

void mouseClicked() {
  if (mouseX>300 & mouseX<440 & mouseY>355 & mouseY<435 ) {
    saveFrame ("####_photo.png");
noLoop();
  
}

if(mousePressed) {
loop();
 
}
}



