
String txt = "ARGH";
int x = 0;
int y = 2;
   
PFont font;
   
void setup(){
 size(500,200);
 smooth();
font = loadFont("28DaysLater-12.vlw");
}
   
void draw(){
   background(0);
   fill(0,255,0);
   textFont(font,80);
   text(txt,x-1,150);
     
   x = x +2;
     
      
   if(x>500){
     
     x = -150; 
   }      
}
 

