
size(100,100);
background(105,44,70);
smooth();
strokeWeight(2);
stroke(200,80);
 
for (int i = 0; i < 100; i +=4) {
  line (i+i/2, i, i*1.2, i-2);
  line (i/2, i, i*1.2, i-2);
  line (i/5, i+100, i*1.2, i);
  line (i, i/2, i*15, i-20);
}
