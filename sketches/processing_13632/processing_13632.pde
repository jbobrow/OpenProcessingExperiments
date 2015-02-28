
float y=100;
void setup() {
  size(200,200);
  background(0);
}
void draw() {
  noStroke();
  for(int y=0; y<200; y=y+10) {
   for(int x=0; x<200; x=x+10) {
     float a = dist(x,y,50,50);
     fill(random(255),random(255),random(255));
 stroke((sin(a*0.1)+1)*130);
 ellipse(x+a,y+a,5,5);
 
   }
  } 
}
