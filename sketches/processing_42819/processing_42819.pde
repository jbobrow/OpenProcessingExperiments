
String txt = "IT'S EVERYTHING OK";
int x = 0;
int y = 2;
  
PFont font;
  
void setup(){
 size(720,200);
 smooth();
font = loadFont("Chalkduster.vlw");
}
  
void draw(){
   background(0);
   fill(250);
   textFont(font,70);
   text(txt,x,100);
   text(txt,x-5,100);
    
   x = x +1;
    
     
   if(x>5){
    
     x = 0;  
   }
     
}



                
                
