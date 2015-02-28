
String txt = "Time will tell...";
int x = 100;
 
PFont var;
 
void setup(){
 size(400,200);
 smooth();
 var = loadFont("FrenchScriptMT-48.vlw");
}
 
void draw(){
   background(0);
   fill(255);
   textFont(var,90);
   text(txt,x,100);
   x = x -1;
    
   if(x<-300){
     text(txt,x,100);
     x=400;   
   }
    
}

