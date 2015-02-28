
float blocksize;

void setup() {

size(588,444);

blocksize = 1;

noStroke();

}


void draw() {

PImage img = loadImage("waterfall.jpg");

background (img);
  
rect(0,0,0,0);

for(float y = 50; y < 368; y+=blocksize) {

for(float x = 270; x < 375; x+=blocksize) {

fill(random(255),random(255));

rect(x,y,blocksize,blocksize);

float velocitat = 1;

x = x + velocitat;


}

}

}



