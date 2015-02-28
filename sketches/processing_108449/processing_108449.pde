
void chara(int a, int b) {
  pushMatrix();
  translate(a, b);
  stroke(0);
  strokeWeight(2);
  fill(255);

  scale(map(a, 0, 600, 2, 0));
  rotate(map(b, 0, 600, 0, radians(3600)));
 
translate(-50,-50);
  fill(111, 225, 000);
  ellipse(50, 50, 60, 60);
  //me
  line(40, 35, 32, 45);
  line(60, 35, 68, 45);
  //kuchi
  fill(a, b, 100);
  rect(40, 55, 20, 10);
  fill(111.225, 000);
  ellipse(50, 50, 30, 10);
  ellipse(50, 70, 30, 10);
  //ashi
  line(72, 70, 90, 90);
  line(28, 72, 10, 90);



  popMatrix();
}


