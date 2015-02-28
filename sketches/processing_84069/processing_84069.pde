
//fet per adrià sánchez gallego
int blocksize;

void setup() {

size(500,500);

blocksize = 15;

noStroke();

}


void draw() {

for(int y=0; y<height; y+=blocksize) {

for(int x=0; x<width;x+=blocksize) {

fill(random(0,64),random(128,223), random(223), 30);

ellipse(x,y,blocksize,blocksize);

}

}

int specialX = mouseX - (mouseX % blocksize);

int specialY = mouseY - (mouseY % blocksize);

fill(0);

ellipse(specialX, specialY, blocksize,blocksize);

}



