
int option = 2;

void setup() {
  size(640, 480);
  strokeWeight(.5);
  smooth();
}

void draw() {
  background(255);
  if (option == 1) {
    for (int j=50; j<height-50; j= j+20) {
      for (int i=50; i<width-50; i=i+20) {
        line(i, j, i+10, j+10);
        line(i, j+10, i+10, j);
      }
    }
  }
  
  if (option ==2 ){
      for (int i=0; i<height; i= i+10) {
        line(0, i, width/2, height/2);
        line(width/2,height/2, height, width);
        
      }
  }

if(option ==3){
        for (int i =50; i<width -50; i= i+20) {
          for (int j =50; j<height -50; j= j+20) {
            fill(i/3, j/3, 20, 20);
            ellipse(i, j, 40, 40);
          }
        }
      }
}
      
 void mousePressed() {
   option = option+1;
   option = option%3;
   
 }
