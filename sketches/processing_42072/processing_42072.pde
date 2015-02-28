
//Homework 10
//October 10, 2011
//Copyright Samantha Zucker, Pittsburgh, PA
float x,y,depth; 


//////////////////////////////////////
void setup()
{
 size (400, 400, P3D);
 smooth();
 lights(); 

 depth = 200;
 x = width*.5;
 y = height*.5;
}
//////////////////////////////////////
void draw()
{
  translate(width/2, height/2);
  rotateS();
  drawS();

}
//////////////////////////////////////
void rotateS()
{

 rotateZ(-3);
}
//////////////////////////////////////
void drawS()
{
  fill(155,240,46,80);
  background(28,19,70);

//center box
  box(x*.4, y*.1, depth);

//going up 
pushMatrix();
translate(-x*.3, -y*.1);
box(x*.4, y*.1, depth);
popMatrix();

pushMatrix();
translate(-x*.6, -y*.2);
box(x*.4, y*.1, depth);
popMatrix();

pushMatrix();
translate(-x*.3, -y*.3);
box(x*.4, y*.1, depth);
popMatrix();

pushMatrix();
translate(0, -y*.4);
box(x*.4, y*.1, depth);
popMatrix();

pushMatrix();
translate(x*.3, -y*.3);
box(x*.4, y*.1, depth);
popMatrix();

pushMatrix();
translate(x*.6, -y*.2);
box(x*.4, y*.1, depth);
popMatrix();

//going down
pushMatrix();
translate(x*.3, y*.1);
box(x*.4, y*.1, depth);
popMatrix();

pushMatrix();
translate(x*.6, y*.2);
box(x*.4, y*.1, depth);
popMatrix();

pushMatrix();
translate(x*.3, y*.3);
box(x*.4, y*.1, depth);
popMatrix();

pushMatrix();
translate(0, y*.4);
box(x*.4, y*.1, depth);
popMatrix();

pushMatrix();
translate(-x*.3, y*.3);
box(x*.4, y*.1, depth);
popMatrix();

pushMatrix();
translate(-x*.6, y*.2);
box(x*.4, y*.1, depth);
popMatrix();
}               
