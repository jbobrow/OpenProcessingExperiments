
void setup () {
  size(300,300);
  smooth();
}

void draw () {
  background(255);
 
 strokeWeight(1);
 for(int i=30; i<200; i=i+55) {
   for(int j=30;j<200; j=j+55) {
     line(30+i,200,30+j,100);
   }
 }
  
}
