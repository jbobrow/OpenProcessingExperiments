
//grow
void setup()
{
  size(250,250);
  //size of canvas
  noStroke();
  //no strokes applied
  smooth();
  //smooth shapes
  frameRate(30);
  //number of frames drawn each second
}
int centerx,centery,ax,ay,bx,by,cx,cy;
//triangle variable points
int triangle_scale=height/2;
//triangle enlarges by 2 units
boolean scale_up=false;
//shows true or flase statement

void draw()
{
  centerx=width/2;
  //triangle enlarges by 2 units horizontally 
  centery= height/2;
  //triangle enlarges by 2 units vertically 
  ax=centerx;
  bx=centerx-triangle_scale;
  cx=centerx+triangle_scale;
  ay=centerx-triangle_scale;
  by=centerx+triangle_scale;
  cy=by;
  background(237,197,213);
  //redraws background colour
  triangle(ax,ay,bx,by,cx,cy);
  //triangle coordiantes 
  if (scale_up) {triangle_scale=triangle_scale+2;}
  //if the triangle reaches max height
  else {triangle_scale=triangle_scale-2;}
  //if the prev statement is not true, triangle will minimize by 2 units each frame
  if (triangle_scale<0) {scale_up=true;}
  //if the boolean is true it will scale up 
  if (triangle_scale>centery) {scale_up=false;}
  //triangle enlarges to the size of canvas with centery
  fill(random(205));
  //uses random hues for the fill of shape/triangle
 
}
