
void pattern(float x, float y) {
 // pushMatrix();
  //for (l = i; l<=400; i=i+20) {
  // for (m = j; m<=400; m=m+30)
   //{
   // stroke(222, 185, 92, 180);
    // noFill();
   //   arc (l, m, m+2, 10, 20, 20);
      for (n= q1+5; n<=height; n=n+140) {
    for (o = q2+5; o<=width; o=o+15) {
      fill(o, n, n,250);
      noStroke();
      ellipse(random(o), random(n), random(30+n), random(30+o));
     // rotate(PI+o*n);
    }
  }

  for (l= i+50; l<=width; l=l+25) {
    for (m = j+50; m<=400; m=m+25) {
      fill(n+l, m, random(255), i);
      noStroke();
      ellipse(random(m), random(l), random(20-l), random(20-m));
     // rotate(PI+x*y);
    }
  }



   for (n = q1; n<=width; n=n+135) {
   for (o = q2; o<=height; o=o+175) {
  fill(random(150), random(m), random(o), 85);
   
  quad(n, o*2, o, n+2, n*o, n, o, n);
  quad(random(n), random(o*4), random(o*35), random(n+15), random(o), random(o,n), random(o), random(n));
   //popMatrix();*/
   }
   }
  //popMatrix();
  delay(450);
}


