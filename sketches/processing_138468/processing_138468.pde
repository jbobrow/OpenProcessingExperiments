
// Color 1
// Exercises

  size(800,800);

/*colorMode(RGB);
for (int a = 0; a <=100; a++) {
  float R1 = 200 + (a*2.4);
  float G1 = 30 + (a*0.7);
  float B1 = 180 - (a*0.3);
  stroke(R1,G1,B1);
  line(a,0,a,100);
  line(100,a,200,a);
  for (int b = 100; b <= 200; b++) {
    float R2 = 20 + (b);
    float G2 = 220 - (b*1.2);
    float B2 = 60 + (b*4);
    stroke(R2,G2,B2);
    line(100,b,200,b);
    line(b,100,b,200);
    line(0,b,100,b);
  }
}*/

colorMode(RGB);
for (int i = 0; i <= 800; i++) {
  float R = 30 + (i*0.4);
  float G = 180 - (i*0.3);
  float B = 150 + (i);
  stroke(R,G,B);
  line(0,i,width*0.5,height*0.5);
  line(i,0,width*0.5,height*0.5);
  line(width,i,width*0.5,height*0.5);
  line(i,height,width*0.5,height*0.5);
}

colorMode(HSB);
for (int a = 0; a <= 800; a++) {
  float Hue = 200 - (a*0.0001);
  stroke(Hue,100,100,a*0.3);
  line(a,0,a,height);
  line(0,a,width,a);
}

colorMode(RGB);
for (int b = 100; b < 800; b += 100) {
  for (int c = 0; c < 800; c += 100) {
    float B2 = 150 + (c*0.1);
    noStroke();
    fill(40,140,B2,80);
    ellipse(b+1,c+1,50,50);
    fill(#288c96);
    ellipse(b+1,b+1,50,50);
  }
}


