
/*
Jacqueline Miller
int art
hw #5
'grid activated; let it pour'
*/
 
int x=60;
int y=40;
int x1=120;
int y1=40;
int size=3;
int columns=9;
int rows=21;
float margin =60;
float translate_x;
float translate_y;
 
float slope;
float product_down_slope;
float down_slope;
float first_down_slope;
float shift_up;
PVector move, circles;
PVector mouse;
 
 
void setup(){
  size(600,1000);
 
 
}
  void draw(){
    frameRate(random(5,15));// changing frame rate to varry the 'flow' of the water. I wanted it to look like it is catching a draft wind
   // background(0);
   noStroke();
    fill(0,150);// transitions the background to fade from top to bottom at a different pace
    rect(0,0,width, 200);
     
    fill(0,105);
    rect(0, 200, width, 200);
    
    fill(0,75);
    rect(0,400, width, 200);
    
     fill(0,50);
    rect(0, 600, width, 600);
     fill(0,3);
    rect(0, 800, width, 800);
     
PVector move=new PVector();
PVector circles=new PVector();
//PVector mouse=new PVector(); decided not to make further animation
//mouse=new PVector(mouseX, mouseY);
 
for (int r=0; r<rows; r++){
float first_down_slope=down_slope(r, 1);
noStroke();
fill (random(150), random(150), random(150),10);
ellipse (circles.x,circles.y, 300,300);// larger moving circles
fill (#f0d5da, (random(255)));
 
 
   
for (int c=0; c<columns; c++){
  translate_x=(margin+(x*first_down_slope));// test for defining pvector by translation variable
  translate_y=(margin+(y*first_down_slope));
move=new PVector(random(100), random(500,1000));// activates all .move animation
circles=new PVector(random(width), random(height));// activates all .move animation

pushMatrix();
translate(margin +(x*c),margin +(y*r));
fill(#f0d5da,5);
//stroke(0);

stroke(0);
//stroke(#f0d5da);
ellipse(x,y,size+2,size+2);// grid of circles
stroke(#f0d5da);
ellipse(move.x,move.y,size+(random(4)), size+(random(4))); // small circles, splashing effect
 
   
popMatrix();
 
pushMatrix();
//shift lines
 
translate(translate_x,translate_y);//water moving
noStroke();
//stroke(0);
//fill(#f0d5da);
stroke(#f0d5da);
strokeWeight(.01);
line(0,0,move.x,move.y);//following defined pvector

 
//line(0+(first_down_slope*8),0,  x+(first_down_slope*8), y);weird effect
 
noStroke();//lines that shift to follow x
//stroke(#f0d5da);
strokeWeight(.01);
line(60,0,x+60,y);
//line(60,0,mouse.x+60,mouse.y); weird effect
line(120,0,x+120,y);
line(180,0, x+180, y);
line(240,0,x+240, y);
line(300,0,x+300,y);
line (360,0,x+360, y);
line (420,0,x+420,y);
line(480,0,480+x, y);
popMatrix();
 
 
 
pushMatrix();
translate(margin+(x*first_down_slope), ((y)*first_down_slope)+margin+40); //lines that shift to follow y
line(0,0,x,y);
line(0,40,x,y+40);
line(0,80,x,y+80);
line(0,120,x,y+120);
line(0,160,x,y+160);
line(0,200,x,y+200);
line(0,240,x,y+240);
line(0,280,x,y+280);
line(0,320,x,y+320);
line(0,360,x,y+360);
line(0,400,x,y+400);
line(0,440,x,y+440);
line(0,480,x,y+480);
line(0,520,x,y+520);
line(0,560,x,y+560);
line(0,600,x,y+600);
line(0,640,x,y+640);
line(0,680,x,y+680);
line(0,720,x,y+720);
line(0,760,x,y+760);
 
 
popMatrix();
 
 }}}// reminder brackets need to be outside of matrix
  
 
 
  
 float down_slope(float r, float slope) {
 float product_down_slope = r*slope;
 return product_down_slope;
 }
