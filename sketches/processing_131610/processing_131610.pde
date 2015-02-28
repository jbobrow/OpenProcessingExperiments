
//copyright Laura Contero 2014
//Homework Assignment 5

float x, y, dx, dy, diam;
float sx, sy, sdx, sdy, sdiam;
color bgColor, col, sCol; 

void setup()
{
  size( 400, 400);
  
  x = 0;
  y = 0;
  dx = 5;
  dy = 5;
  diam = 100;
  
  sx = 350;
  sy = 350;
  sdx = 10;
  sdy = 10;
  sdiam = 50;
  
  col = color( 122, 122, 147, 150);
  sCol = color( 400, 122, 147, 150);
  bgColor = color( 400, 200, 0, 150);
}

void draw()
{
  prepareWindow();
  drawFigures();
  moveFigures();
}

void prepareWindow()
{
  fill( bgColor);
  rect( 0, 0, 400, 400);
}

void drawFigures()
{
  noStroke();
  figure( x, y, diam, col);
  figure( sx, sy, sdiam, sCol);
}

void figure( float x, float y, float diam, color col)
{
  fill( col);
  ellipseMode(CORNER);
  ellipse( x, y, diam, diam);
}

void figure( float sx, float sy, float sdiam, color sCol)
{
  fill( sCol);
  ellipseMode(CORNER);
  ellipse( sx, sy, sdiam, sdiam);
}
  
void moveFigures()
{
  //large ellipse
  if ( x <= width) {
    x = x+dx; }
  if (y <= height-height) {
    x = x+dx; }
    
  if ( x >= width-diam) {
    y = y+dy; }
  if ( y <= height-diam) {
    y = y+dy; }
    
  if ( x >= width-width) {
    x = x-dx; }
  if ( y >= height-diam) {
    x = x-dx; }
    
  if ( x <= width-width) {
    y = y-dy; }
  if ( y >= height-height) {
    y = y-dy; }
    
    
  //small ellipse
  if ( sx > width-width) {
    sx = sx-sdx; }
  if ( sy >= height-diam/2) {
    sx = sx-sdx; }
    
  if ( sx <= width-width) {
    sy = sy-sdy; }
  if ( sy > height-height) {
    sy = sy-sdy; }
    
  if ( sx <= width-diam/2) {
    sx = sx+sdx; }
  if ( sy <= height-height) {
    sx = sx+sdx; }
    
  if ( sx >= width-diam/2) {
    sy = sy+sdy; }
  if ( sy <= height-diam/2) {
    sy = sy+sdy; }
}



