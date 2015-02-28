
// Setup
size(600,600);
noStroke();
background(0);
// Random
int[] hue = { 0, 60, 240 }; // Degrees
int index1 = int(random(hue.length));
int index2 = int(random(hue.length));
int index3 = int(random(hue.length));
while(index2 == index1)
index2 = int(random(hue.length));
while(index3 == index1 || index3 == index2)
index3 = int(random(hue.length));
// Draw
// Usa HSB
colorMode(HSB,360,100,100);
// Rettangolo giallo
//fill (255, 255, 0);
fill (hue[index1], 100, 100);
rect (20, 20, 160, 280);
// Rettangolo rosso
//fill (255, 0, 0);
fill (hue[index2], 100, 100);
rect (200, 20, 380, 450);
// Rettangolo blu
//fill (0, 0, 255);
fill (hue[index3], 100, 100);
rect (20, 490, 160, 90);
// Usa RGB e imposta il colore bianco
colorMode(RGB, 255);
fill (255);
// Rettangolo bianco 1
rect (20, 320, 160, 150);
// Rettangolo bianco 2
rect (200, 490, 280, 90);
// Rettangolo bianco 3
rect (500, 490, 80, 90);

