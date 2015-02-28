
//Michell philpott PS1 #5
void setup(){
 size (280, 280);
  smooth();
}

void draw () {
  for(int i=0; i < 280; i += 35) {
    for (int j = 0; j < 280; j += 35)
    {
      if((i+j)%2==0) {
        fill(187,28,232);
      }else {
        fill(252);
      }
      rect(i, j, 50,50);
    }
  }
} 

