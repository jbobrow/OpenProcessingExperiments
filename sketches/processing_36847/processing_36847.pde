
size (800, 800);
background (0, 0, 0);
strokeWeight (2);

int lineHNumb = height/2 ; 
int linewNumb = width/2 ; 
int space = 10 ; 

for (int i = 0; i < linewNumb; i++) {
  for (int h = 0; h < lineHNumb; h++) {
    
  float value1 = map (i, 1, linewNumb/2, 0, 255);
  float value2 = map (i, 1, linewNumb/2, 255, 0);
  
  stroke (value1);
  line (0, i*space, width, i*space);
  stroke (value2);
  line (i*space, 0,  i*space, height);
  } 
}
                
                                
