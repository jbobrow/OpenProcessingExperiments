
size(600,600);

int y = 0;
int x = 0;

while(x < width) {
    while(y < height) {
    stroke(0,0,255);  
    fill(255,0,0);  
    rect(x,y,10,10);
    y = y + 10;
    }
    x = x + 10;
    y = 0;
}
