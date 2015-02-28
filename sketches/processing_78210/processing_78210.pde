
void setup() {
  size(600, 600);
 frameRate(1);
background(0);
 
}

void draw() {
int w = width;
int h = height;
int a = w/2;
int b = h/2;
int s = second();
int m = minute();

//ガイドライン 
stroke(255);
strokeWeight(2);
line(a,0,a,h);
line(0,b,w,b);

//ペン
strokeWeight(1);
s = s*5;

stroke(random(255*s/60),random(255*s/60),random(255*s/60));
line(a,s,a-s,b);
stroke(random(255*s/60),random(255*s/60),random(255*s/60));
line(a,s,a+s,b);
stroke(random(255*s/60),random(255*s/60),random(255*s/60));
line(a,h-s,a-s,b);
stroke(random(255*s/60),random(255*s/60),random(255*s/60));
line(a,h-s,a+s,b);
}
