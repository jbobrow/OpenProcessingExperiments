
//FINAL PROJECT: PUTTING IT ALL TOGETHER//

//import library
import ddf.minim.*;

//Declare global variables
Minim minim;

AudioPlayer raindr1; //5sec raindrive cut
AudioPlayer Once;
AudioPlayer Vrt;
AudioPlayer raind; //raindrive cut
AudioPlayer myname2;

//Declare PImage variable type

PImage worm; //shapes
PImage mia;  //dynamic sketch
PImage gam1; //interactive
PImage pama; //b/w touchup
PImage ramy; //collage
PImage dv;   //text & graphics
PImage glob; //Project1
PImage frog; //say your name
PImage no;   //name & white wave

PImage rain; //raindrive score

PImage once; //once score
PImage vrt;  //virtual score
PImage falls;//iguassu
PImage img;  //black bird
PImage img2; //black bird
PImage img3; //black bird
PImage img4; //black bird
PImage img5; //white bird
PImage img6; //white bird
PImage vf;   //Victoria falls
PImage deer; //Chobe
PImage der;  //Chobe herd

int top; 
int top1;
int startTime, elapsedTime;

float x;
float y;
float easing = 0.05;

void setup () {
  size (800,600);
  background (#000000);
  
//Load image files from HDD, check data folder
//Load audio file from HDD

minim = new Minim (this);

raindr1 = minim.loadFile ("raindr1.mp3");
Once = minim.loadFile ("Oncesample.mp3");
Vrt  = minim.loadFile ("Vrtsample.mp3");
raind  = minim.loadFile ("raind.mp3");              //      ***************
myname2 = minim.loadFile ("myname2.mp3");

der  = loadImage("ChDer.jpg");
worm = loadImage ("Slide1.png");
mia  = loadImage ("SlideMia.png");
gam1 = loadImage ("SlideInter.png");
pama = loadImage ("Slidepama.png");
ramy = loadImage ("ramy.png");
dv   = loadImage ("dv.png");
glob = loadImage ("Project1.png");
no   = loadImage ("SlidefrogNo.png");
rain = loadImage ("RaindriveScore.png");

once = loadImage ("SlideOnce.png");
vrt  = loadImage ("vrt.png");
top=600;
top1=0;
  falls = loadImage("iguassu.jpg");
  img   = loadImage("bird1.png");
  img2  = loadImage("bird2.png");
  img3  = loadImage("bird1.png");
  img4  = loadImage("bird2.png"); 
  img5  = loadImage("bird3wR.png");
  img6  = loadImage("bird4wR.png");
  vf    = loadImage("VF...jpg");
  deer  = loadImage("Chdeer.jpg");
  
  
frameRate (25);

//initialise the timers
elapsedTime = millis();
startTime = millis();
}

//Create key triggers
      void keyPressed(){
       if (key=='1') Once.play();
       if (key=='2') Vrt.play();
       
 }   

//Draw image to the screen

void draw() {
  
                  
image(der,0,0);
textSize (70);
fill(255);
text("My Introduction to",10,155);
text("Computational Arts",10,550);



if ((millis()-startTime)/1000 >=4) {
   
 raindr1.play(); 
 image(falls,0,0,800,600);
      textSize (65);
fill(255);
text("Starting to take off:",50,100);

  image(img, top, top);
    image(img2,(top-5), (top-1));
  image(img3,(top+150),(top+200));
    image(img4,(top+155),(top+199));  
    top=(top-15)%height;
  image(img5,top1,top);
    image(img6,(top1-5),(top-5));
    top1=(top1+15)%width;  
}

if((millis()-startTime)/1000 >=20){
image (worm,0,0,800,600);
image(img, top, top);
    image(img2,(top-5), (top-1));
  image(img3,(top+150),(top+200));
    image(img4,(top+155),(top+199));  
    top=(top-15)%height;
  image(img5,top1,top);
    image(img6,(top1-5),(top-5));
    top1=(top1+15)%width;
}

if((millis()-startTime)/1000 >=30){
image (mia,0,0,800,600);
image(img, top, top);
    image(img2,(top-5), (top-1));
  image(img3,(top+150),(top+200));
    image(img4,(top+155),(top+199));  
    top=(top-15)%height;
  image(img5,top1,top);
    image(img6,(top1-5),(top-5));
    top1=(top1+15)%width;
}    


if((millis()-startTime)/1000 >=40){
image (gam1,0,0,800,600);
image(img, top, top);
    image(img2,(top-5), (top-1));
  image(img3,(top+150),(top+200));
    image(img4,(top+155),(top+199));  
    top=(top-15)%height;
  image(img5,top1,top);
    image(img6,(top1-5),(top-5));
    top1=(top1+15)%width;
}

if((millis()-startTime)/1000 >=50){
image (pama,0,0,800,600);
image(img, top, top);
    image(img2,(top-5), (top-1));
  image(img3,(top+150),(top+200));
    image(img4,(top+155),(top+199));  
    top=(top-15)%height;
  image(img5,top1,top);
    image(img6,(top1-5),(top-5));
    top1=(top1+15)%width;
 
  
}

if((millis()-startTime)/1000 >=60){
image (ramy,0,0,800,600);
image(img, top, top);
    image(img2,(top-5), (top-1));
  image(img3,(top+150),(top+200));
    image(img4,(top+155),(top+199));  
    top=(top-15)%height;
  image(img5,top1,top);
    image(img6,(top1-5),(top-5));
    top1=(top1+15)%width;
}   
   if((millis()-startTime)/1000 >=70){
 image (dv,0,0,800,600);
image(img, top, top);
    image(img2,(top-5), (top-1));
  image(img3,(top+150),(top+200));
    image(img4,(top+155),(top+199));  
    top=(top-15)%height;
  image(img5,top1,top);
    image(img6,(top1-5),(top-5));
    top1=(top1+15)%width;    
   }

if ((millis()-startTime)/1000 >=80) {
image (glob,0,0,800,600);
image(img, top, top);
    image(img2,(top-5), (top-1));
  image(img3,(top+150),(top+200));
    image(img4,(top+155),(top+199));  
    top=(top-15)%height;
  image(img5,top1,top);
    image(img6,(top1-5),(top-5));
    top1=(top1+15)%width;   
}

if ((millis()-startTime)/1000 >=90) {
myname2.play();
  image (no,0,0,800,600);
/*image(img, top, top);
    image(img2,(top-5), (top-1));
  image(img3,(top+150),(top+200));
    image(img4,(top+155),(top+199));  
    top=(top-15)%height;
  image(img5,top1,top);
    image(img6,(top1-5),(top-5));
    top1=(top1+15)%width;
    */   
}

if ((millis()-startTime)/1000 >=100) {
raind.play();
  image (rain,0,0,800,600);
image(img, top, top);
    image(img2,(top-5), (top-1));
  image(img3,(top+150),(top+200));
    image(img4,(top+155),(top+199));  
    top=(top-15)%height;
  image(img5,top1,top);
    image(img6,(top1-5),(top-5));
    top1=(top1+15)%width;   
}

if ((millis()-startTime)/1000 >=110) {
image (once,0,0,800,600);
image(img, top, top);
    image(img2,(top-5), (top-1));
  image(img3,(top+150),(top+200));
    image(img4,(top+155),(top+199));  
    top=(top-15)%height;
  image(img5,top1,top);
    image(img6,(top1-5),(top-5));
    top1=(top1+15)%width;   
}

if ((millis()-startTime)/1000 >=120) {
image (vrt,0,0,800,600);
image(img, top, top);
    image(img2,(top-5), (top-1));
  image(img3,(top+150),(top+200));
    image(img4,(top+155),(top+199));  
    top=(top-15)%height;
  image(img5,top1,top);
    image(img6,(top1-5),(top-5));
    top1=(top1+15)%width;   
}

if ((millis()-startTime)/1000 >=130) {
image (vf,0,0);
image(img, top, top);
    image(img2,(top-5), (top-1));
  image(img3,(top+150),(top+200));
     image(img4,(top+155),(top+199));  
    top=(top-15)%height;
  image(img5,top1,top);
    image(img6,(top1-5),(top-5));
    top1=(top1+15)%width;  
  
textSize(60);
stroke(#58FA6C);
fill(255); 
text("Now I've put it all together",15,500);
}
if((millis()-startTime)/1000 >=140){
   image(img,top,top);
   top=(top-15)%height;
   image (deer,0,0);
   noLoop();
   textSize(40);
   text("Press 1 for Once sample",50,100);
   text("Press 2 for Virtual Rhymes sample",85,170);
   
   textSize(65);
      text("...where to from here?",75,530);
}

float targetX=mouseX;
float dx = targetX-x;
if (abs(dx)>1) {
  x+=dx*easing;
}

float targetY=mouseY;
float dy = targetY-y;
if (abs(dy)>1) {
  y+=dy*easing;
}

image (img5,x-30,y-30,100,100);
image (img,x-100,y-100,100,100);
}



