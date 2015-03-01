
/* @pjs preload="roll.jpg";*/

PImage roll ;

void setup() {
  size(468, 468);
  roll= loadImage("roll.jpg");
}
void draw() {
 // fill(100);
  //for (int i = 0; i < 101; i++) {
   // for (int j = 0; j < 101; j++) {

      //rect(20*i, 20*j, 75, 75) ;
     // image(roll, 30*i, 20*j, 55, 55, 15, 15, 15, 15);
 //   }
 // }
  fill(255);
  for (int i = 0; i < 101; i++) {
    for (int j = 0; j < 101; j++) {

      image(roll, 60*i, 60*j, 60, 60);
    }
  }


  //ellipse(20, 20, 10, 10) ;
}





