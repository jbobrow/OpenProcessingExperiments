
int cs = 20;
 
void setup() {
  size(640, 480);
  smooth();
}
void draw() {
  background(0);
 
fill(0);
for(int j = 0; j<=height/cs;j++){
for(int i = 0; i<=width/cs;i=i+2){
fill(0);
if(i>5)fill(mouseX,mouseY,random(1-255));
if(j<20)fill(205,92,92);
 triangle(i*cs, j*cs, random(mouseX),random(mouseY),10, 10);
    }
 
  }
}


