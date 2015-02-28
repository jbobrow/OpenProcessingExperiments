
import ddf.minim.*;
Minim minim;
AudioPlayer player;

PImage img;

void setup() {

  size(640,480);
  background(0);
  img = loadImage("KITT-DB.jpg");
  smooth();
  minim = new Minim(this);
  player = minim.loadFile("TV Themes - Knight RiderK.mp3", 2048);
  player.loop();
 
}


void draw() {
  background(0);
  image(img, 15, 5);

  fill(236,38,35);
  strokeWeight(2);
  
  float m = map(mouseY, 0, height, 0, 80);
  float centerMin = m;
  float centerMax = 280 -m;
  
  float d = map(mouseX,m,width,0,60);
  float sideMin = 50 + d;
  float sideMax = 240 +-d;

  //Mid long Bar
  for(int i =20; i<280; i+=12) {
     if (i>centerMin && i<-centerMax) {
 

      
    } else {
      fill(136,28,25);
    }
    rect(320,i,25,12);
  }
  
  //left bar

  for(int i =20; i<280; i+=12) {
    if (i>sideMin && i<sideMax) {
       if (mousePressed) {
           fill(136,255,25);
         }else {
           fill(236,38,35);
         }
    } else {
      fill(136,28,25);
    }
    rect(270,i,25,12);
    if (i>centerMin && i<centerMax) {
      if(mousePressed){
        fill(136,255,25);
      }else{
        fill(236,38,35);
      }
    } else {
      fill(136,28,25);
    }
    rect(320,i,25,12);
  }

  //right bar    
  for(int i =20; i<280; i+=12) {
    if (i>sideMin && i<sideMax) {
   
         if (mousePressed) {
           fill(136,255,25);
         }else {
           fill(236,38,35);
         }
    } else {
      fill(136,28,25);
    }
    rect(370,i,25,12);
  }
  
 
  //Button illumination
// yellow alt
  strokeWeight(0);
  if(keyPressed){
    fill(236,247,62,20); //yellow transp
  }else{
    fill(254,250,49,70);
  }
    rect(165,89,60,40);
    
 strokeWeight(0);
  if(keyPressed){
    fill(233,177,26,20);
  }else{
    fill(254,250,49,70);
  }
    rect(165,89,62,42);//yellow drop shadow
    
    
    // Oil Press
    if(keyPressed){
    fill(236,247,62,20); //yellow transp
  }else{
    fill(236,247,62,70);
  }
    rect(165,166,60,40);
    
 strokeWeight(0);
  if(keyPressed){
    fill(233,177,26,20);
  }else{
    fill(236,247,62,70);
  }
    rect(165,166,62,42);//yellow drop shadow
    
    
    //SAT COM
    
      if(keyPressed){
    fill(236,247,62,20); //yellow transp
  }else{
    fill(236,247,62,70);
  }
    rect(431,166,60,40);
    
 strokeWeight(0);
  if(keyPressed){
    fill(233,177,26,20);
  }else{
    fill(236,247,62,70);
  }
    rect(431,166,62,42);//yellow drop shadow
   
// AUX  
   if(keyPressed){
    fill(236,247,62,20); //yellow transp
  }else{
    fill(236,247,62,70);
  }
    rect(431,89,60,40);
    
 strokeWeight(0);
  if(keyPressed){
    fill(233,177,26,20);
  }else{
    fill(236,247,62,70);
  }
    rect(431,89,62,42);//yellow drop shadow
 
// ACC
   if(keyPressed){
    fill(212,33,33,20); //red transp
  }else{
    fill(212,33,33,70);
  }
    rect(431,244,60,40);
    
 strokeWeight(0);
  if(keyPressed){
    fill(212,33,33,20);
  }else{
    fill(212,33,33,60);
  }
    rect(431,244,62,42);//red shadow

// Radar

   if(keyPressed){
    fill(212,33,33,20); //red transp
  }else{
    fill(212,33,33,60);
  }
    rect(431,320,60,40);
    
 strokeWeight(0);
  if(keyPressed){
    fill(212,33,33,20);
  }else{
    fill(212,33,33,70);
  }
    rect(431,320,62,42);//red shadow
    
    // MPI

   if(keyPressed){
    fill(212,33,33,20); //red transp
  }else{
    fill(212,33,33,70);
  }
    rect(431,396,60,40);
    
 strokeWeight(0);
  if(keyPressed){
    fill(212,33,33,20);
  }else{
    fill(212,33,33,70);
  }
    rect(432,396,62,42);//red shadow

  
    // FUEL
   if(keyPressed){
    fill(212,33,33,20); //red transp
  }else{
    fill(212,33,33,70);
  }
    rect(165,397,60,40);
    
 strokeWeight(0);
  if(keyPressed){
    fill(212,33,33,20);
  }else{
    fill(212,33,33,70);
  }
    rect(165,398,63,42);//red shadow


// OiL Temp
   if(keyPressed){
    fill(212,33,33,20); //red transp
  }else{
    fill(212,33,33,70);
  }
    rect(165,244,60,40);
    
 strokeWeight(0);
  if(keyPressed){
    fill(212,33,33,20);
  }else{
    fill(212,33,33,70);
  }
    rect(165,244,62,42);//red shadow
    
    

 // EGT
   if(keyPressed){
    fill(212,33,33,100); //red transp
  }else{
    fill(212,33,33,20);
  }
    rect(165,320,60,40);
    
 strokeWeight(0);
  if(keyPressed){
    fill(212,33,33,67);
  }else{
    fill(212,33,33,20);
  }
    rect(165,320,62,42);//red shadow
    
    //Normal Cruise/ mini rect
   if(keyPressed){
    fill(113,246,58,100); //red transp
  }else{
    fill(113,246,58,20);
  }
    rect(310,308,90,42);
    
 strokeWeight(0);
  if(keyPressed){
    fill(113,246,58,67);
  }else{
    fill(113,246,58,20);
  }
    rect(310,310,90,42);
    
    //Mini Red
      if(keyPressed){
    fill(212,33,33,230); 
  }else{
    fill(212,33,33,20);
  }
    rect(263,403,20,42);
    
     if(keyPressed){
    fill(212,33,33,100); 
  }else{
    fill(212,33,33,20);
  }
    rect(264,403,21,43);
   
}


    

