
void setup() {
  background(255);
  size(500, 500);
}

void draw() {

  for (int i=0; i<200; i+=5) {
    FirstFunction(i, i);
  }
  //    for(int i=0; i<200; i+=5){
  //     SecondFunction (color(i, 10, 200));
  //    }
  //
}

void FirstFunction(int w, int h) {
  ellipseMode(CENTER);
  fill(243, 171, 252, 10);

  if (mouseX>200) {
    fill(127, 20);
  }
  
    if (mouseY>300) {
    fill(200,200,0,20);
  }
  ellipse(mouseX, mouseY, w, h);
}

//void SecondFunction(color a){
//  ellipseMode(CENTER);
//  fill(a);
//  ellipse(30, 50, 20,20);
//}


