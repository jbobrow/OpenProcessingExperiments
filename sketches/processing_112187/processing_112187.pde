

void setup(){
size(600,600);
if(width<700) {                //if statement  - changes background colour depending on width.
  background(255);
  }
  else {
    background(0);
  }
}
  
 // Dominic De Franco: I did the loops for the background.
void draw(){
  for(int d=10; d<width; d=d+20){
    for(int f=10; f<height; f=f+20){
      fill(44,170,227,23);      //Intentional opaque fade
      stroke(0,0,0,0);ellipse(d,f,15,15);
    }
  }
  // Aistis Taraskevicius : Drawing arcs and expanding line
     for (float x=208; x<212; x=x+ 0.5){
       for (float y=480; y<530; y=y+0.5){
      stroke(0);
      noFill();
      arc(x,x,y,y,0, HALF_PI);
      arc(x,x,y,y,0, HALF_PI);
       }
     }
      for (float x=193; x<205; x=x+0.5){
       for (float y=193; y<205; y=y+0.5){
       fill(0,0,99);
      line (x,y,406,406);
   }
   }
   //Aistis Taraskevicius: Drawing 4 ellipses in middle of 4 way split page
  for (int x=150; x<600; x=x+300){
    for (int y=150; y<600; y=y+300){
      fill(x,y,y);
      strokeWeight(3);
      ellipse (x,y,125,125);
      fill(y+y,x,y);
      ellipseMode(CENTER);
      ellipse (x,y,50,50);    
      }
    }  
   {
   
// Mantas Vogulis - added the text.
PFont font;    
font=loadFont("ColonnaMT-40.vlw");
textFont(font,60);
fill(5, 41, 6);
 text("Group 20", 350, 580);
}
}
 
 
//Symbol with faded background by group 22
 
//Rhiannon Walker - Changed stroke thickness on big circles and arc.
//Dean Taylor - Added if statement and general maintenance and troubleshooting.


