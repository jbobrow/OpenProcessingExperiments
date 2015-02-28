
size(400, 400);
smooth();
stroke(250, 80, 150);
 
int c = 70;
 
for(int x = 0; x < width; x +=50){
for(int y = 0; y < height; y += 50){
    c++;
    fill(250, 60, c);
    rect(x, y, 50, 50);
}
}
