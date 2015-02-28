
float b=50;
//float a =100;

void setup(){
  size(600,400);
frameRate(10);
}

void draw (){
  background(255);

 
for (int d = 50; d>0; d-= 1) {
  fill(0);
 noStroke();
  rect(random(10,550),b/2,d,b); 
}
for (int d = 50; d>0; d-= 5) {
  fill(0);
 noStroke();
  rect(random(10,550),b*2,d,b);

}

for (int d = 20; d>0; d-= 1) {
  fill(0);
 noStroke();
  rect(random(10,550),b*4,d,b);

}
for (int d = 10; d>0; d-= 1) {
  fill(0);
 noStroke();
  rect(random(10,550),b*6,d,b);

}
}


