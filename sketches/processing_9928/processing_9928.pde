
int x0 = 250;
int y0 = 250;
int xsig;
int ysig;
void setup(){
  size(500,500);
  background(250);

}
void draw(){
  xsig = x0 + (int)random(-10,10);
  ysig = y0 + (int)random(-10,10);
  if(xsig < 0 & xsig > 250 & ysig < 0 & ysig >250){
  }
  else{
    line(x0, y0, xsig, ysig);
    x0 = xsig;
    y0 = ysig;
  }
}



