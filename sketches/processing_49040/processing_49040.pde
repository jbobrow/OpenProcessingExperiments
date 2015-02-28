
/*
testImage1() {
  image(test1,50,50);
}
/*
testImage2() {
  image(test2,500,500);
}
*/


void magic() {
  ellipseMode(CENTER);
  for(int i=0;i<300;i++){
    ellipse(random(width),random(height),3,3);
  }
}

void mousePressed() {
  love = !love;
}


