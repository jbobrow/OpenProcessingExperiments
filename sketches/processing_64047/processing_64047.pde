

size(600,600);
background (255);

int espacio = 1;
int y = height;
stroke (0,150,0,80); 
 
 
for(int x = 0; x < width; x = x + espacio){
  float y2 = y - random(250);
  float x2 = x + random(-20,20);
  line(x,y,x2,y2);


}


