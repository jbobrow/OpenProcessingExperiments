
int  i;
size(400,400);
background(255);
 
for (i = 0; i < 40; i++){
  noStroke();
  fill(4,163,255,255 / 10 * i);
  rect(0, height / 10 * i, 50, 50);
 
  fill(i,255,255,255 / 10 * i);
  rect(60, height / 10 * i, 50, 50);
   
  fill(i,200,255,255 / 10 * i);
  rect(120, height / 10 * i, 50, 50);
   
  fill(i,255,255,255 / 10 * i);
  rect(180, height / 10 * i, 50, 50);
   
   
    fill(4,163,255,255 / 10 * i);
  rect(240, height / 10 * i, 50, 50);
 
  fill(i,255,255,255 / 10 * i);
  rect(300, height / 10 * i, 50, 50);
   
  fill(i,200,255,255 / 10 * i);
  rect(360, height / 10 * i, 50, 50);
   
  fill(i,255,255,255 / 10 * i);
  rect(420, height / 10 * i, 50, 50);
   
   fill(i,255,255,255 / 10 * i);
  rect(480, height / 10 * i, 50, 50);
 
}
int eSize = 3;
 
 
 for(int x = 0; x <=width; x ++){
    
  fill(204,250,206,350);
    triangle(0,200,0,0,200,0);
    fill(204,237,252,350);
   triangle(400,200,200,400,400,400);
   fill(255,214,217,350);
    triangle(200,0,400,0,400,200);
    fill(244,247,195,350);
     triangle(0,200,0,400,200,400);
     fill(255,247,251);
ellipse(200,200,150,150);
    
   
    
 }


