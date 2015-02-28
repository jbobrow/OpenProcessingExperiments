
void setup(){
  size(500,500);
  background(255);
    smooth();
}
  
  
void draw(){
  background(255);
  fill(0, 0, 0);
  
    drawCross(mouseX-15, mouseY-15, 30, 4, 4); //mouse croce
    drawCross(mouseX+15, mouseY+15, 30, 4, 4); //mouse croce
    drawCross(mouseX+15, mouseY-45, 30, 4, 4); //mouse croce
    drawCross(mouseX-45, mouseY+15, 30, 4, 4); //mouse croce
    drawCross(mouseX-45, mouseY-45, 30, 4, 4); //mouse croce
     
     
   stroke(6);
   fill(20, 100, 20);
   strokeWeight(2);
  
  
  fill (90, 60, 60);
  
    ellipse(0, 0, 300, 300);
  ellipse(500, 500, 300, 300);
  fill ( 30, 120, 80);
  ellipse(0, 500, 300, 300);
  ellipse (500, 0, 300, 300);
  
  
  
  
  ellipse(0, 0, 200, 200);
  ellipse(500, 500, 200, 200);
  fill ( 30, 60, 100);
  ellipse(0, 500, 200, 200);
  ellipse (500, 0, 200, 200);
  
  ellipse(0, 0, 100, 100);
  ellipse(500, 500, 100, 100);
  fill ( 30, 60, 250);
  ellipse(0, 500, 100, 100);
  ellipse (500, 0, 100, 100);
  
  

  
    fill(255,255,255);
  drawCross(0,420,80,7,7);//croce basso_sinistra
  drawCross(420,420,80,7,7);//croce basso_destra 
  drawCross(0,0,80,7,7);//croce alto_sinistra
  drawCross(420,0,80,7,7);//croce alto_destra 
  
  
 
  
  fill(0,0,0);
  drawCross(0,450,50,7,7);//croce basso_sinistra
  drawCross(450,450,50,7,7);//croce basso_destra 
  drawCross(0,0,50,7,7);//croce alto_sinistra
  drawCross(450,0,50,7,7);//croce alto_destra 


 

  
}
  
  
void drawCross(float x, float y, float crossSize, int c, float w) {
   
  stroke(0,0,0);
  strokeWeight(5); 
  line(x, y, x+crossSize, y+crossSize);
  line(x+crossSize, y, x, y+crossSize);
}


