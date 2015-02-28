
size(400, 400);
smooth();
noStroke();

int c = 50;

for(int x = 0; x < width; x +=50){
for(int y = 0; y < height; y += 50){
    c++;
    fill(250, 60, c);
    rect(x, y, 50, 50);
}
}
