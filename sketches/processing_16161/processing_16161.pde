

void setup() {

  background(50);
  size(800,500);
}

void draw() {
  smooth();
  translate(80,100);
  scale(2.5);
  stroke(255,47,5);
  strokeWeight(5);
  fill(255,47,5);
  quad(70,10,80,35,70,60,60,33);
  quad(22,42,45,42,70,60,37,60);
  quad(45,70,70,60,55,83,35,90);
  quad(94,40,111,40,98,55,70,60);
  quad(70,60,93,69,100,88,82,81);
  strokeWeight(0);
  fill(0,221);
  ellipse(67,58,2,1);
  ellipse(73,58,2,1);
  strokeWeight(0);
  fill(255,3,61,210);
  ellipse(63,61,4,4);  
  ellipse(77,61,4,4);

  strokeWeight(3);   
  fill(255,47,5);
  rect(69,60,1,60);
  stroke(0,113);
  strokeWeight(1);   
  line(69,63,71,63);



  // triangle(70,60,71,110,69,110);
  translate(130,0);
  stroke(255,167,3);
  strokeWeight(5);
  fill(255,167,3);
  quad(58,13,70,39,68,74,26,39);
  quad(82,13,114,39,72,74,72,39);
  strokeWeight(3);
  rect(69,60,1,60);
  strokeWeight(0);
  fill(0,221);
  ellipse(67,50,2,2);
  ellipse(73,50,2,2);
  strokeWeight(0);
  fill(255,3,91,70);
  ellipse(63,53,4,4);  
  ellipse(77,53,4,4);


  strokeWeight(3);   
  fill(255,47,5);
  rect(69,60,1,60);
  stroke(0,123);
  strokeWeight(1);   
  line(68,55,72,55);
}


