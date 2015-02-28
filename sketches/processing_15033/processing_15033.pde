
int i;
void setup() {

  size(800,600);
  background(0);
}
 
void draw() {
  i=0;
  while(i<800) {
  i=i+1;
  line(i,0,i,600);
  stroke(random(255), random(255),random(255));
}
} 

