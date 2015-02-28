
String txt1 = "Don't read me!";
String txt2 = "Don't read me!";
String txt3 = "Don't read me!";

int x = 0;
  
PFont font;
  
void setup(){
 size(400,400);
 smooth();
 font = loadFont("OCRAStd-48.vlw");
}
  
void draw(){
   background(200);
   
      fill(20);
   textFont(font, 100);
   text(txt1,x, 100);
   text(txt1, x-1400, 100);
   
      fill(150);
   textFont(font, 100);
   text(txt2, x, 220);
   text(txt2, x-1400, 220);
   
      fill(180);
   textFont(font, 100);
   text(txt3, x, 340);
   text(txt3, x-1400, 340);
    
    
   x = x - 5;
    
   if(x < -980){
     x = 400;
   }
     
}


