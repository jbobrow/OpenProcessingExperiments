
// ALL THE PATTERNS!

size(800,800);
background(0);

strokeWeight(1);
stroke(255,100);
line(width*0.5,0,width*0.5,height);
line(0,height*0.5,width,height*0.5);
line(width*0.75,0,width*0.75,height*0.5);
line(width*0.5,height*0.25,width,height*0.25);
line(width*0.25,height*0.5,width*0.25,height);
line(0,height*0.75,width*0.5,height*0.75);
strokeWeight(0.25);

for (int i = 0; i <= 800; i += 10) {
  stroke(255,5);
  line(i,0,i,height);
  line(0,i,width,i);
}

for (int a = 0; a <= 800; a += 10) {
   if (a < 400) {
     stroke(255);
     line(a,400,400,400-a);
   } else if (a > 400) {
     line(a,400,400,800-(a-400));
  }
}

for (int b = 0; b <= 800; b += 40) {
  for (int c = 0; c <= 800; c += 50) {
    if ((b <= 400) && (c <= 400)) {
      noFill();
      stroke(113,96,164);
      ellipse(width*0.75,height*0.25,b,c);
      rectMode(CENTER);
      rect(width*0.25,height*0.75,b,c);
    }
  }
}


