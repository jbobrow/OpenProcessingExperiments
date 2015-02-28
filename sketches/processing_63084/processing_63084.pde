
size(500, 500);
background(255,243,62);

smooth();


for (int i =10; i<=width; i+=10)
{ 

  for (int j= 10; j<=height; j+=10) 
  { 
    point(i, j);
    
    
    ellipse ( i, j + i, 30, 30 );
    line( i, j, i +16, j+16);
    line( i+16, j+(i/5.0), i, j +16);
  }
}


