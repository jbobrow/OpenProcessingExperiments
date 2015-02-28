
// Control 2: Reptition
// Exercises

size(800,600);
background(235,113,47);

// tedious line coding

/*line(0,0,20,height);
line(0,0,40,height);
line(0,0,60,height);
line(0,0,80,height);
line(0,0,100,height);*/

// awesome fast coding

/* for (int x = 20; x <=100; x += 20) {
  line(0,0,x,height);
}
*/

// who cares about lines it's pattern time!!!

noStroke();
fill(247,239,213,5);
rectMode(CENTER);
for (int a = 0; a <= 800; a += 20) {
  for (int b = 0; b <=500; b += 40) {
    rect(a,a,b,b);
  }
}

strokeWeight(1);
for (int x = 0; x <= 800; x += 30) {
  for (int y = 0; y <= 600; y += 30) {
    stroke(247,239,213,x*0.1);
    ellipse(x,y,40,40);
  }
}

// logic!!

rectMode(CENTER);
for (int c = 50; c <= 800; c += 5) {
  stroke(173,51,21,c);
  if (c < 80) {
    strokeWeight(0.05);
    rect(c,c,40,40);
  } else if (c > 80) {
    strokeWeight(c*0.004);
    rect(c*2,c*2,c,c);
  }
}


