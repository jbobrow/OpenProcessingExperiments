
import ddf.minim.*;
Minim minim;
AudioPlayer bm;
AudioSample hello;

int drawFlag = 1; //1: drawainsect 2:drawbinsect
int kx,ky; 
int ox,oy;
int px,py;
int rx,ry;
PImage bg, img, img2,img3,img4,img5;

void setup () {
  frameRate(25);
   size(1920,1200);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
    bg= loadImage("bluegreen.jpg");  // Load the image into the program
    img = loadImage("3.png"); 
    img2 = loadImage("6.png");  
    img3= loadImage("RED.png");
    img4= loadImage("5.png");
    img5= loadImage("4.png");

 
   minim = new Minim(this);
  bm= minim.loadFile("wind-breeze-01.mp3",1024);
  bm.loop();
  hello= minim.loadSample("hello.wav",1024);
}
  


void draw() {
   background(bg); 



   
   image(img,width/2+kx,height/2+ky,105,150);
 kx= kx+round(random(-25,25));
 if (width/2+kx>=width-10){
   kx=kx-round(random(0,50));
 } 
 if (width/2+kx<100){
    kx= kx+round(random(0,30));
 }
 
  ky= ky+round(random(-60,20));
 if (height/2+ky>height-100){
   ky=ky-round(random(0,60));
 } 
 if (height/2+ky<50){
   ky=ky+round(random(0,50));
}



    image(img4,width/2+ox,height/2+oy,105,150);
 ox= ox+round(random(-50,50));
 if (width/2+ox>width-10){
   ox=ox-round(random(10,50));
 } 
 if (width/2+ox<100){
    ox= ox+round(random(0,50));
 }
 
  oy= oy+round(random(-50,50));
 if (height/2+oy==height-100){
   oy=oy-round(random(0,50));
 } 
 if (height/2+oy<50){
   oy=oy+round(random(0,50));
}

   


    image(img2,width/2+px,height/2-py,105,150);
 px= px+round(random(-40,40));
 if (width/2-px==width-10){
   px=px-round(random(0,50));
}if (width/2-px<100)
 {
    px= px+round(random(0,50));
 }
   py= py+round(random(-50,50));
 if (height/2-py>height-100){
   py=py-round(random(0,40));
 } 
 if (height/2+py<50){
   py=py+round(random(0,50));
}





    image(img5,width/2+rx,height/2+ry,105,150);
   rx= rx+round(random(-50,50));
 if (width/2+rx>width-20){
   rx=rx-round(random(0,40));
 } 
 if (width/2+rx<100){
    rx= rx+round(random(0,50));
 }
 
  ry= ry+round(random(-50,50));
 if (height/2+ry==height-100){
   ry=ry-round(random(0,50));
 }  if (height/2+ry<50){
   ry=ry+round(random(0,50));
}
}


void mousePressed()
{
  if(mousePressed)
  hello.trigger();
    image(img3,mouseX,mouseY,205,250);
}



//void drawainsect(float kx, float ky) {
// image(img,width/2+kx,height/2+ky);
// kx= kx+round(random(0,1));
// if (kx+10>=width){
//   kx=kx-round(0,1);

//
//void drawbinsect(float x, float y, float sideLength) {
//  noFill();
//  stroke(0, 0, 255);
//  rect(x, y, sideLength, sideLength);
//  fill(255);
//  text(". Center (" + mouseX + ", " + mouseY +")", x, y);
//  text("  Side length " + int(sideLength), x, y+12);
//}

//void mousePressed() {
//  if (drawFlag == 1)
//    drawainsect(random(width),random(height));
//}

//void keyPressed() {
//  if (key=='1')
//    drawFlag = 1;
//  else if (key=='2')
//    drawFlag = 2;
//}

