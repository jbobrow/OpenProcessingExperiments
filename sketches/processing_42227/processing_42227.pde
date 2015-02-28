
String txt = "Do dut don du do dut don du.";
int x = 100;

PFont Segoe;

void setup(){
 size(400,200);
 smooth();
 Segoe = loadFont("SegoeUI-SemiBold-58.vlw");
}

void draw(){
   background(210);
   fill(100);
   textFont(Segoe,20);
   text(txt,x,100);
   x = x -1;
   
   if(x<-300){
     text(txt,x,100);
     x=400;    
   }
   
}





