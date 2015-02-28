
PImage bg;

void setup() {
  size(400, 400); 
  smooth(); 
  frameRate(30);
   bg = loadImage("Speakernew.jpg");
   background(bg);
}
void draw(){
    
  int x=0;
  int y=0;
  float mx = constrain(mouseX-150, 40, 60);
  float my = constrain(mouseY-150, 40, 60);
  cursor(ARROW);
 eye(175,200);
  eye(225,200); 
  
  
     if(mousePressed){
       beam(mx, my);
       }
      
  
}


  void eye(int x, int y){
  fill(0,0,0);
  ellipse(x,y,50,50);
  pupil(x,y);
  
}

void pupil(int x, int y){
  int s = #FFCB93;
   float mx = constrain(mouseX-150, 40, 60);
  float my = constrain(mouseY-150, 40, 60);
   stroke (0);
     strokeWeight (0);
     fill(255,0,0);
    
  ellipse(x-50+mx,y-50+my,20,20);
   fill(0,0,0);
   
  ellipse(x-50+mx,y-50+my,5,5); 
  //blinking eye 
 if (mouseX< 275) {
  // int x2=275-mouseX;
   if (mouseX> 125){
     
     if (mouseY >125) {
       if (mouseY < 275){
          fill (s);
     ellipse(x,y,50,50);
     stroke (0);
     strokeWeight (2);
     line (x,y+25,x-15,y+5);
     line (x,y+25,x,y+5);
     line (x,y+25,x+15,y+5);
       }}}}
    if (mouseX> 275) {
  // int x2=275-mouseX;
   if (mouseX< 125){
     
     if (mouseY <125) {
       if (mouseY > 275){
         
     stroke (0);
     strokeWeight (0);
     fill(255,0,0);
  ellipse(x-50+mx,y-50+my,20,20);
   fill(0,0,0);
  ellipse(x-50+mx,y-50+my,5,5); 
       }}}}
     
}
void beam(float mx, float my){
    strokeWeight(12);
       stroke(255,204,0);
    line(125+mx,150+my,mouseX,mouseY);
    
    strokeWeight(10);
    stroke(255,0,0);
     line(125+mx,150+my,mouseX,mouseY);
     
    strokeWeight(1);
   stroke(255,204,0);
  fill(255,0,0);
 ellipse(mouseX,mouseY,10,10); 
 
      
    strokeWeight(12);
       stroke(255,204,0);
     line(175+mx,150+my,mouseX,mouseY);
     strokeWeight(10);
    stroke(255,0,0);
     line(175+mx,150+my,mouseX,mouseY); 
     strokeWeight(1);
   stroke(255,204,0);
  fill(255,0,0);
 ellipse(mouseX,mouseY,10,10); 
}
  

