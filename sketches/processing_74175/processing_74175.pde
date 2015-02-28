
int circleX=200;
int circleY= 500;
int rectX= 550;
int rectY=300;
int rectX1=100;
int rectY1=150;
int circleSize=200;

// setup the skecth, this runs once.
void setup(){
  size (800,800);
  background (255);
  stroke (0);
  fill (255);
}

// draw shapes 
 void draw(){
   background (255);
   strokeWeight (30); // increases the stroke of the line.
   stroke (255,0,0);// Red color
   line (100,100,400,100);
  
   fill(0,rectX1,rectX1);
   stroke (rectX1,rectX1,0);
   rect (rectX1,rectY1,400,200);
   
   
   fill(0,0,255);
   stroke (0,0,255);
   ellipse (circleX,circleY,circleSize,circleSize);
   
   rect (rectX,rectY,200,200);
  
   
   triangle (mouseX,mouseY,mouseX-200,mouseY+100,mouseX+200,mouseY+100);// trinangle follows the cursor.
   
 }
 

