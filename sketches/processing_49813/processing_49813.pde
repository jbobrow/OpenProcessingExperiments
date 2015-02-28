
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
 
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter


int cr = 200;
int cg = 30; 
int cb = 100;
int sr = 30;
int sg = 100;
int sb = 200;
boolean squareBlue = true;
boolean circleRed = true;

void setup(){
  
 size( 640,360);
 smooth();
  
  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;
  
  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5; 

}

void draw()
{
  background( 255);
  fill( sr, sg, sb);
  rect( rx, ry, rd, rd);
  fill( cr, cg , cb);
  ellipse( ex, ey, ed, ed);
  
  float d = dist( ex, ey, mouseX, mouseY);
  
  // if you click on the circle
  if( d <= (106/2)){
    noFill();
    rect( ex-100, ey-100, 200, 200);
    if( mousePressed == true){
      
      if( squareBlue == false){
       sr = 30;
       sg = 100;
       sb = 200;
       squareBlue = true;
      }
      else  if( squareBlue == true){
       sr = 200;
       sg = 30;
       sb = 100;
       squareBlue = false;
      }
      
       
    }
  }
  // if you click on the box
  else if( mouseX > 161.2 && mouseX < 261.2 && mouseY > 130 && mouseY< 230){
    noFill();
    ellipse( 211.2, 180, 200, 200);
    if( mousePressed == true){
      
      
      if( circleRed == true){
       cr = 30;
       cg = 100;
       cb = 200;
       circleRed = false;
      }
      else  if( circleRed== false){
       cr = 200;
       cg = 30;
       cb = 100;
       circleRed = true;
      }
      
       
    }
   
  }
  
//println("Circle Red = " + circleRed);
//println("Square Blue = " + squareBlue);
println("rect x = " + rx);
println("rect y = " + ry);
println("rectangle width = " + rd);
println(" x : " + mouseX + "  y : " + mouseY);
  
}

