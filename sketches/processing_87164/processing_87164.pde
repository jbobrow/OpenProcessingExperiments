
//assignment 1

int s = 0; 
int f = frameCount;

void setup () {
size(800,800);
background (50,80,100);
smooth();
}




void draw(){
 background (50,80,100);
 println (frameCount);
for (int c = s; c >=  0; c = c -20) {

fill (0,0,500,5);
ellipse (400,400,800,c);
fill(255,255,10,5);
ellipse (400,400,c,800);
}
s++;
if (f>=100) {
  s--;
}
}






