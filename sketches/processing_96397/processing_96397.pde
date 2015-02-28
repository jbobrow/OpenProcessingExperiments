
size(200, 200);
colorMode(HSB, 50);
for (int i = 0; i < 200; i++) {
for (int j = 0; j < 200; j++) {
stroke(0, i, j);
point(i, j);
}
}
noStroke();
for(int i=1; i<200; i=i+2){
fill(0, 0, 0);
rect(i*10, 80, 10, 10);
rect(i*10, 120, 10, 10);
rect(80, i*10, 10, 10);
rect(120, i*10, 10, 10);
}
