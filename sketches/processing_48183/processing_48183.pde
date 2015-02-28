
String txt1 = "I'm not the code!";
 
int x = 0;
   
PFont font;
   
void setup(){
 size(400,400);
 smooth();
 font = loadFont("AmericanTypewriter-Light-48.vlw");
}
   
void draw(){
   background(50,70,12);
    
      fill(250);
   textFont(font, 50);
   text(txt1,x, 200);
     
   x = x - 4;
     
   if(x < -600){
     x = 400;
   }
      
}


