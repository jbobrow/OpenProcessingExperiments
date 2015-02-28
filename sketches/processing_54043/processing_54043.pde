
PFont font;
 
void setup(){
size(450,450);
smooth();
font=loadFont ("Helvetica-Bold-48.vlw");
textFont (font);
 
}
 
void draw(){
   
  background(255);
   
 for(int y=0; y<=height; y+=40) {
  for(int x=0; x<=width; x+=40) {
    fill (0, random(5,60));
    textSize (random (5,40));
    text ("No Loitering\nPrices Slashed open one way\nSpace For Lease\nvalet\nparking\nrepair delivery", random (x,y), random(y,x));}
 }
}
 

                        
