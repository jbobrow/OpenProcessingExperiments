
float a=100;
void setup() {

 size(200,200);
}
void draw() {
for(int a=0; a<200; a=a+20) {
 for(int b=0; b<200; b=b+20) {  
 fill(random(255),random(70),random(255),random(255));
  noStroke();
  ellipse(a,b,20,20);
}
}
}
