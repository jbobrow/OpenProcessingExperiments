
int x=0;
int y=0;
int q=500; 
int count =0;
void setup() {
  size(q, q);
}
void draw() {
  while (count<q) {
    line(x, 0,x,q);
    line(0, y,q,y);
   x= x+50;
   y= y+50;
    count = count + 50;
  }
}


