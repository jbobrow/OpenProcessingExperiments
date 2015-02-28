
void setup () {
  size(600,560);
}


void draw() {
  background(50, 100, 120);
  
   for(int i=0; i<600; i = i+30) {
    for (int j=0; j<600; j= j+10) {
  
    
     textSize(50);
     fill(i,j,80);
     text("8", i, j);
     
     fill(20,50,30);
     stroke(255);
     rect(i,j,10,10);
     
   
   }
  }  
}
