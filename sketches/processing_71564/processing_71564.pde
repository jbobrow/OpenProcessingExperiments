
void setup(){
  size(350,410);
}

void draw(){
  background(219,213,197);
  
  //red triangle
  translate(75,90);
  rotate(radians(-5));
  fill(162,0,11);
  noStroke();
  rect(0,13,150,9);
  rect(15,0,40,4);
  resetMatrix();
  
  //yellow triangle set, left line
  translate(45,231);
  rotate(radians(37));
  fill(237,170,0);
  noStroke();
  rect(0,0,28,20);
  resetMatrix();
  
  translate(77,183);
  rotate(radians(36)); //rotate(PI/4.4);
  rect(0,0,33,45);
  resetMatrix();
  
  translate(159,66);
  rotate(radians(39));
  rect(0,0,44,135);
  resetMatrix();
  
  //yellow triangle set, three right cluster
  translate(171,125);
  rotate(radians(39));
  rect(0,0,16,49);
  rect(18,0,30,35);
  resetMatrix();
  
  translate(171,125);
  rotate(radians(35.5));
  rect(35,50,20,15);
  resetMatrix();
  
  //black quad big
  fill(0,0,0);
  noStroke();
  quad(132, 182, 49, 286, 120, 350, 202, 230);
  
  //black quad mid
  fill(0,0,0);
  noStroke();
  quad(227, 290, 180, 368, 134, 340, 182, 263);
    
  //black quad small
  fill(0,0,0);
  stroke(30,50,100);
  //noStroke();
  quad(257, 330, 236, 367, 199, 348, 222, 309);
  
  //blue rectangle big
  translate(40,310);
  rotate(radians(23));
  fill(27,26,100);
  noStroke();
  rect(0,15,73,16);
  resetMatrix();

  //blue rectangle small
  translate(40,310);
  rotate(radians(28));
  fill(27,26,100);
  noStroke();
  rect(127,-140,40,10);
  resetMatrix();
}
