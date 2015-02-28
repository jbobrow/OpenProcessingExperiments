
int x = 250;
int y =250;
float r;
 
void setup(){
size(500,500);
smooth();
}
 
void draw(){
background(0);
noStroke();
fill(255,10);
for(float r = 100;r<500;r=r+1){
ellipse(x,y,random(r),random(r));
}
}

