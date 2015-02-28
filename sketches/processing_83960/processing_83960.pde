
int blocksize;

void setup() {

size(400,400);

blocksize = 40;

noStroke();

}


void draw() {

for(int y=0; y<height; y+=blocksize) {

for(int x=0; x<width;x+=blocksize) {

fill(random(0,100),random(120,255), random(255), 30);

rect(x,y,blocksize,blocksize);

}

}






fill(50,50,50);
rect(80,80,80,80);
rect(240,80,80,80);
rect(160,160,80,40);
rect(120,200,40,40);
rect(240,200,40,40);
rect(120,280,40,40);
rect(240,280,40,40);
fill(0);
rect(120,120,40,40);
rect(240,120,40,40);
fill(0);
rect(160,200,80,40);
rect(120,240,160,40);
if (mousePressed){ 
fill(random(255),random(0),random(0));
rect(120,120,40,40);
rect(240,120,40,40);
fill(255);
text("Sssssssssssshhhhhhhhhhh.....", 120, 50); 
text("BOOOOOOOOOOOOOOOOOOOOOM!!!!",100,360);
}
}



