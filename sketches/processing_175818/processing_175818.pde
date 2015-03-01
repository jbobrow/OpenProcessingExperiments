
int x_global = 0, y_global = 0, s_global = 30;
int cell_x = 0;
int cell_y = 0;
color tinto = color(200);

void setup()  {
    size(270, 270);
    cell(x_global, y_global, s_global, color(255));
    triple(x_global, y_global, s_global, color(255));
    block(x_global, y_global, s_global, color(255));
    row(x_global, y_global, s_global);
    cellarray(x_global, y_global, s_global);
    drawLines(x_global, y_global, s_global);
}

void cell(int x, int y, int s, color tinto)  {
    fill(tinto);
    rect(x, y, s, s);
}

void triple(int x, int y, int s, color tinto)  {
  fill(tinto);
    for(int i=0; i<3; i++)  {
    cell(x+i*s, y, s, tinto);
  }
}

void block(int x, int y, int s, color tinto)  {
    fill(tinto);
      for(int i=0; i<3; i++)  {
         triple(x, y+i*s, s, tinto);
      }
}

void row(int x, int y, int s)  {
    for(int i=0; i<3; i++)  {
        if(tinto == color(200)) {
            tinto = color(200);
        }   else    {
            tinto = color(255)  
        }
      block(x+i*s*3, y, s);
    }
}

void cellarray(int x, int y, int s)  {
    for(int i=0; i<3; i++)    {
       row(x, y+i*s*3, s);
    }
}

void drawLines (int x, int y, int s)    {
 strokeWeight(3);
    for(int i=0; i<3; i++)    {
     x +=(s*3);
     line(x, 0, x,s*9);
   }
    for(int i=0; i<3; i++){
     y +=(s*3);
     line(0, y, s*9, y);
   }
}


void mousePressed() { 
    cell_x=(mouseX-x_global)/s_global; 
    cell_y=(mouseY-y_global)/s_global;
}

void draw() { 
    if(mousePressed) { fill(255, 0, 0);
    ellipse(x_global+s_global*cell_x+s_global/2, y_global+s_global*cell_y+s_global/2, s_global/4, s_global/4); 
    } 
}
