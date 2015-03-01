
int r;
int n;
float a=0;
float p=5.0;
float c;
void setup() {
size(700,550);
n=1;

frameRate(20);
} 

void draw() {
//background(255);
translate(20,40);

for(int i=0;i<width;i+=10+mouseY/20){
for(int j=0;j<height;j+=10+mouseX/20){
point (i,j);
strokeWeight(random(r));
strokeCap(SQUARE);
r+=n;
if(r>=20){
n*=-1;
}else{
n++;
}
if (mousePressed){
j+=20*cos(a);
i+=20*sin(a);
a+=0.5;
c=-255;
}else{
  c=1;
}
stroke(random(c,200),random(c,255),random(c,100),200);
//stroke(random(255),random(255),random(100));

 if (keyPressed == true && key=='s') {
    saveFrame("yourName.png");
 }
}
}}
