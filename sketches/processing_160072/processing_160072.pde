
void setup () {
  size(700,700);
}

void draw() {
float x = 0;
float y = 0;
while(x < width) {
while(y < height) {
fill(random(255),random(255),random(255),40);
rect(x,y,50,50);
y=y+10;
}
x = x+10;
y = 0;
}
}
