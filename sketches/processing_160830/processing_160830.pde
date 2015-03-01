
size(500,500);
background(55);
noStroke();

int x = 0;
int y = 0;
for (int i = 51; i <= 255; i += 51) {
  fill(#EB3F70,i);
  ellipse(x-300, y+80, 100, 100);
  
  fill(#F5F5F5,i);
  ellipse(x-250, y+80, 100, 100);
  
  fill(#F5AA64,i);
  ellipse(x-200, y+80, 100, 100);
  
  fill(#1B8BBE,i);
  ellipse(x-150, y+80, 100, 100);
  
  fill(#FAD2D2,i);
  ellipse(x-100, y+80, 100, 100);
  
  fill(#96D25A,i);
  ellipse(x-50, y+80, 100, 100);
  
  fill(#F2CC2F,i);
  ellipse(x, y+80, 100, 100);
  
  fill(#875AD2,i);
  ellipse(x+50, y+80, 100, 100);
  
  fill(#EB3F70,i);
  ellipse(x+100, y+80, 100, 100);
  
  fill(#F5F5F5,i);
  ellipse(x+150, y+80, 100, 100);
  
  fill(#F5AA64,i);
  ellipse(x+200, y+80, 100, 100);
  
  fill(#1B8BBE,i);
  ellipse(x+250, y+80, 100, 100);
  
  fill(#FAD2D2,i);
  ellipse(x+300, y+80, 100, 100);
  
  fill(#96D25A,i);
  ellipse(x+350, y+80, 100, 100);
  
  fill(#F2CC2F,i);
  ellipse(x+400, y+80, 100, 100);
  
  fill(#875AD2,i);
  ellipse(x+450, y+80, 100, 100);
  
  fill(#EB3F70,i);
  ellipse(x+500, y+80, 100, 100);
  
  x += 80;
  y += 80;
}



