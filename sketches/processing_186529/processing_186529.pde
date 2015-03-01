
void setup(){
size(1000, 600);
background(0);
colorMode(HSB);
}
void draw(){
for (int i=500; i>0; i=i-1) {
    stroke((i*0.1)+(mouseX/4),250,250);
  ellipse(500, 300, i, i);
 }
 for(int i=50;i>0;i++);
 rect(50,50,i,i);
}
