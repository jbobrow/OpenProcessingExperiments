
float midaCos = 20;

 void setup (){
   size (500,500);
 }
 
 void draw (){
   
   background (222,199,181);
   strokeWeight (3);
   
  //antenes
  stroke (mouseX,137, mouseY, mouseY);
  fill(mouseX,137,mouseY,mouseY);
  line (mouseX-7, mouseY-7, mouseX-25, mouseY-25);
  line (mouseX+7, mouseY-7, mouseX+25, mouseY-25);
  ellipse (mouseX-26,mouseY-26, mouseX/8, mouseY/8);
  ellipse (mouseX+26, mouseY-26, mouseX/8, mouseY/8);
  
   //cos
   stroke (mouseX,12,mouseY,mouseX);
   fill (mouseX,12,mouseY,mouseX);
   ellipse (mouseX, mouseY, midaCos, midaCos);
   ellipse (mouseX, mouseY+20, midaCos, midaCos);
   ellipse (mouseX, mouseY+40, midaCos, midaCos);
   ellipse (mouseX, mouseY+60, midaCos, midaCos);
   ellipse (mouseX, mouseY+80, midaCos, midaCos);
   ellipse (mouseX, mouseY+100, midaCos, midaCos);
   

  //ales
  fill (mouseX,115,mouseY,mouseX);
  stroke (mouseX,115,mouseY,mouseX);
  ellipse (mouseX-45, mouseY+30, mouseX/4, mouseY/4);
  ellipse (mouseX -45, mouseY+70, mouseX/4, mouseY/4);
  ellipse (mouseX+45, mouseY+30, mouseX/4, mouseY/4);
  ellipse (mouseX+45, mouseY+70, mouseX/4, mouseY/4);
  fill (mouseX,149,mouseY,mouseY);
  stroke (mouseX,149,mouseY,mouseY);
  ellipse (mouseX-45, mouseY+30, mouseX/6, mouseY/6);
  ellipse (mouseX-45, mouseY+70, mouseX/6, mouseY/6);
  ellipse (mouseX+45, mouseY+30, mouseX/6, mouseY/6);
  ellipse (mouseX+45, mouseY+70, mouseX/6, mouseY/6);
 }
  
