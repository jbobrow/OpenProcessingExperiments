
void setup(){
size(1000, 600);
}

void draw(){
colorMode(RGB);
background(111, 215, 255);

for(int i = 0; i <= 230; i+=2 ){
colorMode(HSB);
stroke(i, 255, 255);
noFill();
arc(width/2, height, width - i, width - i, PI, 2*PI);
}

for(int i = 0; i < 200; i++){
colorMode(RGB);
fill(255, 100);
noStroke();
ellipse(100 + random(-100, 100), height + random(-50, 50), 30, 30);
}

for(int i = 0; i < 200; i++){
colorMode(RGB);
fill(255, 100);
noStroke();
ellipse(width - 100 + random(-100, 100), height + random(-50, 50), 30, 30);
}
}
