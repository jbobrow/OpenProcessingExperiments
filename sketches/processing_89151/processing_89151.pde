
color[] bahamas = {#003056, #04518C, #00A1D9, #47D9BF, #F2D03B};

int n = 100;
int x;
float y = .05;
float noiseY;

size(600, 200);
background(0);
stroke(bahamas[int(random(0, 4))]);
strokeWeight(6);


for(int i = 1; i < n; i++) {
 y +=.02;
 x = i*(width/n);
 noiseY = noise(y) *height;
 line(x, height, x, noiseY); 
}
