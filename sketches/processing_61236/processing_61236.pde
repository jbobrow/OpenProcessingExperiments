
void setup () {
  size(300,300);
  smooth();
}

void draw () {
  background(0);
 

 for(int i=30; i<300; i=i+55) {
   for(int j=30;j<300; j=j+55) {
     ellipse(30+i,200,30+j,100);
     
   }
 }
 
 
 
 for(int i=40; i<300; i=i+55) {
   for(int j=40;j<300; j=j+55) {
     ellipse(40+i,200,30+j,100);
     
   }
 }
  
  
}
