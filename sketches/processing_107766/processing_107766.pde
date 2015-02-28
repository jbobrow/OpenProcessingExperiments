
int x = 600;
int y = 300;

int tmp_x = 0;
int tmp_y = 0;

void setup(){
  size(x, y);
  background(255);
}

void draw(){
  drawFractal();  
}

void drawFractal(){
  int sel = (int)random(3)+1;
  switch(sel%3){
    case 0:
      tmp_x = tmp_x/2;
      tmp_y = (tmp_y + y)/2;
    break;
    case 1:
      tmp_x = (tmp_x + x)/2;
      tmp_y = (tmp_y + y)/2;    
    break;
    default:
      tmp_x = (tmp_x + x/2)/2;
      tmp_y = tmp_y/2;    
    break;
  }

  point(tmp_x, tmp_y);
}
