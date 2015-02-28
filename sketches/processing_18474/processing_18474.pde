
size(250,250);
background(255);
smooth();
stroke (39,50,190,30);
for(int i=100; i<150; i++) {
  float r = random(8);
  strokeWeight(r);
  float offset = r*39.0;
  line(i-1, 30, i+offset, 149);
  line(i+5, 30, i+offset, 10);
  line(i-10, 100, i-offset, 10);
 line(i+5, 100, i-offset, 10);
  line(i+20, 250, i-offset, 10);
  line(i+20, 400, i-offset, 40);
  line(i+20, 400, i+offset, 40);
}

//borrowed from hair loop




