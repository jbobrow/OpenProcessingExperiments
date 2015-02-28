
int x = 0;
int lastSecond= 0;
void setup() {
  size(100, 100);
}

void draw() {
  background(0);
  int s = second();
    
  if (s <= 2) {
    fill(x*10, x, 100);
    ellipse (50, 50, x, x);   
    x++;
  }
    
  if (x>44) {
    x=0;
  }
    
  if (s != lastSecond) {
    println ( hour() + ":" + minute() + ":" + second());
    lastSecond = s;
  }
}
