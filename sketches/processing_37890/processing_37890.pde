
size (800, 800);
background (255);
strokeWeight (3);
smooth();
 
int lineHNumb = height ;
int linewNumb = width ;
int space = 50 ;
 
for (int i = 1; i < linewNumb; i++) {
  for (int h = 1; h < lineHNumb; h++) {
     
   
  stroke (0);
  strokeJoin(ROUND);
  line (0, i*space, width, i*space);
  line (i*space, 0,  i*space, height);
  line (0, i*space, width-i*space, height);
  line (width, i*space, i*space, height);
  line (width-i*space, 0, 0, height-i*space);
  line (i*space, 0, width, height-i*space);
  }
}
                
