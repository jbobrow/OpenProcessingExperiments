
int n = 250;
int x;
float y = 1;
float noiseY;

size(600, 200);
background(200);
stroke(50);

for(int i = 2; i < n; i++) {
y += .05;
x = i* (width/n);
noiseY = noise(y) * height;
line(x, height, x, noiseY);
}
