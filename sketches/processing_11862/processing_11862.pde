
//Dots Lines and Shapes

void setup (){

  size(600,600);

}

void draw (){

  background (230); 
  // drawing a rectangle where the properties are rect (x, y, width,hieght) x and y are top left
  rect (10,10,50,50);
  
 // drawing a circle where the properties are ellipse (x, y, width,hieght)x and y are in the middle of the shape
  ellipse (100,35,50,50); 
  //  point (x,y) 
  point (10, 100);
  //line this is the start xy position and the end xy position line (x,y , x,y)
  line (10, 120, 500, 120);
  //  this sets the 4 x and y positions of the quad shape
  quad (10,200,200,300,100,400,10,300);
  // this set the 3 x and y positions of the triangular shape
  triangle(300,200,500,300,300,400);
  // this sets both the x and y position of the start of the shape and the position of the handles
  //  Bezier (x1, y1, cx1, cy1, cx2, cy2, x2, y2);

  bezier (10,450, 400, 300, 200,500, 10, 550);

}









