
// ALL THE PATTERNS!

size(800,600);
background(255);

for (int a = 5; a < 850; a +=25) {
  for (int b = 10; b < 850; b += 25) {
    noFill();
    strokeWeight(1);
    if ((a < 400) && (b < 400)) {
      stroke(227,242,172);
      bezier(width*0.5,height*0.5,a,b,a,b,a+25,b+25);
    } else if ((a > 400) && (b > 400)) {
      stroke(240,46,148);
      bezier(width*0.5,height*0.5,a,a,b,b,a+25,b+25);
    } else if ((a > 400) && (b < 400)) {
      stroke(119,126,199,100);
      bezier(width*0.5,height*0.5,b,b,a,a,a+25,b+25);
    } else if ((a < 400) && (b > 400)) {
      stroke(179,253,255);
      bezier(width*0.5,height*0.5,b,a,b,a,a+25,b+25);
    }
    fill(0);
    ellipse(a+50,b+50,3,3);
  }
}


