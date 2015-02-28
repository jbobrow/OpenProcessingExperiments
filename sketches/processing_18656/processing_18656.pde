
void setup() {
size(250,250);
smooth();
}

void draw() {
  frameRate (10);
  
background(#e1c7ac);

//liness

for (int y=105; y<1000; y=y+1){
  float b = random(20);
  float a = 40;
  stroke(random(670),random(70),random(270),25);
  strokeWeight(a/b);
  line(10,60+y+b,300,10);}

}




