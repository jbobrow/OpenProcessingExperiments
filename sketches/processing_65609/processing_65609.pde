
class Scrollbar {
  int scrollbarCount = 3;
  float x_1 = (width-255)/2;
  float x_2 = x_1+256;
  float[] x = new float[scrollbarCount+1];
  float[] y = new float[scrollbarCount+1];
  color[] col = new color[scrollbarCount+1];
  float[] value = new float[scrollbarCount+1];
  float w = 10;
  float h = 10;
  int index;
  
  void initScrollbar() {
    stroke(0);
    coordinates();
    scrollbar();
  }
  
  void coordinates() {
    y[1] = height/7;   
    y[2] = height/7+20;      
    y[3] = y[2]+20;
    col[1] = color(255, 0, 0);
    col[2] = color(0, 255, 0);
    col[3] = color(0, 0, 255);
  }
  
  void scrollbar() {
    for (int i=1;i<scrollbarCount+1;i++) {
      
      fill(col[i]); 
      line(x_1, y[i], x_2, y[i]);
      rectMode(CENTER);
      rect(x[i], y[i], w, h);
      if (x[i]<x_1) x[i] = x_1;
      if (x[i]>x_2) x[i] = x_2;
      
      if (mousePressed == true)
        if ( mouseY >= y[i]-h/2 && mouseY <= y[i]+h/2) {            
          x[i] = mouseX;
          if (mouseX < x_1) x[i] = x_1;  
          if (mouseX > x_2) x[i] = x_2;
        }
      value[i] = abs(x_2-x[i]-255);
    }
  }
}  

