
/*14/11/2014
  First attempt of a brasil's flag, with an "s"
  Code by Pablo Basile
  www.pablobasile.xpg.com.br
  I'm still learning the basics of Processing, after taking classes with Mr. Rogério Borovik, from Instituto Volusiano. 
  This code is is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.(CC BY-NC-SA 4.0), so if you like it, fell free to use and/or modify it as you want!
*/

void setup() {  
  size(500, 333);
  frameRate(24);
  background(255);  //set background white
}

void draw() {  //draw function loops
    stroke(55,255,55,10); //green lines
    line(0,random(-100,433),500,random(-100,433));
     
    stroke(255,255,0,10); //yellow lines
    line(0,166,250,random(0,333)); //yellow lines from the left 
    line(500,166,250,random(0,333)); //yellow lines from the right
        
    stroke(0,255,255,15); //blue ellipses
    ellipse(250,166,random(1,220),random(1,220));
    noFill();
  
    stroke(255,255,255,20); //white arcs
    arc(250,random(166,176),220,random(60,100),PI,2*PI);
    
    textSize(32);
    text("brasil", 290, 250); 
    text("com 's'", 310, 280);
 }
