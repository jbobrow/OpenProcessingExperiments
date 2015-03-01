
int option = 0;


void setup() {
  size(640, 500);
  background(255);
  strokeWeight(.5);
}

void draw() {
  background(225);



  if (option == 0) {
    for (int j = 50; j < height - 50; j = j + 20) {
      for (int i = 50; i < width - 50; i = i + 20) {
        line(i, j, i+10, j+10); 
        line(i, j+10, i+10, j);
      }
    }
  }


  if (option == 1 ) {
    for (int j = 50; j < width - 50; j = j + 20) {
      for (int i = 50; i < height - 50; i = i + 20) {
        //line(j,i, width/2, height/2);
        //noFill();
        line(j, i, width/2, height/2);
      }
    }
  }


  if (option == 2 ) {
    for (int j = 50; j < width - 50; j = j + 20) {
      for (int i = 50; i < height - 50; i = i + 20) {
        //line(j,i, width/2, height/2);
        //noFill();
        fill(j/3, i/3, 20);
        ellipse(j, i, 40, 40);
      }
    }
  }
  
  
}

void mousePressed() {
  option = option +1;
  option = option % 3; 
  println(option); 
}  

