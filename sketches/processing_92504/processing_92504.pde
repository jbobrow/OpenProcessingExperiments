
int blocksize;

void setup() {

size(600,600);

blocksize = 25;

noStroke();

}


void draw() {

for(int y=0; y<height; y+=blocksize) {

for(int x=0; x<width;x+=blocksize) {

fill(random(0,255),random(0,255), random(0,255), 30);

rect(x,y,blocksize,blocksize);

}

}

int specialX = mouseX - (mouseX % blocksize);

int specialY = mouseY - (mouseY % blocksize);

fill(random(0,100),random(0,100), random(0,100));

rect(specialX, specialY, blocksize,blocksize);

}



