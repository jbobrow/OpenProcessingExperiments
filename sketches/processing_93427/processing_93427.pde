
PImage motif;
PImage motif2;
PImage motif3;
PImage motif4;
PImage motif5;
float yubbs;
float appear;
float appeara;
int aspect = 1;
int aspecta = 5;
int aspectb = 5;
int grow = 1;
int wubbs = 400;
int wubbs2 = 200;
int wubbs3 = 600;
int angle = 3;
int what = 80;
int locate=0;
float rotation;
float spin;
float x;
float y;
//import ddf.minim.*;

//AudioPlayer player;
//Minim minim;//audio context

boolean paused = false ;


void setup() {
  
  frameRate(20);
////   minim = new Minim(this);
//  player = minim.loadFile("01 Get Innocuous!.mp3", 2048);
//  player.play();
size(800,800);
background(0);
motif = loadImage ("motif2.png");
motif2 = loadImage ("motif3.png");
motif3 = loadImage ("motif4.png");
motif4 = loadImage ("motif4a.png");
motif5= loadImage ("motif5.png");

}

void draw() {
  x = mouseX;
  y=mouseY;
  if(!paused){
    rotation = random(0,360);
  yubbs = random(50,200);
  appear = random(0,800);
  appeara= random(0,800);
 
  noStroke();
  



if (key =='d') {

 
translate(width/2, height/2);
rotate(radians(rotation));
fill(255);
rect(-26, -26, 52, 52);
}

fill(random (0,255), random(0,255), random(0,255), random(50,100));

ellipse(400,400, random(0,500), random(0,500)); 



if(key == 'x'){
  fill(0,0,0,700);
   image (motif3, 0,-100 ,random(100,400), random(400,600));}
   if(key== 'z'){
     image (motif4,600,400,random(100,400),random(400,600));}


fill(0,0,0, random(200,400));
image(motif4, random(0,800), random(0,800), yubbs, yubbs); 


//  image (motif2, wubbs, wubbs, grow, grow); 
//   image (motif2, wubbs2, wubbs2, grow, grow); 
//    image (motif2, wubbs3, wubbs3, grow, grow); 
if (mouseX>400) {
  wubbs = wubbs+1;
   wubbs2 = wubbs2+1;
    wubbs3 = wubbs3+1;
  aspect = aspect-1;
  grow = grow -5;
  aspecta = aspecta -3;
  aspectb = aspectb+3;
}

fill (0,0,0,20);

image(motif,200,400 , aspect, aspect);
image(motif,600,400 , aspect, aspect);



image (motif, 200, 600, aspect, aspect);
image (motif, 600, 600, aspectb,aspectb);

  
image (motif, 200, 200, aspecta, aspecta);
image (motif, 600, 200, aspect, aspect);
  
 

if(mouseX<400) {
  
aspect = aspect + 1;
wubbs=wubbs-1;
wubbs2=wubbs2-1;
wubbs3=wubbs3-1;
grow = grow +5;
aspecta = aspecta + 3;
aspectb = aspectb -3;


  
} 






  fill(random(0,255));
ellipse(mouseX, mouseY, 50,50);



fill(0,0,0,what);
rect(0,0,1200,1200);

stroke(170,random(50,300));
strokeWeight(10);
line(appear, appeara, mouseX, mouseY);

if(key == 'a'){
what = 0; 
  fill(200,200,200,500);
  rect(random(0,900), 0, 50,900);
  what = 0;
  translate(width/2, height/2);
rotate(radians(rotation));
fill(255);
rect(-26, -26, 52, 52);
}
 else{
   what = 80;
 }
  
}

fill(0,0,0,100);
image( motif5, appear, appeara, 100,100);
if (key =='d') {

 
translate(width/2, height/2);
rotate(radians(rotation));
fill(255);
rect(-26, -26, 52, 52);
}

}





void keyPressed(){

//if you press the c key, clear the sketch
if (key == 'c' || key == 'C') {
  background(0);
}

//press 'o' to draw a random oval once'
//if (key == 'o' || key == 'O') {
//  image(oval, random(width), random(height), oval.width/4,oval.height/4);
//}


//press the space bar to pause and unpause
if(key == ' '){
  //if it is paused (i.e. paused == true) make paused be false
  //i.e. if it's paused, unpause it.
  if(paused) {paused = false;}
  //otherwise, pause it.
  else {paused = true; }
  if (key =='d') {
translate(x,y);
  rotate(radians(rotation));{
  image(motif5,0,0,20,20);}
}
}

}
//void stop()
//{
//  player.close();
//  minim.stop();
//  super.stop();
//}




