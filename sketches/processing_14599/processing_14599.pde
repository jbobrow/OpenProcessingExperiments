
void setup() {
  size(200,200);
  }
  void draw(){
  for (int i=0; i<200; i=i+5) {
   for(int j=0; j<200; j=j+5) {
     if(!(50<i&&150>i&&50<j&&150>j)){
    point(i,j);
   }
  }
 }
}                
