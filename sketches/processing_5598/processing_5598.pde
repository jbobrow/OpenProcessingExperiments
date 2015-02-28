
float margin; String t = " "; 
int large = 60;
float w = 0.0 ; float h = 0.0;
PFont fontA;

void setup()      {
  size(600, 450);
  background(0);
  smooth();
  fontA = createFont("ArnoPro-Italic18pt-48",48,true);
  textFont(fontA, 20);
  h = large ;
    String t = "PRESS ANY KEY";
    text(t,5, 20);
 } 
void draw()   {
  fill(255);
  }  
void keyPressed() {
  char k = key;
   w = textWidth(t) + (large/5) ; 
    textFont(fontA, large);
   text(k, w, h);
  
  text(k, w, h+large);
  fill(0);
  text(k, w, h+large);
  
  textFont(fontA, large*4);
  fill(255);
  text(k, w, height-large);
  fill(0);
  text(k, w, height-large);
 
  t = t + k ;
 if(w > width-(large/5)) { 
  background(0);
  t = " ";
}
 }


