
String txt = "?";
int x = 150;
 
PFont Segoe;
 
void setup(){
 size(500,100);
 smooth();
 Segoe = loadFont("Serif-48.vlw");
}
 
void draw(){
   background(100);
   fill(220);
   textFont(Segoe,143);
   text(txt,x,100);
   x = x -1;
    
   if(x<-300){
     text(txt,x,200);
     x=500;   
   }
    
}
                
                
