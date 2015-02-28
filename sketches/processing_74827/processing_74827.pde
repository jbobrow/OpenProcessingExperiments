
String txt1 = "Alice cominciava a essere veramente stufa di star seduta senza far nulla accanto alla sorella sulla riva del fiume. Una o due volte aveva provato a dare un'occhiata al libro che sua sorella stava leggendoma non c'erano né figure né filastrocche.";
  
int x = 0;
    
PFont font;
    
void setup(){
 size(1000,100);
 smooth();
 font = loadFont("Helvetica-48.vlw");
}
    
void draw(){
   background(0);
     
      fill(255);
   textFont(font, 50);
   text(txt1,x, 100);
      
   x = x - 4;
      
   if(x < -textWidth(txt1)){
     x = 100;
   }
       
}
