
int blocksize;
int tamany;
void setup() {

size(460,200);

blocksize = 10;

noStroke();

}


void draw() {

   
  
for(int y=0; y<height; y+=blocksize) {

for(int x=0; x<width;x+=blocksize) {

fill(random(50,64),random(255), random(255), 50);

ellipse(x,y,blocksize,blocksize);

}

}

int specialX = mouseX - (mouseX % blocksize);

int specialY = mouseY - (mouseY % blocksize);

fill(255);

ellipse(specialX, specialY, blocksize,blocksize);



ellipse(specialX, specialY, blocksize,blocksize);

ellipse(specialX, 190, 80,blocksize);


}


