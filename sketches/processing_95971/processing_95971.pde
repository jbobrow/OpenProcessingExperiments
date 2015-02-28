
float b;
float incrementor = 0;
int number = 30;

void setup() {
  size(500,500);
}

void draw () {
  background(255);
  b = map(sin(incrementor), -1, 1, 0, 100);
  fill(0,200,200, b);
  incrementor += .05;
  for(int i = 0; i<number; i++) {
    float s = map(second()*i, 0, 60, 0, i*7);   
    ellipse(width/3, s/2, 5, 5);
    ellipse(width/3*2, s/2, 5, 5);
    ellipse(width, s/2, 5, 5);
    ellipse(0, s/2, 5, 5);
  }
   for(int i = 0; i<number; i++) {
   float s = map(second()*i, 0, 60, 0, i*7);   
   ellipse(s/2, height/4, 5, 5);
   ellipse(s/2, height/2, 5, 5);
   ellipse(s/2, height/4*3, 5, 5);
   ellipse(s/2, height, 5, 5);
   ellipse(s/2, 0, 5, 5);
   }
   for(int i = 0; i<number; i++) {
   fill(200,0,0,b);
   noStroke();
   float s = map(second()*i, 0, 60, 0, i*2);  
   rect(s/2,s/2,5,5);
   rect(-s/2,-s/2,5,5);
}
}



