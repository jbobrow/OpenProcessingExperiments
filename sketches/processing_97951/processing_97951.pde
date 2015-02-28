

int a = 0;
int b = 0;
int c = 0;
int d = -200;
int e = -1500;
float ybug = 800;
float xbug = 500;
float ybird = -400;
float xbird = 300;
float randomdive = 1;
float blah = .5;
int lastTime = 0;
int lastTime2 = 0;
int pixelSize;
float mist1=-1000;
int numFrames = 2;
int frame = 0;

PImage img1;
PImage img15;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage[] dragons = new PImage [numFrames];
PImage bee;
PImage mist2;


void setup() {
noStroke();
size (1000,600);
img1 = loadImage ("layer1.png");
img15 = loadImage ("layer15.png");
img2 = loadImage ("layer2.gif");
img3 = loadImage ("layer3.gif");
img4 = loadImage ("layer4.gif");
img5 = loadImage ("layer6.png");
img6 = loadImage ("arrow.gif");
img7 = loadImage ("arrow.png");
img8 = loadImage ("mistlayer1.png");
dragons[0] = loadImage ("dragon.gif");
dragons[1] = loadImage ("dragon2.gif");
bee = loadImage ("bee.gif");
mist2 = loadImage ("mist2.png");
}

void draw() {
println (d);
 frame = (frame) % numFrames;  // Use % to cycle through frames 
 image(img1,0,0);
 image(img8,mist1+=.5,0);
 
if(mist1>600){
  mist1=-1000;}

image(img15,e/3,0);

image (mist2,mist1+=.5,0);

fill(255,255,204,30);
rect (0,0,1000,600);

if (ybird>1000){
  if( millis() - lastTime2 >= 10000){   
  ybird = random (-400,0);
  xbird = random(50,550);
lastTime2 = millis();
}}

if( millis() - lastTime >= 250){   //add rotate
//ellipse(100,100,100,100);
randomdive -= blah;
lastTime = millis();
}
if (randomdive<-2){
  blah = -.5;
  frame= 0;
} 
if (randomdive>2) {
  blah = .5;
  frame = 1;
}



//ellipse (ybug += random(-1,1),xbug += random(-1,1),5,5);  //bee/fly in foreground
image (dragons[frame % numFrames], ybird += 8,xbird += randomdive);

 // image(dragons[frame % numFrames], -300, 190);

 image(img2,a/2-350, -50);
// image(img3,b*1-1000,0);
 image(img4,c*1.5-1000,0);
 
 pushMatrix();
translate (-800,0);
 // rotate(radians(y));
  image(img5,d,0);
   image(bee, ybug += random(-1,1),xbug += random(-1,1));  //bee/fly in foreground

 fill (0);
  popMatrix();
 

 
 if (mousePressed){
   if(mouseX>0 && mouseX <100 && mouseY>0 && mouseY<600){
     a++;
     b++;
     c++;
     e++;
     d+=3;
     ybug+=3;
     image(img7,0,400);
}
if(mouseX>900 && mouseX <1000 && mouseY>0 && mouseY<600){
   a--;
   b--;
   c--;
   e--;
   d-=3;
   ybug-=3;
    scale(-1.0,1.0);
   image(img7,-1000,400);
 }
}
else{
  if(mouseX>0 && mouseX <100 && mouseY>0 && mouseY<600){
      image(img6,0,400);
}
if(mouseX>900 && mouseX <1000 && mouseY>0 && mouseY<600){
  scale(-1.0,1.0);
   image(img6,-1000,400);
}
}
if (d < -1199){
  a++;
     b++;
     c++;
     e++;
     d+=3;
     ybug+=3;
}
if (d>799){
   a--;
   b--;
   c--;
   e--;
   d-=3;
   ybug-=3;
}
}


