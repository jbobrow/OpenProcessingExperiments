
void setup(){
size (500,300); 
background(255);
}

void draw()
{
 stroke(0, 0, 0);
   fill (RGB, 0,90,205);
   triangle (50, 0, 250, 110, 450, 0);

stroke(0, 0, 0);
  fill (RGB, 0,90,205);
  rotateY(radians(180)); 
  triangle (50, 300, 250, 170, 450, 300);

stroke(0, 0, 0);  
  fill (RGB, 0,90,205);
  rotateY(radians(60));
  triangle (0, 45, 190, 140, 0, 250);

stroke(0, 0, 0);
  fill (RGB, 0,90,205);
  rotateY(radians(270));
  triangle (500, 45, 305 , 140, 500, 250);
}

