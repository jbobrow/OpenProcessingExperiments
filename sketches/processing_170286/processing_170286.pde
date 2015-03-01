
float noiseScale=0.02;
PImage[] c = new PImage[2];
int i = 0;
void setup(){
size(1050,920,P3D);
c[0] = loadImage("m1.jpg");
c[1] = loadImage("m2.jpg");
}
void draw() {
background(0);
image(c[i],0,0);
for (int x=0; x < width; x++){
float noiseVal = noise((mouseX+x)*sin(noiseScale), mouseY*noiseScale);
stroke(0,0,noiseVal*255);
line(x,0, x, mouseY+noiseVal*80); 
}
}
void mouseClicked(){
if(i==0) i++;
else if(i==1) i--;
}


