
byte b[];
int j = 4000;
int step = 200;

void setup() {
size(1000, 612);
b = loadBytes("howmanyyearsleft.jpg"); 
}

void draw() {  
for(int i = j; i<j+step; i++) {
  b[i] = 0;
}
j+=step;

saveBytes("output.jpg", b);
//delay(100);
PImage img = loadImage("output.jpg");
image(img,0,0);
}

