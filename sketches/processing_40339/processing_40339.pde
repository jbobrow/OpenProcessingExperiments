
/* 
click to draw paint circles
*/





int as;

void setup() {
  size (600, 600);
  background (#0A3DFF);
  smooth();
  as = 20;

}

void draw() 
{  

  
   
     
      for (int i = 50; i < 1000; i = i+20) 
      {
        ellipse(i, i, i, i);
      }

      int qw = mouseX - (mouseX % as);
      int zx = mouseY - (mouseY % as );
      fill(255, 0, 0, 80);
      
  {  
  if (mousePressed == true) {
   
    fill(#0AFF4D);
  ellipse(mouseX, mouseY, as, as);
} else {
    fill(#0A3DFF,10);
  
}
  

}

}




