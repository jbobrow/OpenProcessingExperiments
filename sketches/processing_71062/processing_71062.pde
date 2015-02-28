
int[] numbers = new int[250];
int[] circles = new int[250];
int l = 800;
int w = 800;
int q = 200;
int p = 200;
int tracker=1;
int eleven = -1;
int twelve = 0;
int v = 0;
void setup(){
size(500,500);
background(255,255,255);
}
void draw(){
int one=1;
int two=2;
int three=3;
int l = 800;
int w = 800;
for (int i = 0; i<80; i++) {
float r = random(0,255);
float g = random(0,255);
float b = random(0,255);
fill(r, g, b);
r = numbers[one];
g = numbers[two];
b = numbers[three];
one += 3;
two +=3;
three+=3;
eleven = 1;
twelve = 2;
v = 0;
while (v<tracker){
ellipse (circles[eleven],circles[twelve], l,w);
eleven+=2;
twelve+=2;
v+=1;
}
w= w-10;
l=l-10;
}
}
void mouseClicked() {
  eleven+=2;
  twelve+=2;
  circles[eleven]= mouseX;
  circles[twelve]= mouseY;
  tracker+=1;
}
