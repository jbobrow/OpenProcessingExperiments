


void setup () {
  size(500, 500);
}


void draw() {

  background(255, 255, 0);

  for (int i=0; i<width; i+=1) {
    for (int j=0; j<height; j+=1) {
      stroke(250, 0, 180, i-45);
      line(i, j, i, j);
    }
  }



  for (int a=1; a<20; a+=2) {
    for (int b=1; b<20; b+=2) {
      noStroke();
      ellipse(a*20, b*20, mouseX*1, mouseY*1);
      fill(255, 0, 255, 8);
    }
  }
}









//for (int i=0; i<width+5; i+=25) {
//for (int j=0; j<height+5; j+=25) {
//ellipse(i, j, 25, 25);
//fill(255,0,random(255));


