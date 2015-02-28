
            /* Schabowicz PS1-04 */

int X=50;
int Y=50;
int W=100;
int H=100;

boolean on = false;

void setup() {
  size(400,255);
  smooth();
}

void draw() {
  
   float barWidth = 40;
   float numBars = width / barWidth;
   
   for (int i=0; i< numBars; i++) {
     float x= i* barWidth;
     
     float d= abs(mouseX - x);
     
     float c= map(d, 0, width, 0, 255);
     float r=map(d,0,width,255,0);
     float g = map(mouseY, 0, height, 0, 255);
     fill(r, g,175);
     
     ellipse(mouseX,mouseY,50,50);
     if (on== true) {
       fill(255);
     }
     else {
       fill(r, g,175);
     }
     ellipse(mouseX,mouseY,50,50);
   }}
   void mousePressed() {
     if ( mouseX >mouseY )
    {

  on =!on;
}

}    
                                
