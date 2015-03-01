
void setup()
{
  size(400,400);
  background(#33CCFF);
  noStroke();
 
  //largeCenterCircle
  fill(#00A3CC);
  ellipse(200,200, 325,325);
  // smallCenterCircle
  fill(#99EBFF);
  stroke (#FFAD99);
  ellipse(200,200, 265,265);
 
  //cube
  fill(#FF5C33);{
  quad(100,265, 200,325, 200,205, 100,145);
  fill (#FF5C33);
  quad(300,265, 200,325, 200,205, 300,145);
  fill (#CC2900);
  quad(200,205, 100,145, 200,85, 300,145);
  
  //orange triagles look like pyramid
  fill(#FF6600);
  color (#000000);
  triangle(100,265, 200,325, 200,205, 100,145);
  fill (#CC5200);
  triangle(300,265, 200,325, 200,205, 300,145);
}
  
  //lines inside the cube
  {noFill (2);
  triangle(200, 85, 300, 264, 102, 264);
  triangle(200, 324, 300, 144, 102, 144);
  }
  // circles
  fill (#FFFF00);
  ellipse(200, 200, 55, 55);
  ellipse(200, 85, 10, 10);
  ellipse(200, 324, 10, 10);
  ellipse(102, 144, 10, 10);
  ellipse(300, 144, 10, 10);
  ellipse(102, 264, 10, 10);
  ellipse(300, 264, 10, 10);
  
  //line covers the whole
  noFill (0);
  triangle (200, 0, 0, 400, 400, 400);
  triangle (0,200, 400,0,400, 400); 
  triangle (200,400, 400,0,0,0); 
   triangle (400,200, 400,0,0,200); 
   
   
            
 



}



