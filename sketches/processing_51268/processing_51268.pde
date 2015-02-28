
//michellephilpott PS1-3
 
int X=50;
int Y=50;
int W=100;
int H=100;
 
boolean on = false;
 
void setup() {
  size(300,255);
  smooth();
}
 
void draw() {
   
   float barWidth = 20;
   float numBars = width / barWidth;
    
   for (int i=0; i< numBars; i++) {
     float x= i* barWidth;
      
     float d= abs(mouseX - x);
      
     float c= map(d, 0, width, 0, 255);
     float r=map(d,0,width,255,0);
     float g = map(mouseY, 0, height, 0, 255);
     fill(234, 300, 130);
      
     ellipse(mouseX,mouseY,40,40);
     if (on== true) {
       fill(145);
     }
     else {
       fill(76, 145, 256);
     }
     ellipse(mouseX,mouseY,50,50);
   }}
   void mousePressed() {
     if ( mouseX >mouseY )
    {
 
  on =!on;
}
 
}   


