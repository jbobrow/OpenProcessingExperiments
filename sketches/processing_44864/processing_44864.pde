
//credit: http://www.openprocessing.org/visuals/?visualID=4377
PImage f;
int n,i;
float a,g;

void setup(){
size(n=600,n-7);
f = loadImage("falls.png");
 image(f,0,0);
}

void draw(){
for(i=1;i++<n;stroke(g=random(170),g,225),point(a,a=random(n)));
blend(1,1,n,n-3,2,1,n-4,n,0);
filter(98);
filter(77);}


