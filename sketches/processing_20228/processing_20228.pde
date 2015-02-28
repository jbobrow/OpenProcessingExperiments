
String txt1 = "L5A";
String txt2 = "3";
String txt3 = "8";
PFont fnt;
 
void setup(){
  size(250,250);
  smooth();
  background(212,212,212);
   // background rectangles with faded/gradient left corner
      for(int a=0; a<270; a+=20) {
    for(int b=0; b<270; b+=20){
      noStroke();
      fill(34,139,34,25);
      rect(a,b,100,100);
  }
    } 
}
 
void draw(){
   
  fnt = loadFont("imagine-font-48.vlw");
  textFont(fnt, 50);  
  // white text 
  fill(255);  
  text(txt1,55,145);
  text(txt2,92,105);
  text(txt3,92,185);
  // black text
  fill(0);
  text(txt1,130,185);
  text(txt2,167,145);
  text(txt3,167,225);
}

