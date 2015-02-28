
size(330, 330);
background(255);
smooth();
int tSize = 20;
int tx = 0;
int ty = 0;

for (int x = 0; x <=9; x++){
  for (int y = 0; y <= 9; y++){
    tx = tSize+(tSize+(tSize/2))*x;
    ty = tSize+(tSize+(tSize/2))*y;
    fill(map(y, 0, 9, 255, 0));
    triangle(tx, ty, tx+tSize, ty, tx+(0.5*tSize), ty+tSize);
  }
}

                
                
