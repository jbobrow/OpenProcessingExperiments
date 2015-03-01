
void setup() {
size(600,600);
colorMode(HSB);
strokeWeight(5);
}
void draw(){
for(int i=500; i>0;i=i-1){ 

stroke(i+mouseY,255,255);
ellipse(56,150,i,i);
stroke(i+mouseX,245,255);
ellipse(70,i,45,i);

stroke((i/7)+(mouseX),mouseY,255);
ellipse(mouseX,mouseY,mouseX,mouseY);
  }

  }

