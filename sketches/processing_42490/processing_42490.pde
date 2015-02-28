
String txt = "the end is the beginning is";
int x = 0;
int y = 0;
 
PFont font;
 
void setup(){
 size(900,200);
 smooth();
font = loadFont("ClarendonBT-Heavy-48.vlw");
}
 
void draw(){
   background(208,210,214);
   fill(100);
   textFont(font,70);
   text(txt,x,100);
   text(txt,x-980,100);
   
   x = x +1;
   
    
   if(x>980){
   
     x = 0;   
   }
    
}


