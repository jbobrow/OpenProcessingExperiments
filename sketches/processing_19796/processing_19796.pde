
float fast = 500;

 
void setup() {
  size(250,250);
  background (232,28,90);
  smooth();
}

void draw () {
  background (0,12);
  strokeWeight(0.3);
  stroke(255,50);
  noFill();
    frameRate (fast);

 
 for (int y=10; y<1000; y=y+4){
  float b = random(20);
  float a = 40;
  stroke(random(670),random(170),random(200),25);
  strokeWeight(a/b);
  line(10,60+y+b,300,10);}

for (int y=20; y<100; y=y+2){
 noStroke();
   fill (random(255), 90);
   ellipse (random(250),random(250),random(10),random(10));
}
}
  
void keyPressed (){
  if (key=='s'){
    saveFrame("disco.png");
  }
}


