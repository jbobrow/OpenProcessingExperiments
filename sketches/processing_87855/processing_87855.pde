
size(500,500);
background(255);
smooth();

for (int i = 100; i < width; i += 20) {
  stroke (206,194,163);
  strokeWeight(2);
  if (i>270) {
    stroke (112,110,100);
    strokeWeight(4);
  }
  
    if (i>340) {
    stroke (48,46,36);
    strokeWeight(6);
  }
  
  line(i,0,i+i/2,80);
  line(i+i/2,80,i*1.2,120+i);
}


