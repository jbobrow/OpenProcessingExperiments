
String txt = "supercalifragilistichespiralitoso";
int x = 0;
int y=0;

PFont font;

void setup(){
 size(400,400);
 smooth();
font = loadFont("BacktalkSerifBTNSC-48.vlw");
}

void draw(){
   background(#CBFCA1);
   fill(100);
   textFont(font,48);
   text(txt,x,200);
   x = x +1;
  
   
   if(x>400){
     text(txt,x,200);
     x=10;    
   }
   
}





