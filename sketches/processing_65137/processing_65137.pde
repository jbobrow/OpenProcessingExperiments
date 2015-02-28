
public void pattern(float x, float y) {
 // pushMatrix();
  //for (l = i; l<=400; i=i+20) {
  // for (m = j; m<=400; m=m+30)
   //{
   // stroke(222, 185, 92, 180);
    // noFill();
   //   arc (l, m, m+2, 10, 20, 20);
      for (n= q1+5; n<=height; n=n+140) {
    for (o = q2+5; o<=width; o=o+15) {
      fill(r, g, b,250);
      noStroke();
      ellipse(o+100, n+100, 30, 30+o);
     // rotate(PI+o*n);
    }
  }

  for (l= i+50; l<=width; l=l+25) {
    for (m = j+50; m<=400; m=m+25) {
      fill(r1, g1, b1, j);
      noStroke();
      ellipse(m, l, m+20-l, l+20-m);
     // rotate(PI+x*y);
    }
  }



   for (n = q1; n<=width; n=n+135) {
   for (o = q2; o<=height; o=o+175) {
  fill(r1, g1, b1, 195);
   
  quad(n, o*2, o, n+2, n*o, n, o, n);
  quad(n+10, o*4, o*35, n+15, o, n*4, o*6, n);
   //popMatrix();*/
   }
   }
  //popMatrix();
}


