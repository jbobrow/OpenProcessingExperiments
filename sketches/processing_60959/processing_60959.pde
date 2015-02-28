
//WEICH_________________________________________
void setup() {
  size(335, 400);
  smooth();
  stroke(191);
}

//_______________________________________________
void draw() {
  background(222, 222, 222);

  //Linien
    strokeWeight(0.25);
  for (int i=0;i<400;i=i+30) {
    for (int j=0;j<400;j=j+30) {
      line(0+i,400,0+j,250);
    }
  }


}
