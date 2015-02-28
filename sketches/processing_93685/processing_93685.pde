
//Roberta
void setup() {
  size(200, 200);
  background(255);
}
 
 
void draw() {
 stroke(150,30,0);
  for (int x=15,y=100;x<140;x=x+10) {
    //stroke(#464225);
    strokeWeight(3);
    line(x, y, x-15, y+15);
    y=y-15;
  }
  for (int x=70,y=10;x<160;x=x+10) {
    //stroke(#464225);
    strokeWeight(3);
    line(x, y, x+15, y+15);
    y=y+15;
  }
  stroke(0);
  line(20, 100, 20, 190);
  line(20, 190, 150, 190);
  line(150, 138, 150, 190);
  noStroke();
  fill(#FAD205);
  ellipse(160,30,30,30);
  noStroke();
  fill(#212121);
  rect(0,190,200,10);
}
