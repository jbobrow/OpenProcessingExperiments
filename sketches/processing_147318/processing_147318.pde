
float veilreduce;
float increment;
int imgdcounter;
int frames = 48;
int counter = 1;
int imgdelay;
PImage[] images = new PImage[frames];

void setup(){
  size(320,228);
  frameRate(10);
  for ( int  i = 1; i < 200; i++){
  images[i] = loadImage( i + ".jpg" );
  veilreduce = 0;
  increment = 2;
  imgcounter = 0;
  imgdelay = 0;
}

}

void draw(){
  
  if(imgdelay < 50){
    fill(0);
    rect(0,0,width,height);
    noFill();
  }
  
if(imgdelay >= 50){
 image (images[counter], 0,0);
 if(counter <= 43){
   counter++;
 }
 else{
   counter == 44;
 }

   
 
 if(frameCount >= 93){
   fill(0);
   rect(320,0,(-width+veilreduce),height);
   veilreduce = veilreduce + increment;
 }
 if(frameCount >= 180 && frameCount < 210){
   increment = 1;
 }
 if(frameCount >= 210){
   increment = 0.5;
 }
  if(frameCount >= 95 && frameCount <= 180){
   image (images[50],0,0);
 }  
 if(frameCount >= 190 && frameCount <= 240){
   image (images[46],0,0);
 }   
 if(frameCount >= 310 && frameCount <= 340){
   image(images[47],0,0);
 }
 if(frameCount >= 350 && frameCount <= 400){
   image(images[48],0,0);
 }
 if(frameCount >= 400){
   image(images[49],0,0);
 }
}

imgdelay ++;

 
}


