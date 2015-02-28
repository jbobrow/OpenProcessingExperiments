
//HART__________________________________________

void setup() {
  size(335, 400);
  smooth();
  fill(0);
}
//_______________________________________________
void draw() {
  background(222, 222, 222);

  //Ellipsen: Hanteln
  for (int i=0;i<500;i=i+1) {
    for (int j=0;j<500;j=j+50) {
      ellipse(i*67, j, 40, 40);
    }
  }


  //Linien: Hantelstange 1
  strokeWeight(6.5);
  for (int i=0;i<500;i=i+50) {
    line(0, i+50, 50, i+50);
  }


  //Linien: Hantelstange 2
  strokeWeight(6.5);
  for (int i=0;i<500;i=i+50) {
    line(150, i+50, 200, i+50);
  }
  
   //Linien: Hantelstange 3
  strokeWeight(6.5);
  for (int i=0;i<400;i=i+50){
  line(250,i+50,350,i+50);
  }
}
