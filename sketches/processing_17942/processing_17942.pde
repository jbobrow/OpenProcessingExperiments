
size(250, 250);
background(#890E12);
strokeWeight(1.2);
for(int x = 20; x < 250; x += 35) {
  line(0, x, 250, x);
}
strokeWeight(4);
stroke(#640B0E, 140);
for(int x = 25; x < 250; x += 10) {
  line(0, x, 250, x);
}
strokeWeight(10);
stroke(#640B0E, 250);
for(int x = 10; x < 250; x += 100) {
  line(0, x, 250, x);
}
noFill();
stroke (200, 130);
smooth();
strokeWeight(1);
for(int b = 20; b < 250; b += 35) {
    for(int a = 10; a < 250; a += 80) {
    ellipse(a, b, 5, 5);
  }
  for(int a = 20; a < 250; a += 80) {
    ellipse(a, b, 10, 10);
  }
  for(int a = 30; a < 250; a += 80) {
    ellipse(a, b, 15, 15);
   }
   for(int a = 40; a < 250; a += 80) {
    ellipse(a, b, 20, 20); 
   }
   for(int a = 50; a < 250; a += 80) {
    ellipse(a, b, 25, 25); 
   }
    for(int a = 50; a < 250; a += 80) {
    ellipse(a, b, 15, 25); 
    }
  for(int a = 60; a < 250; a += 80) {
    ellipse(a, b, 20, 20); 
   }
  for(int a = 70; a < 250; a += 80) {
    ellipse(a, b, 15, 15);
   } 
     for(int a = 80; a < 250; a += 80) {
    ellipse(a, b, 10, 10);
  }
    for(int a = 90; a < 250; a += 80) {
    ellipse(a, b, 5, 5);
  }
}




