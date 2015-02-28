
void setup() {
  size(320, 480);
 frameRate(15);
}

void draw() {
int h = hour(); 
int m = minute();
int s = second();

h = h * width /24;
m = m * height /60;


line(h,0,h,height);
line(0,m,width,m);
ellipse(h,m,s*2,s*2);

}
