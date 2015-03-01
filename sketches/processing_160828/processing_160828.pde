
size(500,500);
background(55);
noStroke();

int x = 0;
int y = 0;
for (int i = 51; i <= 255; i += 51) {
  fill(235,63,112,i);
  ellipse(x-300, y+80, 100, 100);
  
  fill(245,245,245,i);
  ellipse(x-250, y+80, 100, 100);
  
  fill(245,170,100,i);
  ellipse(x-200, y+80, 100, 100);
  
  fill(27,136,190,i);
  ellipse(x-150, y+80, 100, 100);
  
  fill(250,210,210,i);
  ellipse(x-100, y+80, 100, 100);
  
  fill(150,210,90,i);
  ellipse(x-50, y+80, 100, 100);
  
  fill(242,204,47,i);
  ellipse(x, y+80, 100, 100);
  
  fill(135,90,210,i);
  ellipse(x+50, y+80, 100, 100);
  
  fill(235,63,112,i);
  ellipse(x+100, y+80, 100, 100);
  
  fill(245,245,245,i);
  ellipse(x+150, y+80, 100, 100);
  
  fill(245,170,100,i);
  ellipse(x+200, y+80, 100, 100);
  
  fill(27,136,190,i);
  ellipse(x+250, y+80, 100, 100);
  
  fill(250,210,210,i);
  ellipse(x+300, y+80, 100, 100);
  
  fill(150,210,90,i);
  ellipse(x+350, y+80, 100, 100);
  
  fill(242,204,47,i);
  ellipse(x+400, y+80, 100, 100);
  
  fill(135,90,210,i);
  ellipse(x+450, y+80, 100, 100);
  
  fill(235,63,112,i);
  ellipse(x+500, y+80, 100, 100);
  
  x += 80;
  y += 80;
}



