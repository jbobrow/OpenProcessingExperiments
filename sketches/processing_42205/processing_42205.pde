
PFont font;
int x=0;
int y=200;
 
void setup (){
  
 size(400,400);
 background(143,216,222);
 smooth();
 noStroke();
 fill(0);
   
}
 
void draw(){
  
   background(143,216,222);
    font = loadFont("BauerBodoni-Bold-20.vlw");
    textFont(font);

      text ("Maddy", x, y);
    
     x=x+1;


}
 





