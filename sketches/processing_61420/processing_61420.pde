
int NUM = 6;// controls how many shoot off in total
PVector[] pos; // position
PVector[] vel; //velocity
int[] ttl,x,y; 
int imageNum = 0; //array setup for background images
PImage [] images = new PImage[3]; // calls up the images
PFont font;
import ddf.minim.*; // allows for Minim audio .wav function
Minim minim;
AudioPlayer fire_1, fire_2, fire_3, fire_4; //name of first file 


void setup(){
   size(400,600);
  smooth();
  images[0] = loadImage("cartoon715.jpg");
  
  images[1] = loadImage("patrotic_animated_fireworks.jpg"); // had to change to JPG to load properly. 
  
  images[2] = loadImage("10-Fireworks.jpg");
  
  for(int i=0; i<3; i++){
    images[i].resize(width,height); // reizes image to prepare for background
  }
  
  // allows me to get rid of ->> image(cartoon,0,0,width,height);
  
  font=loadFont("JasmineUPC-20.vlw");
  textFont(font);
  textSize(30);
    frameRate(random(50,100));// speed across screen
    
     pos = new PVector[NUM];
    vel = new PVector[NUM];
    ttl = new int[NUM];
    for( int i = 0; i < NUM; i++) {
        pos[i] = new PVector(0,0);
        if (i < NUM/2) {
            vel[i] = new PVector(random(-2,2), random(-10,-5));
            ttl[i] = int(random(50,100));
        } else {
            vel[i] = new PVector(0,0);
            ttl[i] = int(random(0,50));
        }
    }
  
  minim = new Minim(this);
  fire_1 = minim.loadFile("FireworksWhistle.wav");// loads first sound
  fire_2 = minim.loadFile("firework1.wav");
  fire_3 = minim.loadFile("FIREWORK.WAV");
  fire_4 = minim.loadFile("fireworks2.wav");
  
//  fill(random(HSB));
//  text("Happy 4th, good people!",150,550);
}

void stop(){
  minim.stop(); super.stop();
}
void drop(float x, float y){

  noStroke();
  for (int i =2; i<8; i++){
    ellipse(x,y + i*4, i*2, i*2);
  }
}



void draw(){
  background(images[imageNum]);
  fill(random(255));
  text("Happy 4th, good people!",60,550);// makes letters FLASH
  
  fill(255);
  for( int i = 0; i < NUM; i++) {
        drop( pos[i].x + width/2, pos[i].y + height );// width/2 = start at middle and bottom
        if(ttl[i] <= 175){
      fill(255,0,0); // red
  }
  if(ttl[i]<= 100){
     fill(0,0,255); // blue
     //explode here
   }
   if(ttl[i] <75){
     fill(random(255), random(255), random(255)); // rainbow fireworks
   }
    }
   
    for( int i = 0; i < NUM; i++) {
        pos[i].add( vel[i] ); // acceleration. affects velocity and in turn affects location.
        ttl[i]--; // decreasing ttl value till it reaches 0 and resets as shown below.
        if (ttl[i] < 0) {
            vel[i] = new PVector(random(-2,2), random(-10,-5));
            pos[i] = new PVector(0,0);
            ttl[i] = int(random(100,200));// higher = keeps the period between dots longer
            
     

          } 
    }
  
}

void keyPressed(){
  if (key == 'm') {
    fire_1.play();
  }
    if(key == 'k'){
    fire_2.play();
    }
    if (key == 'l'){
      fire_3.play();
    }
      if(key == 'b'){
        fire_4.play();
      }
    
   
  

}
  
// void keyPressed(){     // when any key is pressed EAGLE appears
//background(255);
//    image(eagle,0,0,width,height);
//    
//    if(key == CODED){
//      if(keyCode == RIGHT){
//      image(cartoon,0,0,width,height); // when RIGHT is pressed 1st Image appears
//    }
//   }
//   }  GOT RID OF THIS TO ALLOW FIREWORKS TO WORK PROPERLY AND WAS NO LONGER NEEDED. 

   void mousePressed(){
     
    imageNum = frameCount%3; // background displays in order on mous click
   println(imageNum); 
   
   
    
    
    
    
   }

