
float col = 100;

void setup(){
size(800, 800);
background(255);
smooth();
}


void draw(){

//background(255);
frameRate(10);
fill(col + random(50),col/2,255 - col,150);
noStroke();

float cx = 150 + random(-50,50);
float cy = random(800);

float csize = random(50,100);

ellipse(cx,cy,csize,csize);

cx = 650 + random(-50,50);
cy = random(800);

csize = random(50,100);

ellipse(cx,cy,csize,csize);

cx = 370 + random(-50,50);
cy = random(800);

csize = random(5,50);

rect(cx,cy,csize,csize);
}

void mousePressed(){
//save("dots" + millis() + ".png");
col = random(255);
}

