
//void setup() {
//
//  size(600, 600);
//  background(0);
//  stroke(255);
//  noFill();
//}
//
//
//
//void draw() {
//  int i = 50;
//  int x = 10;
//
//  while (i <= 600 && x <= 600) {
//
//    //    rect(i, 50, 10, 10);
//    //    rect(i, 100, 10, 10);
//    //    rect(i, 150, 10, 10);
//    //    rect(i, 200, 10, 10);
//    //    rect(i, 250, 10, 10);
//    //    rect(i, 300, 10, 10);
//    //    rect(i, 350, 10, 10);
//    //    rect(i, 400, 10, 10);
//    //    rect(i, 450, 10, 10);
//    //    rect(i, 500, 10, 10);
//    //    rect(i, 550, 10, 10);
//
//    arc(i, 10, 90, 90, 0, PI);
//    arc(i, 20, 90, 90, 0, PI);
//    arc(i, 30, 90, 90, 0, PI);
//    arc(i, 40, 90 ,90, 0, PI);
//    arc(i, 50, 90 ,90, 0, PI);
//
//    i = i+50;
//    x = x + 10;
//  }
//}


void setup() {

  size(600, 600);
  stroke(255);
  smooth();
  noFill();
  background(255);
}

void draw() {
  int i = 0;
  while ( i <= 600 ) {  
    int j = 0;
    while ( j <= 600 ) { 


      stroke(i, 100, 250, 100);
      arc(j, i, 100, 100, 0, PI);
      ellipse(j,i,100,100);      
      j = j + 50;
    }
    i = i + 50;
  }
}

