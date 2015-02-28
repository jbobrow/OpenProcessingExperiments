
size(200,200);

float y=100;
void setup() {
  size(200,200);
  background(255);
}

void draw() {
  noStroke();
  for(int y=0; y<200; y=y+8) {
   for(int x=0; x<200; x=x+8) {
     float i = dist(y,x,10,10);
     fill(random(255),random(255),random(255));
 stroke((sin(i*0.1)+1)*130);
 ellipse(x,y,5,5);
  
   }
  }
}

