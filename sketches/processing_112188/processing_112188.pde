
size(600,600);
background(255, 204, 0);

// Points of the first triangle below
int point1x = 30;
int point1y = 75;
int point2x = 58;
int point2y = 20;
int point3x = 86;
int point3y = 75;

//Loop for repeating the triangles along the x-axis

for (int i=0; i<8; i++){
  triangle(point1x, point1y, point2x, point2y, point3x, point3y);
  point1x = point1x + 60;
  point1y = point1y + 0;
  point2x = point2x + 60;
  point2y = point2y + 0;
  point3x = point3x + 60;
  point3y = point3y + 0;
  
}

// Loop for repeating the triangles down the y - axis

for (int i=0; i<32; i++){
  triangle(point1x, point1y, point2x, point2y, point3x, point3y);
  point1x = point1x + 0;
  point1y = point1y + 15;
  point2x = point2x + 0;
  point2y = point2y + 15;
  point3x = point3x + 0;
  point3y = point3y + 15;
}

//Loop for diagonal line of triangles

for (int i=0; i<16; i++){
  triangle(point1x, point1y, point2x, point2y, point3x, point3y);
  point1x = point1x - 30;
  point1y = point1y - 30;
  point2x = point2x - 30;
  point2y = point2y - 30;
  point3x = point3x - 30;
  point3y = point3y - 30;
  
}
fill(255,80,115); 
ellipse(150,400,200,200);
fill(0);
ellipse(150,400,100,100);


 


