
void setup(){
size(500, 500);
background(10);
smooth();
noStroke();
noFill();
}
void draw(){
float c = 0;
while (c < 100){
rotate(0.05);
fill(random(255));
textSize(30);
text("HELLO, HAVE A NICE DAY", 110, 10);
c = c + 1;
}
}
