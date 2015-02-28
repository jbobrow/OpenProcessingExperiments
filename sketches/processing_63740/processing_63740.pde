


//colorMode(HSB, 360, 100, 100);
//background(74,98,77);


//colorMode(RGB, 1, 1, 1);
//background(0,1,0.5);


//float r = random(255);
//float g = random(255);
//float b = random(255);

void setup() {
colorMode(HSB, 360, 100, 100);
size(500,500);
}



void draw() {
float h = random(360);

background(255);

fill(h,90,90);
ellipse( random(width), random(height), 50,50);
}

