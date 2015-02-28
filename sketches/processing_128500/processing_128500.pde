
// homework 1
// copyright eunki chung
// eunkic@andrew.cmu.edu

size (400, 400);
background (29, 89, 129);

// background #1

for (int i = 0; i < 415; i = i+15) 
for (int j = 0; j < 415; j = j+15) {
  strokeWeight(0.5);
  stroke(41, 129, 185);
  line(i, j, i+15, j+15);
  line(i, j, i, j-15);
  line(i, j, i+15, j-15);
}

// background #2 

strokeWeight(1.5);
stroke(247, 228, 217, 70);

line (75, 0, 75, 400);
line (90, 0, 90, 400);
line (165, 0, 165, 400);
line (180, 0, 180, 400);
line (255, 0, 255, 400);
line (270, 0, 270, 400);

line (0, 82.5, 400, 82.5);
line (0, 90, 400, 90);
line (0, 187.5, 400, 187.5);
line (0, 195, 400, 195);
line (0, 292.5, 400, 292.5);
line (0, 300, 400, 300);

// character stroke weight and color

strokeWeight(3);
stroke(255, 95, 3);

// letter E 

line (75, 90, 75, 300);
line (82.5, 82.5, 82.5, 292.5);
line (90, 82.5, 90, 292.5);

line (75, 90, 135, 90);
line (82.5, 82.5, 142.5, 82.5);

line (75, 195, 135, 195);
line (82.5, 187.5, 142.5, 187.5);

line (75, 300, 135, 300);
line (82.5, 292.5, 142.5, 292.5);

// letter K

line (165, 90, 165, 300);
line (172.5, 90, 172.5, 292.5);
line (180, 82.5, 180, 292.5);

float a; 
a = sqrt(112.5);

line (172.5, 187.5, 232.5, 97.5);
line (180, 165, 232.5, 82.5);

line (165, 195, 232.5, 285);
line (172.5, 195+2*a, 232.5, 300);

// letter C 

line (255, 97.5, 255, 285.5);
line (262.5, 90, 262.5, 292.5);
line (270, 82.5, 270, 300);

line (270, 82.5, 330, 82.5);
line (262.5, 90, 322.5, 90);

line (262.5, 292.5, 322.5, 292.5);
line (270, 300, 330, 300);

//saveFrame("HW1.JPG");


