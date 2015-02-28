
int blocksize;

void setup() {

size(460,210);

blocksize = 12;

noStroke();

}


void draw() {

for(int y=0; y<height; y+=blocksize) {

for(int x=0; x<width;x+=blocksize) {

fill(random(0,64),random(200), random(203), 30);
ellipse(x,y,blocksize,blocksize);

}

}

int specialX = mouseX - (mouseX % blocksize);

int specialY = mouseY - (mouseY % blocksize);

fill(random(255),random(255),random(255));

rect(specialX, specialY, blocksize,blocksize);

}

