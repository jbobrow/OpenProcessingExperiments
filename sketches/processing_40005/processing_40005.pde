
size(800,800); 
smooth(); 
strokeWeight(2); 
for (int i = 20; i < 800; i += 20) {
  line(i, 0, i + i/2, 800); 
  line((i + i/2)*10, 800, i*1.2, 120);
  line((i - i/2)/10, 800, i*1.2, 120);
  stroke(255-(i/1.5));
}


