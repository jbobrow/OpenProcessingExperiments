
/*

"Poke" the dots to make them stop.
After all 5 are poked, the screen clears from center outwards.

Learned how to import sound from:
http://www.cs.sfu.ca/CourseCentral/166/tjd/processing_sound.html
*/

import ddf.minim.*;

// set up the sound variables
Minim minim;
AudioSnippet poke;



// track when a circle has been poked
boolean circlePoke;

  
int x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, w, wEnd;
int pause = 20;
int startTime;
boolean v1Flag = true, v2Flag = true, v3Flag = true, v4Flag = true, v5Flag = true;
boolean poked1, poked2, poked3, poked4, poked5= false;


void setup(){
  
//initialize sound
  minim = new Minim(this);
  poke = minim.loadSnippet("poke.wav");

  
   size(400,400);
   
   x1 = 40;
   y1 = y2 = y3 = y4 = y5 = 40 ;
   w = 80;
   x2 = x1 + w;
   x3 = x1 + w*2;
   x4 = x1 + w*3;
   x5 = x1 + w*4;
   wEnd = 10;

   
   startTime = millis();
  
}

void draw(){
  background(230,255,255,200); 
  noStroke();
  ellipse(x1,y1,w,w);
  ellipse(x2,y2,w,w);
  ellipse(x3,y3,w,w);
  ellipse(x4,y4,w,w);
  ellipse(x5,y5,w,w);

//Ball 1
if(poked1 == false){
 if(y1 >= height - w/2){ //bottom wall
     v1Flag = false;
   }
   
   if(y1 <= 0 + w/2){ // top wall
      v1Flag = true;
  }
  
  if(v1Flag){ //moving 1 pixels up or down
   y1 = y1+3; 
  }
  else y1 = y1-3;

  
  // If mouse enters circle, flash peach to encourage a click
  if(dist(x1, y1, mouseX, mouseY) < w/2) {  //mouse within radius of circle center
     fill(252,167,115,100);
  
 }
  else fill (200,200,200,100); 
 
 // If the circle is pressed, the motion stops
 if(dist(x1, y1, mouseX, mouseY) < w/2 && 
    mousePressed ){
    poke.play(0);
    poked1 = true;      
    }
}



// Ball 2
if(poked2 == false){
 if(y2 >= height - w/2){ //bottom wall
     v2Flag = false;
   }
   
   if(y2 <= 0 + w/2){ // top wall
      v2Flag = true;
  }
  
  if(v2Flag){ //moving 1 pixels up or down
   y2 = y2+3; 
  }
  else y2 = y2-3;

  
  // If mouse enters circle, flash peach to encourage a click
  if(dist(x2, y2, mouseX, mouseY) < w/2) {  //mouse within radius of circle center
     fill(252,167,115,100);
  
 }
  else fill (200,200,200,100); 
 
 // If the circle is pressed, the motion stops and poke noise plays
 if(dist(x2, y2, mouseX, mouseY) < w/2 && 
    mousePressed ){
    poke.play(0);
    poked2 = true;      
    }
}

// Ball 3
if(poked3 == false){
 if(y3 >= height - w/2){ //bottom wall
     v3Flag = false;
   }
   
   if(y3 <= 0 + w/2){ // top wall
      v3Flag = true;
  }
  
  if(v3Flag){ //moving 3 pixels up or down
   y3 = y3+3; 
  }
  else y3 = y3-3;

  
  // If mouse enters circle, flash peach to encourage a click
  if(dist(x3, y3, mouseX, mouseY) < w/2) {  //mouse within radius of circle center
     fill(252,167,115,100);
  
   }
 
 // If the circle is pressed, the motion stops
 if(dist(x3, y3, mouseX, mouseY) < w/2 && 
    mousePressed ){
    poke.play(0);
    poked3 = true;      
    }
  }


// Ball 4
if(poked4 == false){
 if(y4 >= height - w/2){ //bottom wall
     v4Flag = false;
   }
   
   if(y4 <= 0 + w/2){ // top wall
      v4Flag = true;
  }
  
  if(v4Flag){ //moving 3 pixels up or down
   y4 = y4+3; 
  }
  else y4 = y4-3;

  
  // If mouse enters circle, flash peach to encourage a click
  if(dist(x4, y4, mouseX, mouseY) < w/2) {  //mouse within radius of circle center
     fill(252,167,115,100);
  
   }
 
 // If the circle is pressed, the motion stops
 if(dist(x4, y4, mouseX, mouseY) < w/2 && 
    mousePressed ){
    poke.play(0);
    poked4 = true;      
    }
  }
  
// Ball 5
if(poked5 == false){
 if(y5 >= height - w/2){ //bottom wall
     v5Flag = false;
   }
   
   if(y5 <= 0 + w/2){ // top wall
      v5Flag = true;
  }
  
  if(v5Flag){ //moving 3 pixels up or down
   y5 = y5+3; 
  }
  else y5 = y5-3;

  
  // If mouse enters circle, flash peach to encourage a click
  if(dist(x5, y5, mouseX, mouseY) < w/2) {  //mouse within radius of circle center
     fill(252,167,115,100);
  
   }
 
 // If the circle is pressed, the motion stops
 if(dist(x5, y5, mouseX, mouseY) < w/2 && 
    mousePressed ){
    poke.play(0);
    poked5 = true;      
    }
  }
  
  if(poked1 == true &&
    poked2 == true &&
    poked3 == true &&
    poked4 == true &&
    poked5 == true){
    fill (255,255,255);
    ellipse (200,200,wEnd,wEnd);
    wEnd = wEnd+10;
    }
}

  // Minim requires that this function be added
  void stop() {
    poke.close();
  
    minim.stop();
  
    super.stop();
  }

 

  




