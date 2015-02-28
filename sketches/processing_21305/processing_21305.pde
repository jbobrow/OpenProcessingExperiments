
int x0=250, y0=250;
void setup(){
  size(500,500);  
}
void draw(){
  int x1=x0+10*(int)random(-2,2);
  int y1=y0+10*(int)random(-2,2);
  line(x0,y0,x1,y1);
  y0=y1;
  x0=x1;
}
                                
