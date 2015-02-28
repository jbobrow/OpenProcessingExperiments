
//experimenting with vertex and for structure. 
//Didn't quite get what i wanted, but it's still an interesting study, i think.



size(600, 600);

background(0);

beginShape(LINES);
vertex(300, 300);
for(int a = 30; a <= 590; a += 30) {
  for(int b = 30; b <= 590; b += 30) {
    //if((a == 590)||(a == 10)) {
      stroke(a, b, a * (b - 10));
      strokeWeight(.5);
      noFill();
 
      
      vertex(a + 325, b + 300);
      vertex((a * (-10)), b * (-10));
      //endShape();
    //}
      //else { 
      
      //beginShape();
      //curveVertex(40, b);
      }
  }
  //vertex(590, 590);
  //for(
      endShape();
      //}
 
//beginShape();
//vertex(10, 300);
//bezierVertex(10, 500, 300, 200, 400, 500);
//bezierVertex(50, 300, 300, 500, 40, 500);
//endShape();



