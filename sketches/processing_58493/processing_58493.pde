
float r=150;
float g=0;
float b=0;

void setup() {
     size(200,200);
}
    void draw() {
     background(255);
     stroke(0);
     line(100,0,100,200);
     line(0,100,200,100);
noStroke();
fill(r,g,b);
if (mouseX < 100 && mouseY < 100) {
  rect(0,0,100,100);
  r= r+1;
} else if (mouseX > 100 && mouseY < 100) {
  rect(100,0,100,100);
  r=r-1;
} else if (mouseX < 100 && mouseY > 100) {
  rect(0,100,100,100);
  r=r-1;
} else if (mouseX > 100 && mouseY > 100) {
  rect(100,100,100,100);
  r=r+1;  
}
if(r>255)  {
  r=255;
}else if (r<0)  {
  r=0;
}
    }


